import SpriteKit

public class FieldScene: SKScene {
    private var athlete: SKSpriteNode!
    private var javelinNode: SKSpriteNode?
    private var fieldNode: SKNode!
    
    // Mode
    private var isJavelin: Bool = false
    
    // Physics & Run-up
    private var isRunning: Bool = false
    private var hasLaunched: Bool = false
    private var runSpeed: Double = 0.0
    private var maxSpeed: Double = 26.0
    private var lastTappedSide: String = ""
    
    // Launch angle & trajectory
    private var angleDegrees: Double = 45.0
    private var distanceMeters: Double = 0.0
    
    // HUD & Controls
    private var scoreboard: SKSpriteNode!
    private var distDisplay: SKLabelNode!
    private var promptDisplay: SKLabelNode!
    
    private var leftPrintNode: SKSpriteNode!
    private var rightPrintNode: SKSpriteNode!
    private var actionButton: SKSpriteNode!
    
    public override func didMove(to view: SKView) {
        backgroundColor = .black
        isJavelin = (GameState.shared.currentDiscipline == .javelin)
        
        setupEnvironment()
        setupAthlete()
        setupHUD()
        setupControls()
    }
    
    private func setupEnvironment() {
        // Grandstand & Stadium Background
        let bg = SKSpriteNode(imageNamed: "background.png")
        bg.position = CGPoint(x: 240, y: 160)
        bg.size = CGSize(width: 480, height: 320)
        bg.zPosition = 0
        addChild(bg)
        
        fieldNode = SKNode()
        fieldNode.zPosition = 1
        addChild(fieldNode)
        
        // Pista runway & grass
        for i in 0..<20 {
            let grass = SKSpriteNode(imageNamed: "06-pista.png")
            grass.anchorPoint = .zero
            grass.position = CGPoint(x: CGFloat(i * 64), y: 55)
            grass.size = CGSize(width: 64, height: 75)
            fieldNode.addChild(grass)
        }
        
        // Foul / Launch Line
        let line = SKShapeNode(rectOf: CGSize(width: 6, height: 75))
        line.fillColor = .red
        line.position = CGPoint(x: 340, y: 92)
        line.zPosition = 4
        fieldNode.addChild(line)
    }
    
    private func setupAthlete() {
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = isJavelin ? "\(charType)CorreJabalina" : "\(charType)Corre"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: atlasName)
        
        athlete = SKSpriteNode(texture: textures.first ?? SKTexture())
        athlete.size = CGSize(width: 80, height: 80)
        athlete.position = CGPoint(x: 100, y: 105)
        athlete.zPosition = 10
        addChild(athlete)
        
