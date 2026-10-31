import Foundation

public struct TankInfo {
    public let id: String
    public let name: String
    public let textureName: String
    public let armor: Int
    public let firepower: Int
    public let cost: Int
}

public class GameState {
    public static let shared = GameState()

    private let defaults = UserDefaults.standard

    public var warbux: Int {
        get {
            if defaults.object(forKey: "lg_warbux") == nil { return 500 }
            return max(0, defaults.integer(forKey: "lg_warbux"))
        }
        set { defaults.set(max(0, newValue), forKey: "lg_warbux") }
    }

    public var currentLevel: Int {
        get { return max(1, defaults.integer(forKey: "lg_level")) }
        set { defaults.set(newValue, forKey: "lg_level") }
    }

    public var totalWins: Int {
        get { return defaults.integer(forKey: "lg_wins") }
        set { defaults.set(newValue, forKey: "lg_wins") }
    }

    public var totalLosses: Int {
        get { return defaults.integer(forKey: "lg_losses") }
        set { defaults.set(newValue, forKey: "lg_losses") }
    }

    public var totalKills: Int {
        get { return defaults.integer(forKey: "lg_kills") }
        set { defaults.set(newValue, forKey: "lg_kills") }
    }

    public var winStreak: Int {
        get { return defaults.integer(forKey: "lg_win_streak") }
        set { defaults.set(newValue, forKey: "lg_win_streak") }
    }

    public var playerGas: Double {
        get {
            if defaults.object(forKey: "lg_gas") == nil { return 1.0 }
            return min(1.0, max(0.0, defaults.double(forKey: "lg_gas")))
        }
        set { defaults.set(min(1.0, max(0.0, newValue)), forKey: "lg_gas") }
    }

    public var selectedWeaponRaw: String {
        get { return defaults.string(forKey: "lg_selected_weapon") ?? WeaponType.babyMissile.rawValue }
        set { defaults.set(newValue, forKey: "lg_selected_weapon") }
    }

    public var selectedWeapon: WeaponType {
        get { return WeaponType(rawValue: selectedWeaponRaw) ?? .babyMissile }
        set { selectedWeaponRaw = newValue.rawValue }
    }

    public var weaponInventory: [String: Int] {
        get {
            if let dict = defaults.dictionary(forKey: "lg_weapon_ammo") as? [String: Int] {
                return dict
            }
            return [
                WeaponType.babyMissile.rawValue: 99,
                WeaponType.missile.rawValue: 5,
                WeaponType.mirv.rawValue: 3,
                WeaponType.grenade.rawValue: 3,
                WeaponType.roller.rawValue: 3,
                WeaponType.dirtbomb.rawValue: 3,
                WeaponType.laser.rawValue: 2,
                WeaponType.funkyBomb.rawValue: 2,
                WeaponType.frog.rawValue: 2,
                WeaponType.shield.rawValue: 2,
                WeaponType.nuke.rawValue: 1,
                WeaponType.tracer.rawValue: 10
            ]
        }
        set {
            defaults.set(newValue, forKey: "lg_weapon_ammo")
        }
    }

    public func ammoCount(for weapon: WeaponType) -> Int {
        if weapon.isInfiniteDefault { return 99 }
        return max(0, weaponInventory[weapon.rawValue] ?? 0)
    }

    public func consumeAmmo(for weapon: WeaponType) {
        if weapon.isInfiniteDefault { return }
        var inv = weaponInventory
        let current = inv[weapon.rawValue] ?? 0
        inv[weapon.rawValue] = max(0, current - 1)
        weaponInventory = inv
        if inv[weapon.rawValue] == 0 && selectedWeapon == weapon {
            selectedWeapon = .babyMissile
        }
    }

    public func buyWeaponPack(_ weapon: WeaponType) -> Bool {
        guard warbux >= weapon.packCost else { return false }
        warbux -= weapon.packCost
        var inv = weaponInventory
        inv[weapon.rawValue] = (inv[weapon.rawValue] ?? 0) + weapon.packQuantity
        weaponInventory = inv
        selectedWeapon = weapon
        return true
    }

    public func buyGasRefill() -> Bool {
        let cost = 200 // weapons.balance_sheet.lua:192-211 (+50% gas for 200 Warbux)
        guard warbux >= cost && playerGas < 0.99 else { return false }
        warbux -= cost
        playerGas = min(1.0, playerGas + 0.5)
        return true
    }

