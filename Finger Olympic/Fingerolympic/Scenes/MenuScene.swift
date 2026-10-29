import SpriteKit

public class MenuScene: SKScene {
    private var countries: [CountryItem] = []
    private var countryIndex: Int = 0
    private var countryLabel: SKLabelNode!
    private var characterNode: SKSpriteNode!
    
    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.15, green: 0.5, blue: 0.8, alpha: 1.0)
        
        countries = DatabaseManager.shared.getCountries()
        if countries.isEmpty {
            countries = [CountryItem(id: 1, name: "Argentina")]
        }
        
        setupUI()
        SoundManager.shared.playSound(named: "Crowd.caf")
    }
    
    private func setupUI() {
        // Title banner
        let titleLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        titleLabel.text = "FINGER OLYMPIC"
        titleLabel.fontSize = 28
        titleLabel.fontColor = .yellow
        titleLabel.position = CGPoint(x: 240, y: 275)
        addChild(titleLabel)
        
        let subTitle = SKLabelNode(fontNamed: "Helvetica")
        subTitle.text = "Legacy 32-bit iOS Restoration"
        subTitle.fontSize = 12
        subTitle.fontColor = .white
        subTitle.position = CGPoint(x: 240, y: 255)
        addChild(subTitle)
        
        // Character preview
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = "\(charType)Corre"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: "\(charType)Corre")
        
        characterNode = SKSpriteNode(texture: textures.first ?? SKTexture())
        characterNode.size = CGSize(width: 80, height: 80)
        characterNode.position = CGPoint(x: 100, y: 170)
        characterNode.name = "btnCharacter"
        addChild(characterNode)
        
        if !textures.isEmpty {
            let anim = SKAction.animate(with: textures, timePerFrame: 0.08)
            characterNode.run(SKAction.repeatForever(anim))
        }
        
        let charLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        charLabel.text = "Tap Athlete: \(GameState.shared.selectedCharacter.rawValue.capitalized)"
        charLabel.fontSize = 11
        charLabel.fontColor = .white
        charLabel.position = CGPoint(x: 100, y: 115)
        charLabel.name = "btnCharacter"
        addChild(charLabel)
        
        // Country Selector
        let countryBox = SKShapeNode(rectOf: CGSize(width: 140, height: 36), cornerRadius: 6)
        countryBox.position = CGPoint(x: 100, y: 65)
        countryBox.fillColor = SKColor(white: 0.0, alpha: 0.3)
        countryBox.strokeColor = .white
        countryBox.name = "btnCountry"
        addChild(countryBox)
        
        countryLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        countryLabel.text = countries[countryIndex].name
        countryLabel.fontSize = 13
        countryLabel.fontColor = .white
        countryLabel.position = CGPoint(x: 100, y: 60)
        countryLabel.name = "btnCountry"
        addChild(countryLabel)
        
        // Discipline Buttons
        let disciplines: [(DisciplineType, String)] = [
            (.dash100m, "100m Sprint"),
            (.dash400m, "400m Sprint"),
            (.hurdles, "110m Hurdles"),
            (.longJump, "Long Jump"),
            (.javelin, "Javelin Throw")
        ]
        
        var yPos: CGFloat = 220
        for (disc, name) in disciplines {
            let unlocked = DatabaseManager.shared.isDisciplineUnlocked(disciplineId: disc.rawValue)
            let btn = SKShapeNode(rectOf: CGSize(width: 200, height: 34), cornerRadius: 8)
            btn.position = CGPoint(x: 330, y: yPos)
            btn.fillColor = unlocked ? SKColor(red: 0.1, green: 0.65, blue: 0.2, alpha: 1.0) : SKColor.darkGray
            btn.strokeColor = .white
            btn.lineWidth = 1.5
            btn.name = "btnDisc_\(disc.rawValue)"
            addChild(btn)
            
            let lbl = SKLabelNode(fontNamed: "Helvetica-Bold")
            lbl.text = unlocked ? name : "\(name) (Locked)"
            lbl.fontSize = 13
            lbl.fontColor = .white
            lbl.position = CGPoint(x: 330, y: yPos - 5)
            lbl.name = "btnDisc_\(disc.rawValue)"
            addChild(lbl)
            
            yPos -= 42
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            guard let name = node.name else { continue }
            
            SoundManager.shared.playSound(named: "Click.caf")
            
            if name == "btnCharacter" {
                // Toggle Character between fingy and pinky
                GameState.shared.selectedCharacter = (GameState.shared.selectedCharacter == .fingy) ? .pinky : .fingy
                let charType = GameState.shared.selectedCharacter.rawValue
                let textures = AtlasLoader.shared.getAnimationSequence(atlasName: "\(charType)Corre", prefix: "\(charType)Corre")
                characterNode.removeAllActions()
                if !textures.isEmpty {
                    characterNode.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.08)))
                }
            } else if name == "btnCountry" {
                // Cycle country
                countryIndex = (countryIndex + 1) % countries.count
                countryLabel.text = countries[countryIndex].name
                GameState.shared.selectedCountryId = countries[countryIndex].id
                GameState.shared.selectedCountryName = countries[countryIndex].name
            } else if name.hasPrefix("btnDisc_") {
                let discIdStr = name.replacingOccurrences(of: "btnDisc_", with: "")
                if let discId = Int(discIdStr), let disc = DisciplineType(rawValue: discId) {
                    GameState.shared.currentDiscipline = disc
                    launchDiscipline(disc)
                }
            }
        }
    }
    
    private func launchDiscipline(_ disc: DisciplineType) {
        let transition = SKTransition.fade(withDuration: 0.4)
        switch disc {
        case .dash100m, .dash400m, .hurdles:
            let scene = RunningScene(size: CGSize(width: 480, height: 320))
            scene.scaleMode = .aspectFit
            view?.presentScene(scene, transition: transition)
        case .longJump, .javelin:
            let scene = FieldScene(size: CGSize(width: 480, height: 320))
            scene.scaleMode = .aspectFit
            view?.presentScene(scene, transition: transition)
        }
    }
}

