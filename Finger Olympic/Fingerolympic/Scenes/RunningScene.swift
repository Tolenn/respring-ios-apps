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
    private var maxSpeed: Double = 32.0 // meters/second
    private var accelerationPerTap: Double = 3.6
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
    private var finishLine: SKSpriteNode?
    
    // HUD & Controls
    private var timeDisplay: SKLabelNode!
    private var distDisplay: SKLabelNode!
    private var countdownNode: SKSpriteNode?
    private var countdownLabel: SKLabelNode!
    
    private var leftPrintNode: SKSpriteNode!
    private var rightPrintNode: SKSpriteNode!
    private var jumpButton: SKSpriteNode?
    
    public override func didMove(to view: SKView) {
        backgroundColor = .black
        
        let disc = GameState.shared.currentDiscipline
        targetDistance = (disc == .dash400m) ? 400.0 : 100.0
        isHurdles = (disc == .hurdles)
        
        setupEnvironment()
        setupAthlete()
        setupHUD()
        setupControls()
        
        startCountdown()
    }
    
    // MARK: - Environment & Scenery
    private func setupEnvironment() {
        // Grandstand & Stadium Background (tribuna400m.png / background.png)
        let stadiumBg = SKSpriteNode(imageNamed: "background.png")
        stadiumBg.position = CGPoint(x: 240, y: 160)
        stadiumBg.size = CGSize(width: 480, height: 320)
        stadiumBg.zPosition = 0
        addChild(stadiumBg)
        
        trackNode = SKNode()
        trackNode.zPosition = 1
        addChild(trackNode)
        
        // Pista tiles & accessories
        for i in 0..<18 {
            let track = SKSpriteNode(imageNamed: "06-pista.png")
            track.anchorPoint = .zero
            track.position = CGPoint(x: CGFloat(i * 64), y: 60)
            track.size = CGSize(width: 64, height: 70)
            trackNode.addChild(track)
        }
        
        // If hurdles, spawn authentic valla.png hurdles along the track
        if isHurdles {
            for h in 1...6 {
                let hurdle = SKSpriteNode(imageNamed: "valla.png")
                hurdle.position = CGPoint(x: CGFloat(h * 200 + 220), y: 95)
                hurdle.size = CGSize(width: 32, height: 68)
                hurdle.zPosition = 5
                trackNode.addChild(hurdle)
                hurdles.append(hurdle)
            }
        }
        
        // Finish line banner
        let banner = SKSpriteNode(imageNamed: "99-accesorios-pista.png")
        banner.position = CGPoint(x: 1400, y: 100)
        banner.size = CGSize(width: 40, height: 80)
        trackNode.addChild(banner)
        finishLine = banner
    }
    
    // MARK: - Athlete
    private func setupAthlete() {
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = "\(charType)Salida"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: "\(charType)Salida")
        
        athlete = SKSpriteNode(texture: textures.first ?? SKTexture())
        athlete.size = CGSize(width: 80, height: 80)
        athlete.position = CGPoint(x: 110, y: 105)
        athlete.zPosition = 10
        addChild(athlete)
    }
    
    // MARK: - Scoreboard HUD
    private func setupHUD() {
        let scoreboard = SKSpriteNode(imageNamed: "ScoreBoard.png")
        scoreboard.position = CGPoint(x: 240, y: 285)
        scoreboard.size = CGSize(width: 140, height: 62)
        scoreboard.zPosition = 20
        addChild(scoreboard)
        
        timeDisplay = SKLabelNode(fontNamed: "Courier-Bold")
        timeDisplay.text = "00.00s"
        timeDisplay.fontSize = 12
        timeDisplay.fontColor = .green
        timeDisplay.position = CGPoint(x: 240, y: 288)
        timeDisplay.zPosition = 21
        addChild(timeDisplay)
        
        distDisplay = SKLabelNode(fontNamed: "Courier-Bold")
        distDisplay.text = "0.0m / \(Int(targetDistance))m"
        distDisplay.fontSize = 10
        distDisplay.fontColor = .yellow
        distDisplay.position = CGPoint(x: 240, y: 272)
        distDisplay.zPosition = 21
        addChild(distDisplay)
        
        // Pause / Back button
        let homeBtn = SKSpriteNode(imageNamed: "btnHome.png")
        homeBtn.position = CGPoint(x: 35, y: 290)
        homeBtn.size = CGSize(width: 44, height: 44)
        homeBtn.name = "btnExit"
        homeBtn.zPosition = 20
        addChild(homeBtn)
        
        countdownLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        countdownLabel.text = ""
        countdownLabel.fontSize = 42
        countdownLabel.fontColor = .yellow
        countdownLabel.position = CGPoint(x: 240, y: 180)
        countdownLabel.zPosition = 30
        addChild(countdownLabel)
    }
    
    // MARK: - Controls (Authentic Fingerprints)
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
        
        // Jump Button for Hurdles
        if isHurdles {
            let jmp = SKSpriteNode(imageNamed: "btnJump.png")
            jmp.position = CGPoint(x: 240, y: 55)
            jmp.size = CGSize(width: 70, height: 70)
            jmp.name = "btnJumpHurdle"
            jmp.zPosition = 25
            addChild(jmp)
            jumpButton = jmp
        }
    }
    
    // MARK: - Countdown & Race Flow
    private func startCountdown() {
        SoundManager.shared.playSound(named: "beep.wav")
        countdownLabel.text = "READY..."
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 1.0),
            SKAction.run { [weak self] in
                self?.countdownLabel.text = "SET..."
                SoundManager.shared.playSound(named: "beep.wav")
            },
            SKAction.wait(forDuration: 1.0),
            SKAction.run { [weak self] in
                self?.countdownLabel.text = "GO!"
                SoundManager.shared.playSound(named: "go.caf")
                self?.hasStarted = true
                self?.isRacing = true
                self?.startRunningAnimation()
            },
            SKAction.wait(forDuration: 0.6),
            SKAction.run { [weak self] in
                self?.countdownLabel.text = ""
            }
        ]))
    }
    
    private func startRunningAnimation() {
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = "\(charType)Corre"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: "\(charType)Corre")
        if !textures.isEmpty {
            athlete.removeAllActions()
            athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.08)))
        }
    }
    
    // MARK: - Tap & Touch Handling
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
            
            if !hasStarted {
                // False start penalty
                if name == "btnLeftPrint" || name == "btnRightPrint" {
                    SoundManager.shared.playSound(named: "wrong.caf")
                    currentSpeed = 0
                }
                return
            }
            
            if name == "btnLeftPrint" {
                leftPrintNode.texture = SKTexture(imageNamed: "HuellaTocadaIzq.png")
                processTap(side: "left")
            } else if name == "btnRightPrint" {
                rightPrintNode.texture = SKTexture(imageNamed: "HuellaTocadaDer.png")
                processTap(side: "right")
            } else if name == "btnJumpHurdle" && isHurdles {
                triggerHurdleJump()
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        leftPrintNode.texture = SKTexture(imageNamed: "HuellaIzquierda.png")
        rightPrintNode.texture = SKTexture(imageNamed: "HuellaDerecha.png")
    }
    
    private func processTap(side: String) {
        if side != lastTappedSide {
            // Correct alternating tap
            currentSpeed = min(maxSpeed, currentSpeed + accelerationPerTap)
            lastTappedSide = side
            consecutiveErrorCount = 0
        } else {
            // Error: tapped same foot twice in a row
            consecutiveErrorCount += 1
            currentSpeed = max(0.0, currentSpeed - 2.5)
            SoundManager.shared.playSound(named: "wrong.caf")
        }
    }
    
    private func triggerHurdleJump() {
        guard !isJumping else { return }
        isJumping = true
        SoundManager.shared.playSound(named: "Boing.wav")
        
        let charType = GameState.shared.selectedCharacter.rawValue
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: "\(charType)Salta", prefix: "\(charType)Salta")
        if !textures.isEmpty {
            athlete.texture = textures.first
        }
        
        let jumpUp = SKAction.moveBy(x: 0, y: 45, duration: 0.22)
        jumpUp.timingMode = .easeOut
        let fallDown = SKAction.moveBy(x: 0, y: -45, duration: 0.22)
        fallDown.timingMode = .easeIn
        
        athlete.run(SKAction.sequence([jumpUp, fallDown])) { [weak self] in
            self?.isJumping = false
            self?.startRunningAnimation()
        }
    }
    
    // MARK: - Game Loop & Physics Accumulator
    public override func update(_ currentTime: TimeInterval) {
        if lastTime == 0 {
            lastTime = currentTime
            return
        }
        
        let delta = min(currentTime - lastTime, 0.1)
        lastTime = currentTime
        accumulator += delta
        
        while accumulator >= fixedDelta {
            physicsStep(fixedDelta)
            accumulator -= fixedDelta
        }
    }
    
    private func physicsStep(_ dt: TimeInterval) {
        guard isRacing else { return }
        
        elapsedTime += dt
        
        // Friction decay
        currentSpeed = max(0.0, currentSpeed - (friction * dt))
        
        // Advance distance
        let moveDistance = currentSpeed * dt
        distanceTraveled += moveDistance
        
        // Parallax scroll track & hurdles
        let scrollAmount = CGFloat(moveDistance * 25.0)
        trackNode.position.x -= scrollAmount
        if trackNode.position.x <= -64.0 {
            trackNode.position.x += 64.0
        }
        
        // Check hurdle collision
        if isHurdles && !isJumping {
            for hurdle in hurdles {
                let hurdleWorldPos = trackNode.convert(hurdle.position, to: self)
                if abs(hurdleWorldPos.x - athlete.position.x) < 22 {
                    // Tripped on hurdle!
                    currentSpeed = max(0.0, currentSpeed - 8.0)
                    SoundManager.shared.playSound(named: "wahwah.caf")
                    break
                }
            }
        }
        
        // Update HUD
        timeDisplay.text = String(format: "%05.2fs", elapsedTime)
        distDisplay.text = String(format: "%04.1fm / %dm", min(distanceTraveled, targetDistance), Int(targetDistance))
        
        // Finish Race
        if distanceTraveled >= targetDistance {
            finishRace()
        }
    }
    
    private func finishRace() {
        isRacing = false
        currentSpeed = 0
        SoundManager.shared.playSound(named: "Crowd_cheer.caf")
        
        let charType = GameState.shared.selectedCharacter.rawValue
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: "\(charType)Festeja", prefix: "\(charType)Festeja")
        if !textures.isEmpty {
            athlete.removeAllActions()
            athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1)))
        }
        
        // Save score & determine medal
        let disc = GameState.shared.currentDiscipline
        GameState.shared.lastScore = elapsedTime
        GameState.shared.medalWon = (elapsedTime < 11.5) ? "Gold" : ((elapsedTime < 13.5) ? "Silver" : "Bronze")
        DatabaseManager.shared.saveRecord(disciplineId: disc.rawValue, score: elapsedTime)
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 1.8),
            SKAction.run { [weak self] in
                let medals = MedalsScene(size: CGSize(width: 480, height: 320))
                medals.scaleMode = .aspectFit
                self?.view?.presentScene(medals, transition: SKTransition.fade(withDuration: 0.5))
            }
        ]))
    }
}