    public var selectedTankId: String {
        get { return defaults.string(forKey: "lg_tank") ?? "basic_tank" }
        set { defaults.set(newValue, forKey: "lg_tank") }
    }

    public var unlockedTankIds: Set<String> {
        get {
            let list = defaults.stringArray(forKey: "lg_unlocked_tanks") ?? ["basic_tank"]
            return Set(list)
        }
        set {
            defaults.set(Array(newValue), forKey: "lg_unlocked_tanks")
        }
    }

    public let availableTanks: [TankInfo] = [
        TankInfo(id: "basic_tank", name: "Standard Issue", textureName: "blue_tankdrive1.png", armor: 100, firepower: 30, cost: 0),
        TankInfo(id: "hummera", name: "Desert Humvee", textureName: "hummera.png", armor: 120, firepower: 35, cost: 250),
        TankInfo(id: "mlrsa", name: "MLRS Rocket Carrier", textureName: "mlrsa.png", armor: 140, firepower: 45, cost: 500),
        TankInfo(id: "lowrider", name: "Lowrider", textureName: "lowrider.png", armor: 160, firepower: 40, cost: 750),
        TankInfo(id: "dragontank", name: "Dragon Firestorm", textureName: "dragontank.png", armor: 180, firepower: 55, cost: 1200),
        TankInfo(id: "goldtank", name: "General's Gold", textureName: "goldtank.png", armor: 220, firepower: 65, cost: 2000),
        TankInfo(id: "nuketank", name: "Atomic Behemoth", textureName: "nuketank.png", armor: 250, firepower: 80, cost: 3500),
        // Country Tanks
        TankInfo(id: "usa_tank", name: "USA Stars & Stripes", textureName: "usa.png", armor: 130, firepower: 40, cost: 400),
        TankInfo(id: "uk_tank", name: "British Challenger", textureName: "uk.png", armor: 140, firepower: 42, cost: 450),
        TankInfo(id: "russia_tank", name: "Russian T-80", textureName: "russia.png", armor: 150, firepower: 44, cost: 500),
        TankInfo(id: "germany_tank", name: "German Panzer", textureName: "germany.png", armor: 155, firepower: 46, cost: 550),
        TankInfo(id: "canada_tank", name: "Canadian Maple", textureName: "canada.png", armor: 135, firepower: 38, cost: 400),
        TankInfo(id: "china_tank", name: "Chinese Dragon", textureName: "china.png", armor: 145, firepower: 45, cost: 500),
        TankInfo(id: "ireland_tank", name: "Irish Shamrock", textureName: "ireland.png", armor: 130, firepower: 36, cost: 350),
        TankInfo(id: "italy_tank", name: "Italian Centauro", textureName: "italy.png", armor: 135, firepower: 40, cost: 420),
        // Specialty Novelty Tanks
        TankInfo(id: "pink_icecream", name: "Pink Ice Cream Van", textureName: "pink_icecreamtruck.png", armor: 160, firepower: 50, cost: 900),
        TankInfo(id: "pumpkin_tank", name: "Halloween Pumpkin", textureName: "pumpkintank.png", armor: 170, firepower: 52, cost: 1000),
        TankInfo(id: "sleigh_tank", name: "Santa's Armored Sleigh", textureName: "sleigh_tank.png", armor: 185, firepower: 58, cost: 1500)
    ]

    public var selectedTank: TankInfo {
        return availableTanks.first(where: { $0.id == selectedTankId }) ?? availableTanks[0]
    }

    public var lastBattleWon: Bool = false
    public var lastBattleScore: Int = 0
    public var lastBattlePot: Int = 10

    private init() {
        if defaults.object(forKey: "lg_warbux") == nil {
            defaults.set(500, forKey: "lg_warbux")
            defaults.set(1, forKey: "lg_level")
            defaults.set(["basic_tank"], forKey: "lg_unlocked_tanks")
            defaults.set(1.0, forKey: "lg_gas")
        }
    }

    public func save() {
        defaults.synchronize()
    }

    public func unlockTank(id: String) -> Bool {
        guard let tank = availableTanks.first(where: { $0.id == id }), warbux >= tank.cost else {
            return false
        }
        warbux -= tank.cost
        var unlocked = unlockedTankIds
        unlocked.insert(id)
        unlockedTankIds = unlocked
        selectedTankId = id
        return true
    }
}
