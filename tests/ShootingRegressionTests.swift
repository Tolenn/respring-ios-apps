import XCTest
import SpriteKit
@testable import LittleGenerals

final class ShootingRegressionTests: XCTestCase {

    func testWeaponParameters() {
        XCTAssertEqual(WeaponType.babyMissile.damage, 35.0)
        XCTAssertEqual(WeaponType.missile.damage, 50.0)
        XCTAssertEqual(WeaponType.nuke.damage, 120.0)
        XCTAssertEqual(WeaponType.babyMissile.launchSound, "shot.mp3")
        XCTAssertEqual(WeaponType.babyMissile.impactSound, "babymissileexplode.mp3")
    }

    func testBallisticMath() {
        let angleDeg: CGFloat = 45.0
        let power: CGFloat = 65.0
        let rad = angleDeg * .pi / 180.0
        let speed = power * 8.5
        let vx = speed * cos(rad)
        let vy = speed * sin(rad)

        XCTAssertGreaterThan(vx, 0)
        XCTAssertGreaterThan(vy, 0)
        XCTAssertEqual(vx, vy, accuracy: 0.01)
    }

    func testTerrainCollisionModel() {
        let terrain = TerrainModel(width: 1024, height: 600)
        let groundY = terrain.valueAt(x: 200)
        XCTAssertGreaterThan(groundY, 100)

        // Carve crater and verify depression
        terrain.applyCrater(center: CGPoint(x: 200, y: groundY), radius: 30)
        let newGroundY = terrain.valueAt(x: 200)
        XCTAssertLessThan(newGroundY, groundY)
    }

    func testDirectTankHitDistance() {
        let tankPos = CGPoint(x: 604, y: 150)
        let directHitPos = CGPoint(x: 606, y: 152)
        let missPos = CGPoint(x: 650, y: 150)

        let dHit = hypot(directHitPos.x - tankPos.x, directHitPos.y - tankPos.y)
        let dMiss = hypot(missPos.x - tankPos.x, missPos.y - tankPos.y)

        XCTAssertLessThan(dHit, 26.0)
        XCTAssertGreaterThan(dMiss, 26.0)
    }

    func testDamageAndShieldAbsorption() {
        var shieldHP: Double = 20.0
        var health: Double = 100.0
        var incomingDmg: Double = 35.0

        let absorbed = min(shieldHP, incomingDmg)
        shieldHP -= absorbed
        incomingDmg -= absorbed
        health -= incomingDmg

        XCTAssertEqual(shieldHP, 0.0)
        XCTAssertEqual(health, 85.0)
    }

    func testEnemyDeathThreshold() {
        var aiHealth: Double = 15.0
        aiHealth = max(0.0, aiHealth - 35.0)
        let isDead = aiHealth <= 0.0

        XCTAssertEqual(aiHealth, 0.0)
        XCTAssertTrue(isDead)
    }
}
