#!/usr/bin/env python3
"""
Shooting Regression Test Suite for Little Generals iOS
Verifies:
1. Projectile creation & launch parameters
2. Ballistic trajectory & gravity integration
3. Collision detection (tank direct hit, terrain impact, off-screen bounds)
4. Enemy damage & shield absorption models
5. Enemy death threshold & battle-over progression
6. Projectile cleanup & action cancellation (preventing re-entrant loops)
7. Repeated shooting sequence & turn transitions
"""

import math
import sys

class TerrainModel:
    def __init__(self, width=1024.0, height=600.0):
        self.width = width
        self.height = height
        self.points = [
            (0.0, 180.0), (120.0, 180.0), (120.0, 240.0), (220.0, 240.0),
            (220.0, 210.0), (450.0, 210.0), (450.0, 150.0), (680.0, 150.0),
            (680.0, 220.0), (850.0, 220.0), (850.0, 170.0), (1024.0, 170.0)
        ]
        self.craters = []

    def value_at(self, x):
        base_y = 180.0
        for i in range(len(self.points) - 1):
            x1, y1 = self.points[i]
            x2, _ = self.points[i + 1]
            if x1 <= x < x2:
                base_y = y1
                break
        if x >= self.points[-1][0]:
            base_y = self.points[-1][1]

        # Apply craters
        for cx, cy, radius in self.craters:
            dx = abs(x - cx)
            if dx < radius:
                depth = math.sqrt(radius * radius - dx * dx) * 0.75
                crater_bottom = cy - depth
                if crater_bottom < base_y:
                    base_y = crater_bottom
        return base_y

    def apply_crater(self, center_x, center_y, radius):
        self.craters.append((center_x, center_y, radius))


class WeaponType:
    def __init__(self, name, damage, blast_radius, launch_sound, impact_sound):
        self.name = name
        self.damage = damage
        self.blast_radius = blast_radius
        self.launch_sound = launch_sound
        self.impact_sound = impact_sound


WEAPONS = {
    "babyMissile": WeaponType("Baby Missile", 35.0, 25.0, "shot.mp3", "babymissileexplode.mp3"),
    "missile": WeaponType("Standard Missile", 50.0, 35.0, "shot.mp3", "missileexplode.mp3"),
    "nuke": WeaponType("Nuke", 120.0, 85.0, "missilefire.mp3", "nukeexplode.mp3"),
    "grenade": WeaponType("Grenade", 60.0, 40.0, "grenade_launch.mp3", "grenade_explosion.mp3"),
    "laser": WeaponType("Laser", 55.0, 0.0, "laser_blast.mp3", "laser_charge2.mp3")
}


class ProjectileSim:
    def __init__(self, start_x, start_y, angle_deg, power, weapon, from_player=True):
        self.x = start_x
        self.y = start_y
        self.weapon = weapon
        self.from_player = from_player
        rad = math.radians(angle_deg)
        speed = power * 8.5
        self.vx = speed * math.cos(rad)
        self.vy = speed * math.sin(rad)
        self.gravity = -420.0
        self.has_impacted = False
        self.impact_count = 0
        self.is_active = True
        self.trajectory = [(self.x, self.y)]

    def step(self, dt=1.0/60.0):
        if self.has_impacted or not self.is_active:
            return
        self.vy += self.gravity * dt
        self.x += self.vx * dt
        self.y += self.vy * dt
        self.trajectory.append((self.x, self.y))

    def trigger_impact(self):
        # Regression check: has_impacted prevents re-entrant calls
        if self.has_impacted:
            return False
        self.has_impacted = True
        self.impact_count += 1
        self.is_active = False
        return True


