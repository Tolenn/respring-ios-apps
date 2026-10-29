import SpriteKit

public class MenuScene: SKScene {
    private enum MenuState {
        case home
        case disciplines
    }
    
    private var state: MenuState = .home
    private var rootNode: SKNode!
    
    private var countries: [CountryItem] = []
    private var countryIndex: Int = 0
    private var selectedDisciplineIndex: Int = 0
    private let availableDisciplines: [DisciplineType] = [
        .dash100m, .dash400m, .hurdles, .longJump, .javelin
    ]
    
    private var characterNode: SKSpriteNode!
    private var disciplineSprite: SKSpriteNode?
    private var countryLabel: SKLabelNode?
    
    public override func didMove(to view: SKView) {
        backgroundColor = .black
        
        countries = DatabaseManager.shared.getCountries()
        if countries.isEmpty {
            countries = [CountryItem(id: 1, name: "Argentina")]
        }
        
        setupScene()
        SoundManager.shared.playSound(named: "Crowd.caf")
    }
    
    private func setupScene() {
        removeAllChildren()
        rootNode = SKNode()
        addChild(rootNode)
        
        switch state {
        case .home:
            setupHomeScreen()
        case .disciplines:
            setupDisciplinesScreen()
        }
    }
    
    // MARK: - Home Screen
    private func setupHomeScreen() {
        // Fullscreen background (480x320)
        let bg = SKSpriteNode(imageNamed: "fondoHome.png")
        bg.position = CGPoint(x: 240, y: 160)
        bg.size = CGSize(width: 480, height: 320)
        bg.zPosition = 0
        rootNode.addChild(bg)
        
        // Play Button
        let playBtn = SKSpriteNode(imageNamed: "btnMainPlay.png")
        playBtn.position = CGPoint(x: 240, y: 110)
        playBtn.name = "btnPlayMenu"
        playBtn.zPosition = 10
        rootNode.addChild(playBtn)
        
        // Settings Button
        let settingsBtn = SKSpriteNode(imageNamed: "btnSettings.png")
        settingsBtn.position = CGPoint(x: 410, y: 40)
        settingsBtn.name = "btnSettings"
        settingsBtn.zPosition = 10
        rootNode.addChild(settingsBtn)
        
        // Medals / Records Button
        let medalsBtn = SKSpriteNode(imageNamed: "medalsIcon.png")
        medalsBtn.position = CGPoint(x: 70, y: 40)
        medalsBtn.name = "btnMedals"
        medalsBtn.zPosition = 10
        rootNode.addChild(medalsBtn)
        
        // Animated Athlete Preview
        let charType = GameState.shared.selectedCharacter.rawValue
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: "\(charType)Corre", prefix: "\(charType)Corre")
        characterNode = SKSpriteNode(texture: textures.first ?? SKTexture())
        characterNode.size = CGSize(width: 80, height: 80)
        characterNode.position = CGPoint(x: 240, y: 200)
        characterNode.name = "btnAthlete"
        characterNode.zPosition = 5
        rootNode.addChild(characterNode)
        