        if !textures.isEmpty {
            athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.08)))
        }
    }
    
    private func setupHUD() {
        scoreboard = SKSpriteNode(imageNamed: "ScoreBoard.png")
        scoreboard.position = CGPoint(x: 240, y: 285)
        scoreboard.size = CGSize(width: 140, height: 62)
        scoreboard.zPosition = 20
        addChild(scoreboard)
        
        distDisplay = SKLabelNode(fontNamed: "Courier-Bold")
        distDisplay.text = "00.00m"
        distDisplay.fontSize = 13
        distDisplay.fontColor = .yellow
        distDisplay.position = CGPoint(x: 240, y: 285)
        distDisplay.zPosition = 21
        addChild(distDisplay)
        
        promptDisplay = SKLabelNode(fontNamed: "Helvetica-Bold")
        promptDisplay.text = isJavelin ? "Tap Alternating Feet -> Tap THROW!" : "Tap Alternating Feet -> Tap JUMP!"
        promptDisplay.fontSize = 11
        promptDisplay.fontColor = .white
        promptDisplay.position = CGPoint(x: 240, y: 245)
        promptDisplay.zPosition = 21
        addChild(promptDisplay)
        
        // Exit / Back Button
        let homeBtn = SKSpriteNode(imageNamed: "btnHome.png")
        homeBtn.position = CGPoint(x: 35, y: 290)
        homeBtn.size = CGSize(width: 44, height: 44)
        homeBtn.name = "btnExit"
        homeBtn.zPosition = 20
        addChild(homeBtn)
    }
    
    private func setupControls() {
        // Left Footprint / Fingerprint
        leftPrintNode = SKSpriteNode(imageNamed: "HuellaIzquierda.png")
        leftPrintNode.position = CGPoint(x: 65, y: 65)
        leftPrintNode.size = CGSize(width: 75, height: 105)
        leftPrintNode.name = "btnLeftPrint"
        leftPrintNode.zPosition = 25
        addChild(leftPrintNode)
        
        // Right Footprint / Fingerprint
        rightPrintNode = SKSpriteNode(imageNamed: "HuellaDerecha.png")
        rightPrintNode.position = CGPoint(x: 415, y: 65)
        rightPrintNode.size = CGSize(width: 75, height: 105)
        rightPrintNode.name = "btnRightPrint"
        rightPrintNode.zPosition = 25
        addChild(rightPrintNode)
        
        // Action Button (Throw / Jump)
        let actionImg = isJavelin ? "btnThrow.png" : "btnJump.png"
        actionButton = SKSpriteNode(imageNamed: actionImg)
        actionButton.position = CGPoint(x: 240, y: 55)
        actionButton.size = CGSize(width: 75, height: 75)
        actionButton.name = "btnAction"
        actionButton.zPosition = 25
        addChild(actionButton)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            guard let name = node.name else { continue }
            
            if name == "btnExit" {
                SoundManager.shared.playSound(named: "Click.caf")
                let menu = MenuScene(size: CGSize(width: 480, height: 320))
                menu.scaleMode = .aspectFit
                view?.presentScene(menu, transition: SKTransition.fade(withDuration: 0.3))
                return
            }
            
            guard !hasLaunched else { return }
            
            if name == "btnLeftPrint" {
                leftPrintNode.texture = SKTexture(imageNamed: "HuellaTocadaIzq.png")
                processTap(side: "left")
            } else if name == "btnRightPrint" {
                rightPrintNode.texture = SKTexture(imageNamed: "HuellaTocadaDer.png")
                processTap(side: "right")
            } else if name == "btnAction" {
                executeLaunch()
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        leftPrintNode.texture = SKTexture(imageNamed: "HuellaIzquierda.png")
        rightPrintNode.texture = SKTexture(imageNamed: "HuellaDerecha.png")
    }
    
    private func processTap(side: String) {
        if side != lastTappedSide {
            runSpeed = min(maxSpeed, runSpeed + 3.2)
            lastTappedSide = side
            isRunning = true
        } else {
            runSpeed = max(0.0, runSpeed - 2.0)
            SoundManager.shared.playSound(named: "wrong.caf")
        }
    }
    
    private func executeLaunch() {
        guard !hasLaunched else { return }
        hasLaunched = true
        
        let charType = GameState.shared.selectedCharacter.rawValue
        
        if isJavelin {
            SoundManager.shared.playSound(named: "arrowShot.mp3")
            
            // Javelin release
            distanceMeters = max(18.0, runSpeed * 3.4)
            distDisplay.text = String(format: "%05.2fm", distanceMeters)
            
            let textures = AtlasLoader.shared.getAnimationSequence(atlasName: "\(charType)Festeja", prefix: "\(charType)Festeja")
            if !textures.isEmpty {
                athlete.removeAllActions()
                athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1)))
            }
        } else {
            SoundManager.shared.playSound(named: "Boing.wav")
            
            // Long Jump
            distanceMeters = max(4.0, runSpeed * 0.36)
            distDisplay.text = String(format: "%05.2fm", distanceMeters)
            
            let jumpUp = SKAction.moveBy(x: 100, y: 55, duration: 0.35)
            jumpUp.timingMode = .easeOut
            let fallDown = SKAction.moveBy(x: 60, y: -55, duration: 0.35)
            fallDown.timingMode = .easeIn
            athlete.run(SKAction.sequence([jumpUp, fallDown]))
        }
        
        SoundManager.shared.playSound(named: "Crowd_cheer.caf")
        
        // Save score & transition to podium
        let disc = GameState.shared.currentDiscipline
        GameState.shared.lastScore = distanceMeters
        GameState.shared.medalWon = (distanceMeters > 70.0 || (!isJavelin && distanceMeters > 8.0)) ? "Gold" : "Silver"
        DatabaseManager.shared.addRecord(name: GameState.shared.selectedCountryName, score: distanceMeters, disciplineId: disc.rawValue)
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.run { [weak self] in
                let medals = MedalsScene(size: CGSize(width: 480, height: 320))
                medals.scaleMode = .aspectFit
                self?.view?.presentScene(medals, transition: SKTransition.fade(withDuration: 0.5))
            }
        ]))
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if isRunning && !hasLaunched {
            runSpeed = max(0.0, runSpeed - 0.08)
            fieldNode.position.x -= CGFloat(runSpeed * 0.8)
            if fieldNode.position.x <= -64.0 {
                fieldNode.position.x += 64.0
            }
        }
    }
}
