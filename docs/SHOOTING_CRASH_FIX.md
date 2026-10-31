# Shooting Crash Fix & Projectile Lifecycle Report

## 1. Root Cause Analysis

When firing any weapon in `BattlefieldScene`, the projectile movement was driven by an `SKAction.repeatForever(...)` block scheduled on the projectile node.

```swift
let flight = SKAction.repeatForever(SKAction.run { [weak self, weak projectile] in
    guard let self = self, let proj = projectile else { return }
    ...
    if let terrain = self.terrain, proj.position.y <= terrain.valueAt(x: proj.position.x) {
        let impactPos = CGPoint(x: proj.position.x, y: terrain.valueAt(x: proj.position.x))
        proj.removeFromParent()
        self.handleImpact(pos: impactPos, weapon: weapon, ...)
        return
    }
})
projectile.run(flight)
```

### The Failure Cascade
1. While `proj.removeFromParent()` removed the node from the SpriteKit scene hierarchy, `proj.removeAllActions()` was **not called**.
2. Because the action block closure retained `proj`, the action continued executing on every frame (60 FPS).
3. On every frame after the collision, `proj.position.y <= terrain.valueAt(x: proj.position.x)` remained `true`.
4. As a result, `handleImpact(...)` was invoked 60 times per second indefinitely:
   - `SoundManager.shared.playSound(...)` created new `AVAudioPlayer` instances 60 times a second, causing an infinite machine-gun sound loop.
   - `applyCrater(...)` and `updateTerrainMesh()` repeatedly excavated the terrain mesh.
   - `endTurn()` was called 60 times per second, rapidly toggling `isPlayerTurn` back and forth and scheduling multiple concurrent AI turns, freezing the engine.

## 2. Projectile Lifecycle & Collision Fixes

1. **State Guard:** Added `var hasImpacted = false` local to `spawnProjectile(...)` to guarantee that collision code executes at most once per projectile.
2. **Action Cancellation:** Explicitly invoked `proj.removeAllActions()` before `proj.removeFromParent()` upon direct tank hit, terrain collision, or off-screen exit.
3. **Turn Transition Delay:** Replaced immediate `endTurn()` calls with `scheduleEndTurn(delay: 0.7)` so `isProjectileActive` remains `true` while the explosion visual plays, preventing premature re-firing.
4. **Roller Weapon Guard:** Added `var hasExploded = false` guard inside `rollAlongTerrain(...)` to avoid duplicate explosion triggers when traversing terrain edges.

## 3. Enemy Damage & Death Handling Fixes

1. **Direct & Splash Damage:** Checked splash proximity radius (`weapon.blastRadius + 18`) to apply falloff damage even on near-misses.
2. **Health Depletion & Death:** When player or AI health reaches 0, `destroyTank(isPlayer:)` triggers:
   - Spawns an explosive blast at the tank's coordinate.
   - Removes the destroyed tank sprite.
   - Plays `tank_explode1.mp3`.
   - Transitions to `BattleOverScene` after a 1.2s dramatic delay.

## 4. Supporting Audio Fixes

- In `SoundManager.swift`, explicitly set `player.numberOfLoops = 0` for one-shot sound effects to prevent audio driver loop issues.
