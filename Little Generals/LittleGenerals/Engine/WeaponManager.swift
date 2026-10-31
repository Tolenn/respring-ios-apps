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
        case .drill: return "drilling.mp3"
        case .frog: return "Frogcroaking.mp3"
        case .fBomb: return "f-sound.mp3"
        case .icecream: return "icecream_shoot.mp3"
        case .pumpkin: return "shot.mp3"
        case .sandwedge: return "shot.mp3"
        }
    }

    public var impactSound: String {
        switch self {
        case .babyMissile: return "babymissileexplode.mp3"
        case .missile: return "missileexplode.mp3"
        case .nuke: return "nukeexplode.mp3"
        case .laser: return "laser_charge2.mp3"
        case .mirv: return "mirv_impact.mp3"
        case .roller: return "roller_countdown.mp3"
        case .grenade: return "grenade_explosion.mp3"
        case .napalm: return "napalm_impact.mp3"
        case .santa: return "splat2.mp3"
        case .shield: return "shield_collision.mp3"
        case .dirtbomb, .sandwedge: return "sandbomb_impact.mp3"
        case .drill: return "drillexplode.mp3"
        case .icecream: return "splat2.mp3"
        case .pumpkin: return "pumpkinSmash.mp3"
        default: return "explosion.mp3"
        }
    }

    public var iconName: String {
        switch self {
        case .missile: return "weapon_icons_frames/missile.png"
        case .babyMissile: return "weapon_icons_frames/babymissile.png"
        case .mirv: return "weapon_icons_frames/mirv.png"
        case .nuke: return "weapon_icons_frames/nuke.png"
        case .roller: return "weapon_icons_frames/roller.png"
        case .grenade: return "weapon_icons_frames/grenade.png"
        case .laser: return "weapon_icons_frames/laser.png"
        case .napalm: return "weapon_icons_frames/Napalm.png"
        case .funkyBomb: return "weapon_icons_frames/funkybomb.png"
        case .santa: return "weapon_icons_frames/santa_bomb.png"
        case .shield: return "weapon_icons_frames/shield.png"
        case .dirtbomb: return "weapon_icons_frames/dirtbomb.png"
        case .drill: return "weapon_icons_frames/driller.png"
        case .frog: return "weapon_icons_frames/leapfrog.png"
        case .fBomb: return "weapon_icons_frames/fbomb.png"
        case .icecream: return "weapon_icons_frames/icecream.png"
        case .pumpkin: return "weapon_icons_frames/pumpkinbomb.png"
        case .sandwedge: return "weapon_icons_frames/sandwedge.png"
        case .tracer: return "weapon_icons_frames/tracer.png"
        }
    }

    // Authentic Armory pack price in Warbux (from weapons.balance_sheet.lua:271-535)
    public var packCost: Int {
        switch self {
        case .babyMissile: return 50
        case .tracer: return 10
        case .missile: return 200
        case .drill: return 250
        case .roller: return 500
        case .sandwedge: return 500
        case .dirtbomb: return 500
        case .laser: return 500
        case .grenade: return 600
        case .funkyBomb: return 700
        case .mirv: return 900
        case .napalm: return 1000
        case .frog: return 1000
        case .fBomb: return 1000
        case .nuke: return 1600
        case .shield: return 1200
        case .santa: return 800
        case .icecream: return 750
        case .pumpkin: return 750
        }
    }

    // Authentic Armory pack quantity (from weapons.balance_sheet.lua:271-535)
    public var packQuantity: Int {
        switch self {
        case .babyMissile, .tracer, .napalm, .dirtbomb: return 10
        case .missile, .drill, .sandwedge, .laser, .roller: return 5
        case .grenade, .mirv, .shield, .santa, .icecream, .pumpkin: return 3
        case .funkyBomb, .frog, .fBomb: return 2
        case .nuke: return 1
        }
    }

    public var isInfiniteDefault: Bool {
        return self == .babyMissile
    }
}
