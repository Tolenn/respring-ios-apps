import SpriteKit

public class RunningScene: SKScene {
    private var athlete: SKSpriteNode!
    private var trackNode: SKNode!
    
    // Physics & Timing
    private var fixedDelta: TimeInterval = 1.0 / 60.0
    private var lastTime: TimeInterval = 0
    private var accumulator: TimeInterval = 0
    
    private var elapsedTime: Double = 0.0
    private var distanceTraveled: Double = 0.0
    private var targetDistance: Double = 100.0
    private var currentSpeed: Double = 0.0
    private var maxSpeed: Double = 32.0 // meters/second in game units
    private var accelerationPerTap: Double = 3.5
    private var friction: Double = 2.2
    
    // Alternating tap state
    private var lastTappedSide: String = "" // "left" or "right"
    private var consecutiveErrorCount: Int = 0
    
    // Game state
    private var isRacing: Bool = false
    private var hasStarted: Bool = false
    private var isJumping: Bool = false
    private var isHurdles: Bool = false
    private var hurdles: [SKSpriteNode] = []
    
    // UI Elements
    private var timeLabel: SKLabelNode!
    private var distanceLabel: SKLabelNode!
    private var speedLabel: SKLabelNode!
    private var countdownLabel: SKLabelNode!
    private var jumpButton: SKShapeNode?
    
    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.2, green: 0.6, blue: 0.9, alpha: 1.0)
        
        let disc = GameState.shared.currentDiscipline
        targetDistance = (disc == .dash400m) ? 400.0 : 100.0
        isHurdles = (disc == .hurdles)
        
        setupTrackAndBackground()
        setupAthlete()
        setupUI()
        
        startCountdown()
    }
    
    private func setupTrackAndBackground() {
        trackNode = SKNode()
        addChild(trackNode)
        
        // Pista tiles / background track
        for i in 0..<15 {
            let trackSegment = SKSpriteNode(imageNamed: "06-pista.png")
            trackSegment.anchorPoint = .zero
            trackSegment.position = CGPoint(x: CGFloat(i * 64), y: 40)
            trackSegment.size = CGSize(width: 64, height: 64)
            trackNode.addChild(trackSegment)
        }
        
        // Grass foreground
        for i in 0..<15 {
            let grass = SKSpriteNode(imageNamed: "06-pista.png")
            grass.anchorPoint = .zero
            grass.position = CGPoint(x: CGFloat(i * 64), y: 0)
            grass.size = CGSize(width: 64, height: 40)
            trackNode.addChild(grass)
        }
        
        // If hurdles, spawn initial hurdles along the track
        if isHurdles {
            for h in 1...6 {
                let hurdle = SKSpriteNode(color: .white, size: CGSize(width: 12, height: 28))
                hurdle.position = CGPoint(x: CGFloat(h * 180 + 200), y: 64)
                trackNode.addChild(hurdle)
                hurdles.append(hurdle)
            }
        }
    }
    
    private func setupAthlete() {
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = "\(charType)Salida"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: "\(charType)Salida")
        
        athlete = SKSpriteNode(texture: textures.first ?? SKTexture())
        athlete.size = CGSize(width: 80, height: 80)
        athlete.position = CGPoint(x: 100, y: 75)
        athlete.zPosition = 10
        addChild(athlete)
    }
    
    private func setupUI() {
        // Top HUD
        timeLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        timeLabel.text = "TIME: 0.00s"
        timeLabel.fontSize = 14
        timeLabel.fontColor = .white
        timeLabel.position = CGPoint(x: 70, y: 295)
        addChild(timeLabel)
        
        distanceLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        distanceLabel.text = "DIST: 0.0m / \(Int(targetDistance))m"
        distanceLabel.fontSize = 14
        distanceLabel.fontColor = .yellow
        distanceLabel.position = CGPoint(x: 240, y: 295)
        addChild(distanceLabel)
        
        speedLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        speedLabel.text = "SPEED: 0.0"
        speedLabel.fontSize = 14
        speedLabel.fontColor = .green
        speedLabel.position = CGPoint(x: 410, y: 295)
        addChild(speedLabel)
        
        // On-screen Tap Buttons for running (Left Leg / Right Leg)
        let leftTapZone = SKShapeNode(rectOf: CGSize(width: 100, height: 50), cornerRadius: 10)
        leftTapZone.position = CGPoint(x: 80, y: 35)
        leftTapZone.fillColor = SKColor(red: 0.2, green: 0.4, blue: 0.8, alpha: 0.7)
        leftTapZone.strokeColor = .white
        leftTapZone.name = "btnLeftTap"
        leftTapZone.zPosition = 20
        addChild(leftTapZone)
        
        let leftLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        leftLabel.text = "LEFT"
        leftLabel.fontSize = 15
        leftLabel.fontColor = .white
        leftLabel.position = CGPoint(x: 80, y: 29)
        leftLabel.name = "btnLeftTap"
        leftLabel.zPosition = 21
        addChild(leftLabel)
        
        let rightTapZone = SKShapeNode(rectOf: CGSize(width: 100, height: 50), cornerRadius: 10)
        rightTapZone.position = CGPoint(x: 200, y: 35)
        rightTapZone.fillColor = SKColor(red: 0.8, green: 0.3, blue: 0.2, alpha: 0.7)
        rightTapZone.strokeColor = .white
        rightTapZone.name = "btnRightTap"
        rightTapZone.zPosition = 20
        addChild(rightTapZone)
        
        let rightLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        rightLabel.text = "RIGHT"
        rightLabel.fontSize = 15
        rightLabel.fontColor = .white
        rightLabel.position = CGPoint(x: 200, y: 29)
        rightLabel.name = "btnRightTap"
        rightLabel.zPosition = 21
        addChild(rightLabel)
        
        if isHurdles {
            let jumpBtn = SKShapeNode(rectOf: CGSize(width: 90, height: 50), cornerRadius: 10)
            jumpBtn.position = CGPoint(x: 400, y: 35)
            jumpBtn.fillColor = SKColor(red: 0.1, green: 0.7, blue: 0.3, alpha: 0.8)
            jumpBtn.strokeColor = .white
            jumpBtn.name = "btnJump"
            jumpBtn.zPosition = 20
            addChild(jumpBtn)
            jumpButton = jumpBtn
            
            let jumpLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
            jumpLabel.text = "JUMP"
            jumpLabel.fontSize = 15
            jumpLabel.fontColor = .white
            jumpLabel.position = CGPoint(x: 400, y: 29)
            jumpLabel.name = "btnJump"
            jumpLabel.zPosition = 21
            addChild(jumpLabel)
        }
    }
    
    private func startCountdown() {
        countdownLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        countdownLabel.fontSize = 40
        countdownLabel.fontColor = .yellow
        countdownLabel.position = CGPoint(x: 240, y: 160)
        countdownLabel.zPosition = 30
        addChild(countdownLabel)
        
        let countSeq = [
            SKAction.run { [weak self] in
                self?.countdownLabel.text = "READY..."
                SoundManager.shared.playSound(named: "beep.wav")
            },
            SKAction.wait(forDuration: 1.0),
            SKAction.run { [weak self] in
                self?.countdownLabel.text = "SET..."
                SoundManager.shared.playSound(named: "beep.wav")
            },
            SKAction.wait(forDuration: 1.0),
            SKAction.run { [weak self] in
                self?.countdownLabel.text = "GO!"
                SoundManager.shared.playSound(named: "go.caf")
                self?.isRacing = true
                self?.hasStarted = true
                self?.switchRunningAnimation()
            },
            SKAction.wait(forDuration: 0.6),
            SKAction.removeFromParent()
        ]
        countdownLabel.run(SKAction.sequence(countSeq))
    }
    
    private func switchRunningAnimation() {
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = "\(charType)Corre"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: "\(charType)Corre")
        if !textures.isEmpty {
            athlete.removeAllActions()
            athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.06)))
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isRacing, let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            guard let name = node.name else { continue }
            
            if name == "btnLeftTap" {
                handleTap(side: "left")
            } else if name == "btnRightTap" {
                handleTap(side: "right")
            } else if name == "btnJump" {
                handleJump()
            }
        }
    }
    
    private func handleTap(side: String) {
        if side != lastTappedSide {
            // Correct alternating tap!
            lastTappedSide = side
            currentSpeed = min(maxSpeed, currentSpeed + accelerationPerTap)
            SoundManager.shared.playSound(named: "step.mp3")
        } else {
            // Stumble: same side tapped twice consecutively
            currentSpeed = max(0, currentSpeed - 4.0)
            SoundManager.shared.playSound(named: "wahwah.caf")
        }
    }
    
    private func handleJump() {
        guard !isJumping else { return }
        isJumping = true
        SoundManager.shared.playSound(named: "Boing.wav")
        
        let jumpUp = SKAction.moveBy(x: 0, y: 45, duration: 0.28)
        let jumpDown = SKAction.moveBy(x: 0, y: -45, duration: 0.28)
        let resetJump = SKAction.run { [weak self] in
            self?.isJumping = false
        }
        athlete.run(SKAction.sequence([jumpUp, jumpDown, resetJump]))
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
            tickPhysics(dt: fixedDelta)
            accumulator -= fixedDelta
        }
    }
    
    private func tickPhysics(dt: TimeInterval) {
        guard isRacing else { return }
        
        elapsedTime += dt
        
        // Apply friction
        currentSpeed = max(0, currentSpeed - (friction * dt))
        
        // Distance
        let moveDistance = currentSpeed * dt
        distanceTraveled += moveDistance
        
        // Parallax scroll track backwards
        trackNode.position.x -= CGFloat(moveDistance * 20.0)
        if trackNode.position.x <= -64.0 {
            trackNode.position.x += 64.0
        }
        
        // Check hurdles collision
        if isHurdles && !isJumping {
            for h in hurdles {
                let hurdleSceneX = h.position.x + trackNode.position.x
                if abs(hurdleSceneX - athlete.position.x) < 20 {
                    // Knocked hurdle
                    currentSpeed = max(0, currentSpeed - 8.0)
                    SoundManager.shared.playSound(named: "wrong.caf")
                }
            }
        }
        
        // Update HUD
        timeLabel.text = String(format: "TIME: %.2fs", elapsedTime)
        distanceLabel.text = String(format: "DIST: %.1fm / %dm", min(targetDistance, distanceTraveled), Int(targetDistance))
        speedLabel.text = String(format: "SPEED: %.1f", currentSpeed)
        
        // Check finish line
        if distanceTraveled >= targetDistance {
            finishRace()
        }
    }
    
    private func finishRace() {
        isRacing = false
        SoundManager.shared.playSound(named: "Medal.caf")
        
        let disc = GameState.shared.currentDiscipline
        GameState.shared.lastScore = elapsedTime
        
        // Check records
        let records = DatabaseManager.shared.getRecords(forDiscipline: disc.rawValue)
        let bestRecord = records.first?.score ?? 999.0
        let isRecord = (elapsedTime < bestRecord)
        GameState.shared.isNewRecord = isRecord
        
        if isRecord {
            DatabaseManager.shared.addRecord(name: GameState.shared.selectedCountryName, score: elapsedTime, disciplineId: disc.rawValue)
        }
        
        // Unlock next discipline
        if disc.rawValue < 5 {
            DatabaseManager.shared.unlockDiscipline(disciplineId: disc.rawValue + 1)
        }
        
        // Transition to MedalsScene
        let wait = SKAction.wait(forDuration: 1.2)
        let transition = SKAction.run { [weak self] in
            let scene = MedalsScene(size: CGSize(width: 480, height: 320))
            scene.scaleMode = .aspectFit
            self?.view?.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
        }
        run(SKAction.sequence([wait, transition]))
    }
}

