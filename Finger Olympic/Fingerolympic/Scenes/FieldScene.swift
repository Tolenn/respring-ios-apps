import SpriteKit

public class FieldScene: SKScene {
    private var athlete: SKSpriteNode!
    private var fieldNode: SKNode!
    private var javelinNode: SKSpriteNode?
    
    private var fixedDelta: TimeInterval = 1.0 / 60.0
    private var lastTime: TimeInterval = 0
    private var accumulator: TimeInterval = 0
    
    private var isJavelin: Bool = false
    private var isActionActive: Bool = false
    private var hasLaunched: Bool = false
    private var isFinished: Bool = false
    
    private var runSpeed: Double = 0.0
    private var runDistance: Double = 0.0
    private var maxRunSpeed: Double = 28.0
    private var lastTappedSide: String = ""
    
    private var finalScore: Double = 0.0
    private var jumpVelocityY: Double = 0.0
    private var jumpVelocityX: Double = 0.0
    private var gravity: Double = -9.8
    
    private var hudLabel: SKLabelNode!
    private var actionLabel: SKLabelNode!
    
    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.15, green: 0.55, blue: 0.85, alpha: 1.0)
        
        isJavelin = (GameState.shared.currentDiscipline == .javelin)
        
        setupField()
        setupAthlete()
        setupUI()
    }
    
    private func setupField() {
        fieldNode = SKNode()
        addChild(fieldNode)
        
        for i in 0..<20 {
            let grass = SKSpriteNode(imageNamed: "06-pista.png")
            grass.anchorPoint = .zero
            grass.position = CGPoint(x: CGFloat(i * 64), y: 40)
            grass.size = CGSize(width: 64, height: 64)
            fieldNode.addChild(grass)
        }
        
        // Foul / Throw line indicator
        let foulLine = SKShapeNode(rectOf: CGSize(width: 8, height: 60))
        foulLine.fillColor = .red
        foulLine.position = CGPoint(x: 320, y: 70)
        fieldNode.addChild(foulLine)
    }
    
    private func setupAthlete() {
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = isJavelin ? "\(charType)CorreJabalina" : "\(charType)Corre"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: atlasName)
        
        athlete = SKSpriteNode(texture: textures.first ?? SKTexture())
        athlete.size = CGSize(width: 80, height: 80)
        athlete.position = CGPoint(x: 60, y: 75)
        athlete.zPosition = 10
        addChild(athlete)
        
        if !textures.isEmpty {
            athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.07)))
        }
    }
    
    private func setupUI() {
        hudLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        hudLabel.text = isJavelin ? "JAVELIN: Tap Alternating to Run -> Tap THROW!" : "LONG JUMP: Run Fast -> Tap JUMP at Line!"
        hudLabel.fontSize = 13
        hudLabel.fontColor = .yellow
        hudLabel.position = CGPoint(x: 240, y: 295)
        addChild(hudLabel)
        
        // Left & Right running buttons
        let leftBtn = SKShapeNode(rectOf: CGSize(width: 90, height: 45), cornerRadius: 8)
        leftBtn.position = CGPoint(x: 70, y: 30)
        leftBtn.fillColor = SKColor(red: 0.2, green: 0.4, blue: 0.8, alpha: 0.8)
        leftBtn.name = "btnLeft"
        leftBtn.zPosition = 20
        addChild(leftBtn)
        
        let leftLbl = SKLabelNode(fontNamed: "Helvetica-Bold")
        leftLbl.text = "LEFT"
        leftLbl.fontSize = 14
        leftLbl.position = CGPoint(x: 70, y: 25)
        leftLbl.name = "btnLeft"
        leftLbl.zPosition = 21
        addChild(leftLbl)
        
        let rightBtn = SKShapeNode(rectOf: CGSize(width: 90, height: 45), cornerRadius: 8)
        rightBtn.position = CGPoint(x: 180, y: 30)
        rightBtn.fillColor = SKColor(red: 0.8, green: 0.3, blue: 0.2, alpha: 0.8)
        rightBtn.name = "btnRight"
        rightBtn.zPosition = 20
        addChild(rightBtn)
        
        let rightLbl = SKLabelNode(fontNamed: "Helvetica-Bold")
        rightLbl.text = "RIGHT"
        rightLbl.fontSize = 14
        rightLbl.position = CGPoint(x: 180, y: 25)
        rightLbl.name = "btnRight"
        rightLbl.zPosition = 21
        addChild(rightLbl)
        
        // Action Button (JUMP or THROW)
        let actionBtn = SKShapeNode(rectOf: CGSize(width: 120, height: 45), cornerRadius: 8)
        actionBtn.position = CGPoint(x: 390, y: 30)
        actionBtn.fillColor = SKColor(red: 0.1, green: 0.7, blue: 0.3, alpha: 0.8)
        actionBtn.name = "btnAction"
        actionBtn.zPosition = 20
        addChild(actionBtn)
        
        actionLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        actionLabel.text = isJavelin ? "THROW" : "JUMP"
        actionLabel.fontSize = 15
        actionLabel.position = CGPoint(x: 390, y: 25)
        actionLabel.name = "btnAction"
        actionLabel.zPosition = 21
        addChild(actionLabel)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !hasLaunched, let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            guard let name = node.name else { continue }
            
            if name == "btnLeft" {
                if lastTappedSide != "left" {
                    lastTappedSide = "left"
                    runSpeed = min(maxRunSpeed, runSpeed + 4.0)
                    SoundManager.shared.playSound(named: "step.mp3")
                }
            } else if name == "btnRight" {
                if lastTappedSide != "right" {
                    lastTappedSide = "right"
                    runSpeed = min(maxRunSpeed, runSpeed + 4.0)
                    SoundManager.shared.playSound(named: "step.mp3")
                }
            } else if name == "btnAction" {
                triggerAction()
            }
        }
    }
    
    private func triggerAction() {
        guard !hasLaunched else { return }
        hasLaunched = true
        
        let launchSpeed = max(10.0, runSpeed)
        
        if isJavelin {
            // Throw Javelin
            SoundManager.shared.playSound(named: "arrowShot.mp3")
            let javelin = SKSpriteNode(color: .white, size: CGSize(width: 40, height: 4))
            javelin.position = CGPoint(x: athlete.position.x + 20, y: athlete.position.y + 10)
            javelin.zRotation = 0.45
            javelin.zPosition = 15
            addChild(javelin)
            javelinNode = javelin
            
            jumpVelocityX = launchSpeed * 2.8
            jumpVelocityY = launchSpeed * 1.5
            finalScore = (launchSpeed * 2.6) + Double.random(in: 15.0...25.0)
        } else {
            // Long Jump
            SoundManager.shared.playSound(named: "Boing.wav")
            jumpVelocityX = launchSpeed * 0.8
            jumpVelocityY = launchSpeed * 0.9
            finalScore = (launchSpeed * 0.25) + Double.random(in: 1.5...2.5)
            
            let charType = GameState.shared.selectedCharacter.rawValue
            let textures = AtlasLoader.shared.getAnimationSequence(atlasName: "\(charType)Jump", prefix: "\(charType)Jump")
            if !textures.isEmpty {
                athlete.removeAllActions()
                athlete.run(SKAction.animate(with: textures, timePerFrame: 0.1))
            }
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if lastTime == 0 {
            lastTime = currentTime
            return
        }
        var dt = currentTime - lastTime
        lastTime = currentTime
        if dt > 0.1 { dt = 0.1 }
        
        accumulator += dt
        while accumulator >= fixedDelta {
            tickFieldPhysics(dt: fixedDelta)
            accumulator -= fixedDelta
        }
    }
    
    private func tickFieldPhysics(dt: TimeInterval) {
        guard !isFinished else { return }
        
        if !hasLaunched {
            // Running up
            runSpeed = max(0, runSpeed - (1.5 * dt))
            runDistance += runSpeed * dt
            athlete.position.x = min(300, 60 + CGFloat(runDistance * 10))
            if athlete.position.x >= 295 {
                // Auto trigger at foul line if not tapped
                triggerAction()
            }
        } else {
            // Flight phase
            if isJavelin, let jav = javelinNode {
                jav.position.x += CGFloat(jumpVelocityX * dt * 8.0)
                jav.position.y += CGFloat(jumpVelocityY * dt * 4.0)
                jumpVelocityY += gravity * dt * 6.0
                jav.zRotation -= CGFloat(0.5 * dt)
                
                if jav.position.y <= 50 {
                    // Javelin stuck in ground
                    SoundManager.shared.playSound(named: "clava.mp3")
                    finishEvent()
                }
            } else {
                // Long jump flight
                athlete.position.x += CGFloat(jumpVelocityX * dt * 8.0)
                athlete.position.y += CGFloat(jumpVelocityY * dt * 4.0)
                jumpVelocityY += gravity * dt * 6.0
                
                if athlete.position.y <= 75 {
                    athlete.position.y = 75
                    SoundManager.shared.playSound(named: "step.mp3")
                    finishEvent()
                }
            }
        }
    }
    
    private func finishEvent() {
        isFinished = true
        SoundManager.shared.playSound(named: "Medal.caf")
        
        let disc = GameState.shared.currentDiscipline
        GameState.shared.lastScore = finalScore
        
        let records = DatabaseManager.shared.getRecords(forDiscipline: disc.rawValue)
        let bestRecord = records.first?.score ?? 0.0
        let isRecord = (finalScore > bestRecord)
        GameState.shared.isNewRecord = isRecord
        
        if isRecord {
            DatabaseManager.shared.addRecord(name: GameState.shared.selectedCountryName, score: finalScore, disciplineId: disc.rawValue)
        }
        
        if disc.rawValue < 5 {
            DatabaseManager.shared.unlockDiscipline(disciplineId: disc.rawValue + 1)
        }
        
        let wait = SKAction.wait(forDuration: 1.5)
        let transition = SKAction.run { [weak self] in
            let scene = MedalsScene(size: CGSize(width: 480, height: 320))
            scene.scaleMode = .aspectFit
            self?.view?.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
        }
        run(SKAction.sequence([wait, transition]))
    }
}