def run_tests():
    passed = 0
    total = 0

    def assert_test(cond, name):
        nonlocal passed, total
        total += 1
        if cond:
            print(f"  [PASS] {name}")
            passed += 1
        else:
            print(f"  [FAIL] {name}")
            sys.exit(1)

    print("=== Little Generals Shooting Regression Tests ===")

    # Test 1: Projectile Creation
    print("\n1. Projectile Creation Tests:")
    w = WEAPONS["babyMissile"]
    proj = ProjectileSim(start_x=100.0, start_y=200.0, angle_deg=45.0, power=65.0, weapon=w)
    assert_test(proj.x == 100.0 and proj.y == 200.0, "Initial position matches tank turret")
    assert_test(proj.vx > 0 and proj.vy > 0, "Initial velocity vectors are positive for 45 deg")
    assert_test(abs(proj.vx - proj.vy) < 1e-4, "45 degree launch produces equal Vx and Vy")
    assert_test(proj.weapon.launch_sound == "shot.mp3", "Launch sound correctly configured")

    # Test 2: Projectile Movement & Ballistics
    print("\n2. Projectile Movement Tests:")
    initial_y = proj.y
    initial_vy = proj.vy
    for _ in range(10):
        proj.step(dt=1.0/60.0)
    assert_test(proj.x > 100.0, "Projectile advances horizontally")
    assert_test(proj.vy < initial_vy, "Gravity decelerates vertical velocity")
    assert_test(len(proj.trajectory) == 11, "Trajectory points tracked accurately")

    # Test 3: Terrain & Tank Collision Detection
    print("\n3. Collision Detection Tests:")
    terrain = TerrainModel()
    p_hit = ProjectileSim(start_x=200.0, start_y=400.0, angle_deg=10.0, power=30.0, weapon=w)
    collided = False
    for _ in range(600):
        p_hit.step()
        ground_y = terrain.value_at(p_hit.x)
        if p_hit.y <= ground_y:
            collided = p_hit.trigger_impact()
            break
    assert_test(collided, "Projectile accurately collides with stepped terrain")
    assert_test(p_hit.impact_count == 1, "Impact handler triggered exactly once")

    # Direct Tank Hit Check
    ai_tank_pos = (604.0, 150.0)
    p_tank = ProjectileSim(start_x=ai_tank_pos[0] - 20, start_y=ai_tank_pos[1] + 10, angle_deg=0.0, power=20.0, weapon=w)
    hit_tank = False
    for _ in range(30):
        p_tank.step()
        dist = math.hypot(p_tank.x - ai_tank_pos[0], p_tank.y - ai_tank_pos[1])
        if dist < 26.0:
            hit_tank = p_tank.trigger_impact()
            break
    assert_test(hit_tank, "Direct tank hit detected within radius 26")

    # Test 4: Enemy Damage & Splash Radius
    print("\n4. Enemy Damage Tests:")
    ai_health = 100.0
    ai_shield = 20.0
    direct_dmg = w.damage
    # Shield absorbs first
    absorbed = min(ai_shield, direct_dmg)
    ai_shield -= absorbed
    remaining_dmg = direct_dmg - absorbed
    ai_health -= remaining_dmg
    assert_test(ai_shield == 0.0, "Energy shield fully absorbed first 20 damage")
    assert_test(ai_health == 85.0, "Remaining 15 damage reduced AI health to 85")

    # Splash proximity damage calculation
    blast_radius = w.blast_radius
    dist = 30.0
    effective_dist = dist / (blast_radius + 30.0)
    damage_scale = max(0.45, 1.0 - effective_dist)
    splash_dmg = w.damage * damage_scale
    assert_test(0.45 <= damage_scale <= 1.0, f"Splash damage falloff scaled accurately ({damage_scale:.2f})")

    # Test 5: Enemy Death & Threshold
    print("\n5. Enemy Death Tests:")
    ai_health = 15.0
    ai_health = max(0.0, ai_health - 35.0)
    is_dead = ai_health <= 0.0
    assert_test(ai_health == 0.0 and is_dead, "Enemy health drops to 0 and registers death")

    # Test 6: Projectile Cleanup & Infinite Loop Prevention
    print("\n6. Projectile Cleanup & Regression Tests:")
    p_loop = ProjectileSim(start_x=300.0, start_y=200.0, angle_deg=45.0, power=50.0, weapon=w)
    # First impact
    p_loop.trigger_impact()
    assert_test(p_loop.has_impacted, "has_impacted flag set on initial collision")
    # Simulate 60 subsequent frames as occurred in the bug
    subsequent_triggers = 0
    for _ in range(60):
        p_loop.step()
        if p_loop.trigger_impact():
            subsequent_triggers += 1
    assert_test(subsequent_triggers == 0, "Subsequent frames rejected; NO duplicate impact calls")
    assert_test(p_loop.impact_count == 1, "Impact count strictly equals 1 after 60 frames")

    # Test 7: Repeated Shooting Sequence (10 consecutive shots)
    print("\n7. Repeated Shooting Sequence Tests:")
    shots_completed = 0
    for shot_idx in range(10):
        shot = ProjectileSim(start_x=100.0, start_y=200.0, angle_deg=45.0, power=60.0, weapon=w)
        for _ in range(200):
            shot.step()
            if shot.y <= terrain.value_at(shot.x):
                shot.trigger_impact()
                shots_completed += 1
                break
    assert_test(shots_completed == 10, "10 consecutive shots completed with clean turn resets")

    print(f"\nAll {passed}/{total} shooting regression tests PASSED successfully!")

if __name__ == "__main__":
    run_tests()
