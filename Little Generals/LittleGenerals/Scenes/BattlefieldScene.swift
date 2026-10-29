import SpriteKit

public class BattlefieldScene: SKScene {
    public var levelNumber: Int = 1

    private var terrainPoints: [CGPoint] = []
    private var terrainNode: SKShapeNode?

    private var playerTankNode: SKNode!
    private var playerTurret: SKNode!
    private var playerHealth: Double = 100
    private var playerMaxHealth: Double = 100
    private var playerHealthBar: SKShapeNode!

    private var aiTankNode: SKNode!
    private var aiTurret: SKNode!
    private var aiHealth: Double = 100
    private var aiMaxHealth: Double = 100
    private var aiHealthBar: SKShapeNode!

    private var aimAngle: CGFloat = 45.0 // degrees
    private var firePower: CGFloat = 65.0 // 10 to 100
    private var windSpeed: CGFloat = 0.0

    private var angleLabel: SKLabelNode!
    private var powerLabel: SKLabelNode!
    private var windLabel: SKLabelNode!
    private var speechBubble: SKLabelNode?

    private var isPlayerTurn: Bool = true
    private var isProjectileActive: Bool = false

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.45, green: 0.72, blue: 0.95, alpha: 1.0)
        setupEnvironment()
        setupTerrain()
        setupTanks()
        setupHUD()
        startTurn()
    }

    private func setupEnvironment() {
        // Sky gradient and clouds
        let sun = SKShapeNode(circleOfRadius: 35)
        sun.fillColor = SKColor(red: 1.0, green: 0.95, blue: 0.4, alpha: 0.9)
        sun.strokeColor = .clear
        sun.position = CGPoint(x: size.width * 0.8, y: size.height * 0.85)
        sun.zPosition = -20
        addChild(sun)

        // Backdrop mountains
        let mountain = SKShapeNode()
        let mPath = CGMutablePath()
        mPath.move(to: CGPoint(x: 0, y: 150))
        mPath.addLine(to: CGPoint(x: 200, y: 350))
        mPath.addLine(to: CGPoint(x: 450, y: 220))
        mPath.addLine(to: CGPoint(x: 700, y: 380))
        mPath.addLine(to: CGPoint(x: size.width, y: 260))
        mPath.addLine(to: CGPoint(x: size.width, y: 0))
        mPath.addLine(to: CGPoint(x: 0, y: 0))
        mPath.closeSubpath()
        mountain.path = mPath
        mountain.fillColor = SKColor(red: 0.6, green: 0.5, blue: 0.45, alpha: 0.4)
        mountain.strokeColor = .clear
        mountain.zPosition = -15
        addChild(mountain)
    }

    private func setupTerrain() {
        terrainPoints.removeAll()
        let steps = 40
        let stepWidth = size.width / CGFloat(steps)

        // Generate gentle rolling hills
        for i in 0...steps {
            let x = CGFloat(i) * stepWidth
            let normalizedX = x / size.width
            let baseH: CGFloat = 130.0
            let hill1 = sin(normalizedX * .pi * 2.5) * 45.0
            let hill2 = cos(normalizedX * .pi * 1.5) * 25.0
            let y = baseH + hill1 + hill2
            terrainPoints.append(CGPoint(x: x, y: max(60, y)))
        }

        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        for p in terrainPoints {
            path.addLine(to: p)
        }
        path.addLine(to: CGPoint(x: size.width, y: 0))
        path.closeSubpath()

        let ground = SKShapeNode(path: path)
        ground.fillColor = SKColor(red: 0.42, green: 0.62, blue: 0.28, alpha: 1.0)
        ground.strokeColor = SKColor(red: 0.35, green: 0.50, blue: 0.20, alpha: 1.0)
        ground.lineWidth = 4.0
        ground.zPosition = 1
        addChild(ground)
        self.terrainNode = ground
    }

    private func getGroundElevation(at x: CGFloat) -> CGFloat {
        guard !terrainPoints.isEmpty else { return 120 }
        if x <= terrainPoints.first!.x { return terrainPoints.first!.y }
        if x >= terrainPoints.last!.x { return terrainPoints.last!.y }

        for i in 0..<(terrainPoints.count - 1) {
            let p1 = terrainPoints[i]
            let p2 = terrainPoints[i + 1]
            if x >= p1.x && x <= p2.x {
                let t = (x - p1.x) / (p2.x - p1.x)
                return p1.y + t * (p2.y - p1.y)
            }
        }
        return 120
    }

    private func setupTanks() {
        // Player Tank
        let playerX: CGFloat = 140
        let playerY = getGroundElevation(at: playerX)
        playerTankNode = SKNode()
        playerTankNode.position = CGPoint(x: playerX, y: playerY + 12)
        playerTankNode.zPosition = 5
        addChild(playerTankNode)

        let selectedTank = GameState.shared.selectedTank
        playerMaxHealth = Double(selectedTank.armor)
        playerHealth = playerMaxHealth

        let playerBody = SKSpriteNode(color: SKColor(red: 0.2, green: 0.55, blue: 0.2, alpha: 1.0), size: CGSize(width: 44, height: 22))
        playerBody.name = "player_body"
        playerTankNode.addChild(playerBody)

        let playerTreads = SKShapeNode(rectOf: CGSize(width: 48, height: 8), cornerRadius: 3)
        playerTreads.fillColor = SKColor(white: 0.15, alpha: 1.0)
        playerTreads.strokeColor = .clear
        playerTreads.position = CGPoint(x: 0, y: -9)
        playerTankNode.addChild(playerTreads)

        playerTurret = SKNode()
        playerTurret.position = CGPoint(x: 2, y: 5)
        let playerBarrel = SKShapeNode(rectOf: CGSize(width: 24, height: 5))
        playerBarrel.fillColor = SKColor(white: 0.25, alpha: 1.0)
        playerBarrel.strokeColor = .clear
        playerBarrel.position = CGPoint(x: 12, y: 0)
        playerTurret.addChild(playerBarrel)
        playerTankNode.addChild(playerTurret)
        updatePlayerTurretAngle()

        playerHealthBar = SKShapeNode(rectOf: CGSize(width: 50, height: 6), cornerRadius: 2)
        playerHealthBar.fillColor = .green
        playerHealthBar.strokeColor = .black
        playerHealthBar.position = CGPoint(x: 0, y: 26)
        playerTankNode.addChild(playerHealthBar)

        // AI Enemy Tank
        let aiX: CGFloat = size.width - 140
        let aiY = getGroundElevation(at: aiX)
        aiTankNode = SKNode()
        aiTankNode.position = CGPoint(x: aiX, y: aiY + 12)
        aiTankNode.zPosition = 5
        addChild(aiTankNode)

        aiMaxHealth = 90.0 + Double(levelNumber) * 15.0
        aiHealth = aiMaxHealth

        let aiBody = SKSpriteNode(color: SKColor(red: 0.75, green: 0.22, blue: 0.2, alpha: 1.0), size: CGSize(width: 44, height: 22))
        aiTankNode.addChild(aiBody)

        let aiTreads = SKShapeNode(rectOf: CGSize(width: 48, height: 8), cornerRadius: 3)
        aiTreads.fillColor = SKColor(white: 0.15, alpha: 1.0)
        aiTreads.strokeColor = .clear
        aiTreads.position = CGPoint(x: 0, y: -9)
        aiTankNode.addChild(aiTreads)

        aiTurret = SKNode()
        aiTurret.position = CGPoint(x: -2, y: 5)
        let aiBarrel = SKShapeNode(rectOf: CGSize(width: 24, height: 5))
        aiBarrel.fillColor = SKColor(white: 0.25, alpha: 1.0)
        aiBarrel.strokeColor = .clear
        aiBarrel.position = CGPoint(x: -12, y: 0)
        aiTurret.addChild(aiBarrel)
        aiTankNode.addChild(aiTurret)

        aiHealthBar = SKShapeNode(rectOf: CGSize(width: 50, height: 6), cornerRadius: 2)
        aiHealthBar.fillColor = .red
        aiHealthBar.strokeColor = .black
        aiHealthBar.position = CGPoint(x: 0, y: 26)
        aiTankNode.addChild(aiHealthBar)

        // Initial preamble trash talk from AI
        showSpeech(TrashTalkManager.shared.randomPreamble(), at: aiTankNode.position)
    }

    private func setupHUD() {
        let controlBar = SKShapeNode(rectOf: CGSize(width: size.width, height: 70))
        controlBar.fillColor = SKColor(white: 0.1, alpha: 0.75)
        controlBar.strokeColor = .clear
        controlBar.position = CGPoint(x: size.width / 2, y: 35)
        controlBar.zPosition = 20
        addChild(controlBar)

        // Angle controls
        createButton(name: "angle_down", label: "◀", pos: CGPoint(x: 50, y: 35))
        createButton(name: "angle_up", label: "▶", pos: CGPoint(x: 160, y: 35))
        angleLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        angleLabel.fontSize = 16
        angleLabel.fontColor = .white
        angleLabel.position = CGPoint(x: 105, y: 28)
        angleLabel.zPosition = 21
        addChild(angleLabel)

        // Power controls
        createButton(name: "power_down", label: "-", pos: CGPoint(x: 230, y: 35))
        createButton(name: "power_up", label: "+", pos: CGPoint(x: 340, y: 35))
        powerLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        powerLabel.fontSize = 16
        powerLabel.fontColor = .white
        powerLabel.position = CGPoint(x: 285, y: 28)
        powerLabel.zPosition = 21
        addChild(powerLabel)

        // Wind indicator
        windLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        windLabel.fontSize = 16
        windLabel.fontColor = SKColor(red: 0.9, green: 0.95, blue: 0.3, alpha: 1.0)
        windLabel.position = CGPoint(x: 460, y: 28)
        windLabel.zPosition = 21
        addChild(windLabel)

        // Fire Button
        let fireBtn = SKShapeNode(rectOf: CGSize(width: 140, height: 48), cornerRadius: 10)
        fireBtn.name = "fire_btn"
        fireBtn.fillColor = SKColor(red: 0.9, green: 0.2, blue: 0.15, alpha: 1.0)
        fireBtn.strokeColor = .white
        fireBtn.lineWidth = 2.0
        fireBtn.position = CGPoint(x: size.width - 100, y: 35)
        fireBtn.zPosition = 21
        addChild(fireBtn)

        let fireLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        fireLabel.name = "fire_btn"
        fireLabel.text = "FIRE!"
        fireLabel.fontSize = 22
        fireLabel.fontColor = .white
        fireLabel.verticalAlignmentMode = .center
        fireLabel.position = fireBtn.position
        fireLabel.zPosition = 22
        addChild(fireLabel)

        updateHUD()
    }

    private func createButton(name: String, label: String, pos: CGPoint) {
        let btn = SKShapeNode(circleOfRadius: 20)
        btn.name = name
        btn.fillColor = SKColor(white: 0.25, alpha: 1.0)
        btn.strokeColor = .white
        btn.lineWidth = 1.5
        btn.position = pos
        btn.zPosition = 21
        addChild(btn)

        let text = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        text.name = name
        text.text = label
        text.fontSize = 18
        text.fontColor = .white
        text.verticalAlignmentMode = .center
        text.position = pos
        text.zPosition = 22
        addChild(text)
    }

    private func updateHUD() {
        angleLabel.text = "ANG: \(Int(aimAngle))°"
        powerLabel.text = "PWR: \(Int(firePower))%"
        let dir = windSpeed >= 0 ? "▶" : "◀"
        windLabel.text = "WIND: \(dir) \(String(format: "%.1f", abs(windSpeed)))"
    }

    private func updatePlayerTurretAngle() {
        let rad = aimAngle * .pi / 180.0
        playerTurret.zRotation = rad
    }

    private func startTurn() {
        isProjectileActive = false
        windSpeed = CGFloat.random(in: -4.0...4.0)
        updateHUD()

        if !isPlayerTurn {
            runAITurn()
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, isPlayerTurn, !isProjectileActive else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            switch node.name {
            case "angle_up":
                aimAngle = min(85, aimAngle + 2)
                updatePlayerTurretAngle()
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "angle_down":
                aimAngle = max(10, aimAngle - 2)
                updatePlayerTurretAngle()
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "power_up":
                firePower = min(100, firePower + 5)
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "power_down":
                firePower = max(15, firePower - 5)
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "fire_btn":
                firePlayerProjectile()
            default:
                break
            }
        }
    }

    private func firePlayerProjectile() {
        guard !isProjectileActive else { return }
        isProjectileActive = true
        SoundManager.shared.playSound("shot.mp3")

        let rad = aimAngle * .pi / 180.0
        let speed = firePower * 10.5
        let vx = cos(rad) * speed
        let vy = sin(rad) * speed

        let spawnPos = CGPoint(x: playerTankNode.position.x + 20, y: playerTankNode.position.y + 12)
        spawnProjectile(from: spawnPos, velocity: CGVector(dx: vx, dy: vy), isPlayer: true)
    }

    private func runAITurn() {
        // AI aims toward player with increasing precision based on level
        let distance = aiTankNode.position.x - playerTankNode.position.x
        let estimatedAngle: CGFloat = CGFloat.random(in: 40...55)
        let rad = estimatedAngle * .pi / 180.0
        let targetSpeed = sqrt((distance * 980) / sin(2 * rad))
        let inaccuracy = CGFloat.random(in: -30...30) / CGFloat(levelNumber)
        let aiPower = max(20, min(100, (targetSpeed / 10.5) + inaccuracy))

        aiTurret.zRotation = -rad

        run(SKAction.wait(forDuration: 1.2)) { [weak self] in
            guard let self = self else { return }
            SoundManager.shared.playSound("missilefire.mp3")
            let vx = -cos(rad) * (aiPower * 10.5)
            let vy = sin(rad) * (aiPower * 10.5)
            let spawnPos = CGPoint(x: self.aiTankNode.position.x - 20, y: self.aiTankNode.position.y + 12)
            self.spawnProjectile(from: spawnPos, velocity: CGVector(dx: vx, dy: vy), isPlayer: false)
        }
    }

    private func spawnProjectile(from start: CGPoint, velocity: CGVector, isPlayer: Bool) {
        let missile = SKShapeNode(circleOfRadius: 4.5)
        missile.fillColor = isPlayer ? .yellow : .orange
        missile.strokeColor = .white
        missile.position = start
        missile.zPosition = 10
        addChild(missile)

        var currentPos = start
        var curVx = velocity.dx
        var curVy = velocity.dy
        let dt: CGFloat = 1.0 / 60.0
        let gravity: CGFloat = -480.0

        let flyAction = SKAction.customAction(withDuration: 4.0) { [weak self] _, elapsedTime in
            guard let self = self else { return }
            curVx += self.windSpeed * 12.0 * dt
            curVy += gravity * dt
            currentPos.x += curVx * dt
            currentPos.y += curVy * dt
            missile.position = currentPos

            // Smoke trail particle
            let smoke = SKShapeNode(circleOfRadius: 2.5)
            smoke.fillColor = SKColor(white: 0.8, alpha: 0.6)
            smoke.strokeColor = .clear
            smoke.position = currentPos
            smoke.zPosition = 9
            self.addChild(smoke)
            smoke.run(SKAction.sequence([
                SKAction.fadeAlpha(to: 0.0, duration: 0.35),
                SKAction.removeFromParent()
            ]))

            // Collision check
            let targetNode = isPlayer ? self.aiTankNode : self.playerTankNode
            let groundY = self.getGroundElevation(at: currentPos.x)

            if let target = targetNode, target.position.distance(to: currentPos) < 28 {
                missile.removeAllActions()
                missile.removeFromParent()
                self.handleImpact(at: currentPos, hitTank: true, isPlayerAttacker: isPlayer)
            } else if currentPos.y <= groundY || currentPos.x < 0 || currentPos.x > self.size.width {
                missile.removeAllActions()
                missile.removeFromParent()
                self.handleImpact(at: currentPos, hitTank: false, isPlayerAttacker: isPlayer)
            }
        }

        missile.run(flyAction)
    }

    private func handleImpact(at pos: CGPoint, hitTank: Bool, isPlayerAttacker: Bool) {
        // Explosion graphics
        let explosion = SKShapeNode(circleOfRadius: hitTank ? 32 : 18)
        explosion.fillColor = SKColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 0.9)
        explosion.strokeColor = .yellow
        explosion.lineWidth = 3.0
        explosion.position = pos
        explosion.zPosition = 15
        addChild(explosion)

        explosion.run(SKAction.sequence([
            SKAction.scale(to: 1.8, duration: 0.15),
            SKAction.fadeAlpha(to: 0.0, duration: 0.2),
            SKAction.removeFromParent()
        ]))

        if hitTank {
            SoundManager.shared.playSound("explosion.mp3")
            let damage = Double.random(in: 30...48)
            if isPlayerAttacker {
                aiHealth = max(0, aiHealth - damage)
                aiHealthBar.xScale = CGFloat(aiHealth / aiMaxHealth)
                showDamageText("-\(Int(damage))", at: aiTankNode.position)
                let talk = TrashTalkManager.shared.randomHit(currentHealth: aiHealth, maxHealth: aiMaxHealth)
                showSpeech(talk, at: aiTankNode.position)
            } else {
                playerHealth = max(0, playerHealth - damage)
                playerHealthBar.xScale = CGFloat(playerHealth / playerMaxHealth)
                showDamageText("-\(Int(damage))", at: playerTankNode.position)
            }
        } else {
            SoundManager.shared.playSound("earth_impact1.mp3")
            if isPlayerAttacker {
                showSpeech(TrashTalkManager.shared.randomMiss(), at: aiTankNode.position)
            }
        }

        // Check Victory / Defeat
        run(SKAction.wait(forDuration: 1.5)) { [weak self] in
            guard let self = self else { return }
            if self.aiHealth <= 0 {
                self.endBattle(victory: true)
            } else if self.playerHealth <= 0 {
                self.endBattle(victory: false)
            } else {
                self.isPlayerTurn.toggle()
                self.startTurn()
            }
        }
    }

    private func showDamageText(_ text: String, at pos: CGPoint) {
        let label = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        label.text = text
        label.fontSize = 22
        label.fontColor = .red
        label.position = CGPoint(x: pos.x, y: pos.y + 35)
        label.zPosition = 25
        addChild(label)

        label.run(SKAction.sequence([
            SKAction.group([
                SKAction.moveBy(x: 0, y: 30, duration: 0.8),
                SKAction.fadeAlpha(to: 0.0, duration: 0.8)
            ]),
            SKAction.removeFromParent()
        ]))
    }

    private func showSpeech(_ text: String, at pos: CGPoint) {
        speechBubble?.removeFromParent()
        let bubble = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        bubble.text = "\"\(text)\""
        bubble.fontSize = 15
        bubble.fontColor = .white
        bubble.position = CGPoint(x: pos.x, y: pos.y + 45)
        bubble.zPosition = 30
        addChild(bubble)
        self.speechBubble = bubble

        bubble.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.2),
            SKAction.fadeAlpha(to: 0.0, duration: 0.5),
            SKAction.removeFromParent()
        ]))
    }

    private func endBattle(victory: Bool) {
        GameState.shared.lastBattleWon = victory
        if victory {
            GameState.shared.warbux += 150 * levelNumber
            GameState.shared.currentLevel = max(GameState.shared.currentLevel, levelNumber + 1)
        }
        let overScene = BattleOverScene(size: size)
        overScene.scaleMode = scaleMode
        view?.presentScene(overScene, transition: SKTransition.doorsCloseHorizontal(withDuration: 0.6))
    }
}

private extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return hypot(x - point.x, y - point.y)
    }
}
