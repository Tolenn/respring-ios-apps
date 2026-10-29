import Foundation
import SpriteKit

public enum WeaponType: String, CaseIterable {
    case missile = "Missile"
    case babyMissile = "Baby Missile"
    case mirv = "MIRV Cluster"
    case nuke = "Atomic Nuke"
    case roller = "Terrain Roller"
    case grenade = "Bounce Grenade"
    case laser = "Orbital Laser"
    case napalm = "Napalm Fire"
    case funkyBomb = "Funky Bomb"
    case santa = "Santa Presents"
    case shield = "Energy Shield"

    public var damage: Double {
        switch self {
        case .babyMissile: return 25
        case .missile: return 40
        case .mirv: return 28 // per warhead (x3)
        case .nuke: return 85
        case .roller: return 45
        case .grenade: return 35
        case .laser: return 50
        case .napalm: return 38
        case .funkyBomb: return 45
        case .santa: return 32
        case .shield: return 0
        }
    }

    public var blastRadius: CGFloat {
        switch self {
        case .nuke: return 75
        case .missile: return 35
        case .babyMissile: return 20
        case .mirv: return 25
        case .roller: return 30
        case .grenade: return 32
        case .laser: return 15
        case .napalm: return 50
        case .funkyBomb: return 35
        case .santa: return 30
        case .shield: return 0
        }
    }

    public var launchSound: String {
        switch self {
        case .missile, .babyMissile: return "shot.mp3"
        case .mirv: return "mirv_launch.mp3"
        case .nuke: return "missilefire.mp3"
        case .roller: return "roller_launch.mp3"
        case .grenade: return "grenade_launch.mp3"
        case .laser: return "laser_blast.mp3"
        case .napalm: return "missilefire.mp3"
        case .funkyBomb: return "funkyTime.mp3"
        case .santa: return "Ho_Ho_Ho.mp3"
        case .shield: return "shield.mp3"
        }
    }

    public var impactSound: String {
        switch self {
        case .nuke: return "nukeexplode.mp3"
        case .laser: return "laser_charge2.mp3"
        case .mirv: return "mirv_impact.mp3"
        case .roller: return "roller_countdown.mp3"
        case .grenade: return "grenade_explosion.mp3"
        case .napalm: return "napalm_impact.mp3"
        case .santa: return "splat2.mp3"
        case .shield: return "shield_collision.mp3"
        default: return "explosion.mp3"
        }
    }
}