        if !textures.isEmpty {
            characterNode.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.08)))
        }
        
        let charPrompt = SKLabelNode(fontNamed: "Helvetica-Bold")
        charPrompt.text = "Athlete: \(GameState.shared.selectedCharacter.rawValue.capitalized) (Tap to change)"
        charPrompt.fontSize = 11
        charPrompt.fontColor = .yellow
        charPrompt.position = CGPoint(x: 240, y: 155)
        charPrompt.name = "btnAthlete"
        charPrompt.zPosition = 6
        rootNode.addChild(charPrompt)
    }
    
    // MARK: - Disciplines Selection Screen
    private func setupDisciplinesScreen() {
        let bg = SKSpriteNode(imageNamed: "fondoMenuDiscip.png")
        bg.position = CGPoint(x: 240, y: 160)
        bg.size = CGSize(width: 480, height: 320)
        bg.zPosition = 0
        rootNode.addChild(bg)
        
        // Current Discipline Card (discip1.png ... discip5.png)
        updateDisciplineCard()
        
        // Left & Right Selection Arrows
        let leftArrow = SKSpriteNode(imageNamed: "btnBack.png")
        leftArrow.position = CGPoint(x: 45, y: 160)
        leftArrow.name = "btnPrevDisc"
        leftArrow.zPosition = 10
        rootNode.addChild(leftArrow)
        
        let rightArrow = SKSpriteNode(imageNamed: "btnNext.png")
        rightArrow.position = CGPoint(x: 435, y: 160)
        rightArrow.name = "btnNextDisc"
        rightArrow.zPosition = 10
        rootNode.addChild(rightArrow)
        
        // Bottom Start / Play Button
        let startBtn = SKSpriteNode(imageNamed: "btnPlay.png")
        startBtn.position = CGPoint(x: 390, y: 40)
        startBtn.name = "btnStartDiscipline"
        startBtn.zPosition = 10
        rootNode.addChild(startBtn)
        
        // Back to Home Button
        let backBtn = SKSpriteNode(imageNamed: "btnHome.png")
        backBtn.position = CGPoint(x: 90, y: 40)
        backBtn.name = "btnBackToHome"
        backBtn.zPosition = 10
        rootNode.addChild(backBtn)
        
        // Country Selector
        let countryBox = SKShapeNode(rectOf: CGSize(width: 170, height: 28), cornerRadius: 5)
        countryBox.position = CGPoint(x: 240, y: 35)
        countryBox.fillColor = SKColor(white: 0.0, alpha: 0.5)
        countryBox.strokeColor = .white
        countryBox.name = "btnCycleCountry"
        countryBox.zPosition = 10
        rootNode.addChild(countryBox)
        
        countryLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        countryLabel?.text = "Country: \(countries[countryIndex].name)"
        countryLabel?.fontSize = 12
        countryLabel?.fontColor = .white
        countryLabel?.position = CGPoint(x: 240, y: 31)
        countryLabel?.name = "btnCycleCountry"
        countryLabel?.zPosition = 11
        rootNode.addChild(countryLabel!)
    }
    
    private func updateDisciplineCard() {
        disciplineSprite?.removeFromParent()
        
        let disc = availableDisciplines[selectedDisciplineIndex]
        let discId = disc.rawValue
        let isUnlocked = DatabaseManager.shared.isDisciplineUnlocked(disciplineId: discId)
        
        let imageName = isUnlocked ? "discip\(discId).png" : "discip\(discId)lock.png"
        let card = SKSpriteNode(imageNamed: imageName)
        card.position = CGPoint(x: 240, y: 170)
        card.size = CGSize(width: 300, height: 210)
        card.name = "btnStartDiscipline"
        card.zPosition = 5
        rootNode.addChild(card)
        disciplineSprite = card
    }
    
    // MARK: - Touch Handling
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            guard let name = node.name else { continue }
            
            SoundManager.shared.playSound(named: "Click.caf")
            
            switch name {
            case "btnPlayMenu":
                state = .disciplines
                setupScene()
                return
                
            case "btnBackToHome":
                state = .home
                setupScene()
                return
                
            case "btnAthlete":
                // Toggle athlete character
                GameState.shared.selectedCharacter = (GameState.shared.selectedCharacter == .fingy) ? .pinky : .fingy
                let charType = GameState.shared.selectedCharacter.rawValue
                let textures = AtlasLoader.shared.getAnimationSequence(atlasName: "\(charType)Corre", prefix: "\(charType)Corre")
                characterNode?.removeAllActions()
                if !textures.isEmpty {
                    characterNode?.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.08)))
                }
                setupScene()
                return
                
            case "btnCycleCountry":
                countryIndex = (countryIndex + 1) % countries.count
                countryLabel?.text = "Country: \(countries[countryIndex].name)"
                GameState.shared.selectedCountryId = countries[countryIndex].id
                GameState.shared.selectedCountryName = countries[countryIndex].name
                return
                
            case "btnPrevDisc":
                selectedDisciplineIndex = (selectedDisciplineIndex - 1 + availableDisciplines.count) % availableDisciplines.count
                updateDisciplineCard()
                return
                
            case "btnNextDisc":
                selectedDisciplineIndex = (selectedDisciplineIndex + 1) % availableDisciplines.count
                updateDisciplineCard()
                return
                
            case "btnStartDiscipline":
                let disc = availableDisciplines[selectedDisciplineIndex]
                GameState.shared.currentDiscipline = disc
                launchDiscipline(disc)
                return
                
            case "btnMedals":
                let medalsScene = MedalsScene(size: CGSize(width: 480, height: 320))
                medalsScene.scaleMode = .aspectFit
                view?.presentScene(medalsScene, transition: SKTransition.fade(withDuration: 0.4))
                return
                
            default:
                break
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
