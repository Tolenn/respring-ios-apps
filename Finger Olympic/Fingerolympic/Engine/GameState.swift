import Foundation

public enum CharacterType: String {
    case fingy = "fingy"
    case pinky = "pinky"
}

public enum DisciplineType: Int {
    case dash100m = 1
    case dash400m = 2
    case hurdles = 3
    case javelin = 4
    case longJump = 5
    
    public var title: String {
        switch self {
        case .dash100m: return "100m Sprint"
        case .dash400m: return "400m Sprint"
        case .hurdles: return "110m Hurdles"
        case .javelin: return "Javelin Throw"
        case .longJump: return "Long Jump"
        }
    }
}

public final class GameState {
    public static let shared = GameState()
    
    public var selectedCharacter: CharacterType = .fingy
    public var selectedCountryId: Int = 1
    public var selectedCountryName: String = "Argentina"
    public var currentDiscipline: DisciplineType = .dash100m
    
    public var lastScore: Double = 0.0
    public var isNewRecord: Bool = false
    public var medalWon: String = "Gold" // "Gold", "Silver", "Bronze", "None"
    
    private init() {}
}

