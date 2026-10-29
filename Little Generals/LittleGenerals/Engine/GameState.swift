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
        get { return defaults.integer(forKey: "lg_warbux") == 0 ? 500 : defaults.integer(forKey: "lg_warbux") }
        set { defaults.set(newValue, forKey: "lg_warbux") }
    }

    public var currentLevel: Int {
        get { return max(1, defaults.integer(forKey: "lg_level")) }
        set { defaults.set(newValue, forKey: "lg_level") }
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
        TankInfo(id: "basic_tank", name: "Standard Issue", textureName: "basic_tank.png", armor: 100, firepower: 30, cost: 0),
        TankInfo(id: "hummera", name: "Desert Humvee", textureName: "hummera.png", armor: 120, firepower: 35, cost: 250),
        TankInfo(id: "mlrsa", name: "MLRS Rocket Carrier", textureName: "mlrsa.png", armor: 140, firepower: 45, cost: 500),
        TankInfo(id: "lowrider", name: "Lowrider", textureName: "lowrider.png", armor: 160, firepower: 40, cost: 750),
        TankInfo(id: "dragontank", name: "Dragon Firestorm", textureName: "dragontank.png", armor: 180, firepower: 55, cost: 1200),
        TankInfo(id: "goldtank", name: "General's Gold", textureName: "goldtank.png", armor: 220, firepower: 65, cost: 2000),
        TankInfo(id: "nuketank", name: "Atomic Behemoth", textureName: "nuketank.png", armor: 250, firepower: 80, cost: 3500)
    ]

    public var selectedTank: TankInfo {
        return availableTanks.first(where: { $0.id == selectedTankId }) ?? availableTanks[0]
    }

    public var lastBattleWon: Bool = false
    public var lastBattleScore: Int = 0

    private init() {
        if defaults.object(forKey: "lg_warbux") == nil {
            defaults.set(500, forKey: "lg_warbux")
            defaults.set(1, forKey: "lg_level")
            defaults.set(["basic_tank"], forKey: "lg_unlocked_tanks")
        }
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
