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
    case dirtbomb = "Dirt Bomb"
    case drill = "Sub-Terrain Drill"
    case frog = "Leaping Frog"
    case fBomb = "F-Bomb Cluster"
    case icecream = "Ice Cream Freeze"
    case pumpkin = "Pumpkin Patch"
    case sandwedge = "Sand Wedge Loft"
    case tracer = "Tracer Round"

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
        case .dirtbomb: return 15
        case .drill: return 55
        case .frog: return 30
        case .fBomb: return 60
        case .icecream: return 35
        case .pumpkin: return 40
        case .sandwedge: return 30
        case .tracer: return 10
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
        case .dirtbomb: return 45
        case .drill: return 25
        case .frog: return 28
        case .fBomb: return 50
        case .icecream: return 40
        case .pumpkin: return 35
        case .sandwedge: return 22
        case .tracer: return 15
        }
    }

    public var launchSound: String {
        switch self {
        case .missile, .babyMissile, .tracer: return "shot.mp3"
        case .mirv: return "mirv_launch.mp3"
        case .nuke: return "missilefire.mp3"
        case .roller: return "roller_launch.mp3"
        case .grenade: return "grenade_launch.mp3"
        case .laser: return "laser_blast.mp3"
        case .napalm: return "missilefire.mp3"
        case .funkyBomb: return "funkyTime.mp3"
        case .santa: return "Ho_Ho_Ho.mp3"
        case .shield: return "shield.mp3"
        case .dirtbomb: return "shot.mp3"
        case .drill: return "shot.mp3"
        case .frog: return "shot.mp3"
        case .fBomb: return "missilefire.mp3"
        case .icecream: return "shot.mp3"
        case .pumpkin: return "shot.mp3"
        case .sandwedge: return "shot.mp3"
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
        case .icecream: return "splat2.mp3"
        default: return "explosion.mp3"
        }
    }

    public var iconName: String {
        switch self {
        case .missile: return "missile.png"
        case .babyMissile: return "babymissile.png"
        case .mirv: return "mirv.png"
        case .nuke: return "nuke.png"
        case .roller: return "roller.png"
        case .grenade: return "grenade.png"
        case .laser: return "laser.png"
        case .napalm: return "Napalm.png"
        case .funkyBomb: return "funkybomb.png"
        case .santa: return "santa_bomb.png"
        case .shield: return "shield.png"
        case .dirtbomb: return "dirtbomb.png"
        case .drill: return "drill.png"
        case .frog: return "frog.png"
        case .fBomb: return "f_bomb.png"
        case .icecream: return "icecream.png"
        case .pumpkin: return "pumpkin.png"
        case .sandwedge: return "sandwedge.png"
        case .tracer: return "tracer.png"
        }
    }
}
