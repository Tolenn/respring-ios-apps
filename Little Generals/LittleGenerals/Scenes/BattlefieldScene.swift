import SpriteKit

public class BattlefieldScene: SKScene {
    public var levelNumber: Int = 1

    private var terrain: TerrainModel?
    private var terrainNode: SKShapeNode?
    private var flairNodes: [SKNode] = []

    // Player Tank
    private var playerTankNode: SKNode?
    private var playerBodySprite: SKSpriteNode?
    private var playerTurret: SKNode?
    private var playerHealth: Double = 100
    private var playerMaxHealth: Double = 100
    private var playerHealthBar: SKShapeNode?
    private var playerHpText: SKLabelNode?
    private var playerShieldNode: SKShapeNode?
    private var hasPlayerShield: Bool = false
    private var playerFuel: CGFloat = 100.0
    private var playerDriveFrame: Int = 1

    // AI Tank
    private var aiTankNode: SKNode?
    private var aiTurret: SKNode?
    private var aiHealth: Double = 100
    private var aiMaxHealth: Double = 100
    private var aiHealthBar: SKShapeNode?
    private var aiHpText: SKLabelNode?
    private var aiShieldNode: SKShapeNode?
    private var hasAiShield: Bool = false

    // Controls & State
    private var aimAngle: CGFloat = 45.0
    private var firePower: CGFloat = 65.0
    private var windSpeed: CGFloat = 0.0

    private var currentWeapon: WeaponType = .missile
    private var weaponLabel: SKLabelNode?
    private var weaponIconSprite: SKSpriteNode?
    private var angleLabel: SKLabelNode?
    private var powerLabel: SKLabelNode?
    private var windLabel: SKLabelNode?
    private var windsockNode: SKSpriteNode?
    private var fuelBarNode: SKShapeNode?
    private var fireBtnNode: SKSpriteNode?

    // Trajectory Arc (shotPath from battleControls.lua)
    private var trajectoryDots: [SKNode] = []
    private var trajectoryContainer: SKNode?

    // Avatars & Speech
    private var playerAvatarNode: SKNode?
    private var aiAvatarNode: SKNode?
    private var activeSpeechNode: SKNode?

    private var isPlayerTurn: Bool = true
    private var isProjectileActive: Bool = false

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.52, green: 0.78, blue: 0.95, alpha: 1.0)
        let safeTerrain = TerrainModel(width: size.width, height: size.height)
        self.terrain = safeTerrain

        setupParallaxBackdrop()
        setupBedrockBase()
        setupTerrainNode()
        setupTerrainFlairs()
        setupTopAvatarsHUD()      // Set up Avatars FIRST so speech bubbles always have targets
        setupTanks()              // Set up Tanks after Avatars
        setupTrajectoryArc()
        setupBottomControlsHUD()

        startTurn()
    }

    // MARK: - 1. Parallax Environment & Atmosphere
    private func setupParallaxBackdrop() {
        // Sky gradient / atmospheric backing
        let bgTex = TextureHelper.loadTexture(named: "arizona_bkg.png", fallbackColor: SKColor(red: 0.88, green: 0.72, blue: 0.55, alpha: 1.0), size: size)
        let bgNode = SKSpriteNode(texture: bgTex)
        bgNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bgNode.size = size
        bgNode.zPosition = -50
        addChild(bgNode)

        // Distant Mesa Layer (arizona_back.png)
        let backTex = TextureHelper.loadTexture(named: "arizona_back.png", fallbackColor: .clear, size: CGSize(width: size.width, height: 180))
        let backMesa = SKSpriteNode(texture: backTex)
        backMesa.size = CGSize(width: size.width, height: 160)
        backMesa.position = CGPoint(x: size.width / 2, y: 220)
        backMesa.alpha = 0.75
        backMesa.zPosition = -40
        addChild(backMesa)

        // Midground Bluffs Layer (arizona_middle.png)
        let midTex = TextureHelper.loadTexture(named: "arizona_middle.png", fallbackColor: .clear, size: CGSize(width: size.width, height: 140))
        let midMesa = SKSpriteNode(texture: midTex)
        midMesa.size = CGSize(width: size.width, height: 130)
        midMesa.position = CGPoint(x: size.width / 2, y: 170)
        midMesa.alpha = 0.88
        midMesa.zPosition = -30
        addChild(midMesa)

        // Drifting Clouds (cloud1, cloud2, cloud3)
        spawnDriftingClouds()
    }

    private func spawnDriftingClouds() {
        let cloudNames = ["cloud1.png", "cloud2.png", "cloud3.png"]
        for i in 0..<4 {
            let name = cloudNames[i % cloudNames.count]
            let cloudTex = TextureHelper.loadTexture(named: name, fallbackColor: SKColor(white: 1.0, alpha: 0.7), size: CGSize(width: 80, height: 40))
            let cloud = SKSpriteNode(texture: cloudTex)
            let startX = CGFloat.random(in: 0...size.width)
            let startY = size.height - CGFloat.random(in: 60...150)
            cloud.position = CGPoint(x: startX, y: startY)
            cloud.zPosition = -35
            cloud.alpha = CGFloat.random(in: 0.65...0.9)
            cloud.setScale(CGFloat.random(in: 0.7...1.2))
            addChild(cloud)

            let speed = Double.random(in: 35.0...65.0)
            let travelDistance = size.width + 120
            let duration = Double(travelDistance) / speed

            let moveAcross = SKAction.sequence([
                SKAction.moveTo(x: size.width + 80, duration: duration * Double((size.width + 80 - startX) / travelDistance)),
                SKAction.run { cloud.position.x = -80 },
                SKAction.moveTo(x: size.width + 80, duration: duration)
            ])
            cloud.run(SKAction.repeatForever(moveAcross))
        }
    }

    // MARK: - 2. Bedrock Substrate & Terrain
    private func setupBedrockBase() {
        let bedrockTex = TextureHelper.loadTexture(named: "bedrock.png", fallbackColor: SKColor(white: 0.15, alpha: 1.0), size: CGSize(width: 128, height: 80))
        let tileWidth: CGFloat = 120
        var xPos: CGFloat = 0
        while xPos < size.width + tileWidth {
            let bedrock = SKSpriteNode(texture: bedrockTex)
            bedrock.size = CGSize(width: tileWidth, height: 60)
            bedrock.position = CGPoint(x: xPos, y: 30)
            bedrock.zPosition = -10
            addChild(bedrock)
            xPos += tileWidth
        }
    }

    private func setupTerrainNode() {
        guard let terrain = terrain else { return }
        let ground = SKShapeNode(path: terrain.createPath())
        ground.fillColor = SKColor(red: 0.78, green: 0.52, blue: 0.28, alpha: 1.0)
        ground.strokeColor = SKColor(red: 0.55, green: 0.35, blue: 0.18, alpha: 1.0)
        ground.lineWidth = 4.0
        ground.zPosition = 1
        addChild(ground)
        self.terrainNode = ground
    }

    private func setupTerrainFlairs() {
        guard let terrain = terrain else { return }
        flairNodes.forEach { $0.removeFromParent() }
        flairNodes.removeAll()

        let flairs = ["cactus1.png", "cactus2.png", "cactus3.png", "grass1.png", "grass2.png"]
        let sampleXs: [CGFloat] = [230, 290, 360, 430, 500, 560]

        for x in sampleXs {
            guard x < size.width - 160 else { continue }
            let flairName = flairs.randomElement() ?? "cactus1.png"
            let isCactus = flairName.contains("cactus")
            let size = isCactus ? CGSize(width: 22, height: 32) : CGSize(width: 18, height: 14)
            let tex = TextureHelper.loadTexture(named: flairName, fallbackColor: .green, size: size)
            let sprite = SKSpriteNode(texture: tex, size: size)
            let y = terrain.valueAt(x: x)
            sprite.position = CGPoint(x: x, y: y + (size.height / 2) - 2)
            sprite.zRotation = terrain.slopeAt(x: x)
            sprite.zPosition = 2
            addChild(sprite)
            flairNodes.append(sprite)
        }
    }

    private func updateTerrainMesh() {
        guard let terrain = terrain else { return }
        terrainNode?.path = terrain.createPath()
        for flair in flairNodes {
            let x = flair.position.x
            let y = terrain.valueAt(x: x)
            let h = flair.frame.height
            flair.position.y = y + (h / 2) - 2
            flair.zRotation = terrain.slopeAt(x: x)
        }
    }

    // MARK: - 3. Tanks Setup
    private func setupTanks() {
        guard let terrain = terrain else { return }
        let selectedTank = GameState.shared.selectedTank
        playerMaxHealth = Double(selectedTank.armor)
        playerHealth = playerMaxHealth

        // Player Tank
        let playerX: CGFloat = 140
        let playerY = terrain.valueAt(x: playerX)
        let pNode = SKNode()
        pNode.position = CGPoint(x: playerX, y: playerY + 14)
        pNode.zRotation = terrain.slopeAt(x: playerX)
        pNode.zPosition = 5
        addChild(pNode)
        self.playerTankNode = pNode

        let tankTex = TextureHelper.loadTexture(named: selectedTank.textureName, fallbackColor: SKColor(red: 0.25, green: 0.6, blue: 0.25, alpha: 1.0), size: CGSize(width: 55, height: 30))
        let pBody = SKSpriteNode(texture: tankTex, size: CGSize(width: 52, height: 26))
        pNode.addChild(pBody)
        self.playerBodySprite = pBody

        let pTurret = SKNode()
        pTurret.position = CGPoint(x: 4, y: 6)
        let playerBarrel = SKShapeNode(rectOf: CGSize(width: 26, height: 5), cornerRadius: 2)
        playerBarrel.fillColor = SKColor(white: 0.2, alpha: 1.0)
        playerBarrel.strokeColor = .clear
        playerBarrel.position = CGPoint(x: 13, y: 0)
        pTurret.addChild(playerBarrel)
        pNode.addChild(pTurret)
        self.playerTurret = pTurret
        updatePlayerTurretAngle()

        let pHealthBar = SKShapeNode(rectOf: CGSize(width: 52, height: 6), cornerRadius: 2)
        pHealthBar.fillColor = .green
        pHealthBar.strokeColor = .black
        pHealthBar.position = CGPoint(x: 0, y: 28)
        pNode.addChild(pHealthBar)
        self.playerHealthBar = pHealthBar

        // AI Enemy Tank
        let aiX: CGFloat = size.width - 140
        let aiY = terrain.valueAt(x: aiX)
        let aNode = SKNode()
        aNode.position = CGPoint(x: aiX, y: aiY + 14)
        aNode.zRotation = terrain.slopeAt(x: aiX)
        aNode.zPosition = 5
        addChild(aNode)
        self.aiTankNode = aNode

        aiMaxHealth = 95.0 + Double(levelNumber) * 15.0
        aiHealth = aiMaxHealth

        let aiTex = TextureHelper.loadTexture(named: "hummera.png", fallbackColor: SKColor(red: 0.8, green: 0.25, blue: 0.2, alpha: 1.0), size: CGSize(width: 52, height: 26))
        let aiBody = SKSpriteNode(texture: aiTex, size: CGSize(width: 52, height: 26))
        aNode.addChild(aiBody)

        let aTurret = SKNode()
        aTurret.position = CGPoint(x: -4, y: 6)
        let aiBarrel = SKShapeNode(rectOf: CGSize(width: 26, height: 5), cornerRadius: 2)
        aiBarrel.fillColor = SKColor(white: 0.2, alpha: 1.0)
        aiBarrel.strokeColor = .clear
        aiBarrel.position = CGPoint(x: -13, y: 0)
        aTurret.addChild(aiBarrel)
        aNode.addChild(aTurret)
        self.aiTurret = aTurret

        let aHealthBar = SKShapeNode(rectOf: CGSize(width: 52, height: 6), cornerRadius: 2)
        aHealthBar.fillColor = .red
        aHealthBar.strokeColor = .black
        aHealthBar.position = CGPoint(x: 0, y: 28)
        aNode.addChild(aHealthBar)
        self.aiHealthBar = aHealthBar

        showSpeech(TrashTalkManager.shared.randomPreamble(), fromPlayer: false)
    }

    // MARK: - 4. Live Ballistic Aiming Arc (shotPath)
    private func setupTrajectoryArc() {
        let container = SKNode()
        container.zPosition = 8
        addChild(container)
        self.trajectoryContainer = container

        let largeTex = TextureHelper.loadTexture(named: "largecircle.png", fallbackColor: .white, size: CGSize(width: 10, height: 10))
        let smallTex = TextureHelper.loadTexture(named: "smallcircle.png", fallbackColor: .white, size: CGSize(width: 6, height: 6))

        for i in 0..<14 {
            let tex = (i % 2 == 0) ? largeTex : smallTex
            let sprite = SKSpriteNode(texture: tex)
            sprite.color = .yellow
            sprite.colorBlendFactor = 0.5
            trajectoryDots.append(sprite)
            container.addChild(sprite)
        }
        updateTrajectoryArc()
    }

    private func updateTrajectoryArc() {
        guard let pNode = playerTankNode, let container = trajectoryContainer else { return }
        guard isPlayerTurn, !isProjectileActive else {
            container.isHidden = true
            return
        }
        container.isHidden = false

        let rad = aimAngle * .pi / 180.0
        let speed = firePower * 10.5
        let vx = cos(rad) * speed
        let vy = sin(rad) * speed

        let startX = pNode.position.x + 22
        let startY = pNode.position.y + 12

        for (i, dot) in trajectoryDots.enumerated() {
            let t = CGFloat(i + 1) * 0.12
            let dx = vx * t + 0.5 * (windSpeed * 12.0) * t * t
            let dy = vy * t - 0.5 * 480.0 * t * t

            dot.position = CGPoint(x: startX + dx, y: startY + dy)
            let scale = max(0.35, 1.0 - (t / 2.2))
            dot.setScale(scale)
            dot.alpha = max(0.2, 1.0 - (CGFloat(i) / 15.0))
        }
    }

    // MARK: - 5. Top Avatars & Trash Talk HUD
    private func setupTopAvatarsHUD() {
        // Player General (Top-Left)
        let pNode = SKNode()
        pNode.position = CGPoint(x: 55, y: size.height - 45)
        pNode.zPosition = 25
        addChild(pNode)
        self.playerAvatarNode = pNode

        let pFrame = SKShapeNode(circleOfRadius: 26)
        pFrame.fillColor = SKColor(red: 0.15, green: 0.35, blue: 0.65, alpha: 0.9)
        pFrame.strokeColor = SKColor(red: 0.9, green: 0.85, blue: 0.3, alpha: 1.0)
        pFrame.lineWidth = 2.5
        pNode.addChild(pFrame)

        let pPortraitTex = TextureHelper.loadTexture(named: "gensilhouette.png", fallbackColor: .white, size: CGSize(width: 36, height: 36))
        let pPortrait = SKSpriteNode(texture: pPortraitTex, size: CGSize(width: 38, height: 38))
        pNode.addChild(pPortrait)

        let pName = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        pName.text = "GEN. PLAYER"
        pName.fontSize = 13
        pName.fontColor = .white
        pName.position = CGPoint(x: 35, y: 10)
        pName.horizontalAlignmentMode = .left
        pNode.addChild(pName)

        let pHP = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        pHP.text = "HP: \(Int(playerHealth))/\(Int(playerMaxHealth))"
        pHP.fontSize = 12
        pHP.fontColor = .green
        pHP.position = CGPoint(x: 35, y: -8)
        pHP.horizontalAlignmentMode = .left
        pNode.addChild(pHP)
        self.playerHpText = pHP

        // Enemy OPFOR General (Top-Right)
        let aNode = SKNode()
        aNode.position = CGPoint(x: size.width - 55, y: size.height - 45)
        aNode.zPosition = 25
        addChild(aNode)
        self.aiAvatarNode = aNode

        let aiFrame = SKShapeNode(circleOfRadius: 26)
        aiFrame.fillColor = SKColor(red: 0.65, green: 0.2, blue: 0.15, alpha: 0.9)
        aiFrame.strokeColor = SKColor(red: 0.95, green: 0.85, blue: 0.3, alpha: 1.0)
        aiFrame.lineWidth = 2.5
        aNode.addChild(aiFrame)

        let aiPortraitTex = TextureHelper.loadTexture(named: "gensilhouette.png", fallbackColor: .red, size: CGSize(width: 36, height: 36))
        let aiPortrait = SKSpriteNode(texture: aiPortraitTex, size: CGSize(width: 38, height: 38))
        aiPortrait.xScale = -1
        aNode.addChild(aiPortrait)

        let aiName = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        aiName.text = "OPFOR GEN"
        aiName.fontSize = 13
        aiName.fontColor = .white
        aiName.position = CGPoint(x: -35, y: 10)
        aiName.horizontalAlignmentMode = .right
        aNode.addChild(aiName)

        let aHP = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        aHP.text = "HP: \(Int(aiHealth))/\(Int(aiMaxHealth))"
        aHP.fontSize = 12
        aHP.fontColor = .red
        aHP.position = CGPoint(x: -35, y: -8)
        aHP.horizontalAlignmentMode = .right
        aNode.addChild(aHP)
        self.aiHpText = aHP
    }

    private func showSpeech(_ text: String, fromPlayer: Bool) {
        activeSpeechNode?.removeFromParent()

        let bubbleGroup = SKNode()
        let bubbleTex = TextureHelper.loadTexture(named: "speech_small.png", fallbackColor: SKColor(white: 0.1, alpha: 0.85), size: CGSize(width: 160, height: 50))
        let bubbleBg = SKSpriteNode(texture: bubbleTex, size: CGSize(width: 180, height: 52))
        bubbleBg.xScale = fromPlayer ? 1.0 : -1.0
        bubbleGroup.addChild(bubbleBg)

        let quote = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        quote.text = "\"\(text)\""
        quote.fontSize = 12
        quote.fontColor = .white
        quote.numberOfLines = 2
        quote.preferredMaxLayoutWidth = 160
        quote.verticalAlignmentMode = .center
        quote.position = CGPoint(x: 0, y: 2)
        bubbleGroup.addChild(quote)

        // Safe anchor lookup with reliable fallbacks
        let defaultPlayerAnchor = CGPoint(x: 55, y: size.height - 45)
        let defaultAiAnchor = CGPoint(x: size.width - 55, y: size.height - 45)
        let anchor = fromPlayer ? (playerAvatarNode?.position ?? defaultPlayerAnchor) : (aiAvatarNode?.position ?? defaultAiAnchor)
        let dx: CGFloat = fromPlayer ? 130 : -130
        bubbleGroup.position = CGPoint(x: anchor.x + dx, y: anchor.y - 12)

        bubbleGroup.zPosition = 35
        addChild(bubbleGroup)
        self.activeSpeechNode = bubbleGroup

        bubbleGroup.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.8),
            SKAction.fadeAlpha(to: 0.0, duration: 0.4),
            SKAction.removeFromParent()
        ]))
    }

    // MARK: - 6. Bottom Controls HUD
    private func setupBottomControlsHUD() {
        let barTex = TextureHelper.loadTexture(named: "controlbar_back.png", fallbackColor: SKColor(white: 0.12, alpha: 0.95), size: CGSize(width: size.width, height: 78))
        let controlBar = SKSpriteNode(texture: barTex, size: CGSize(width: size.width, height: 78))
        controlBar.position = CGPoint(x: size.width / 2, y: 39)
        controlBar.zPosition = 20
        addChild(controlBar)

        let gasIconTex = TextureHelper.loadTexture(named: "gas_icon.png", fallbackColor: .red, size: CGSize(width: 20, height: 20))
        let gasIcon = SKSpriteNode(texture: gasIconTex, size: CGSize(width: 20, height: 20))
        gasIcon.position = CGPoint(x: 25, y: 56)
        gasIcon.zPosition = 21
        addChild(gasIcon)

        let fuelBg = SKShapeNode(rectOf: CGSize(width: 50, height: 8), cornerRadius: 2)
        fuelBg.fillColor = SKColor(white: 0.2, alpha: 1.0)
        fuelBg.strokeColor = .clear
        fuelBg.position = CGPoint(x: 65, y: 56)
        fuelBg.zPosition = 21
        addChild(fuelBg)

        let fuelBar = SKShapeNode(rectOf: CGSize(width: 50, height: 8), cornerRadius: 2)
        fuelBar.fillColor = .orange
        fuelBar.strokeColor = .clear
        fuelBar.position = CGPoint(x: 65, y: 56)
        fuelBar.zPosition = 22
        addChild(fuelBar)
        self.fuelBarNode = fuelBar

        // Tank Drive Buttons
        createSmallButton(name: "drive_left", label: "◀◀", pos: CGPoint(x: 35, y: 25))
        createSmallButton(name: "drive_right", label: "▶▶", pos: CGPoint(x: 85, y: 25))

        // Angle Steppers
        createSmallButton(name: "angle_down", label: "▼", pos: CGPoint(x: 135, y: 39))
        createSmallButton(name: "angle_up", label: "▲", pos: CGPoint(x: 215, y: 39))
        let aLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        aLabel.fontSize = 15
        aLabel.fontColor = .white
        aLabel.position = CGPoint(x: 175, y: 32)
        aLabel.zPosition = 21
        addChild(aLabel)
        self.angleLabel = aLabel

        // Power Steppers
        createSmallButton(name: "power_down", label: "-", pos: CGPoint(x: 265, y: 39))
        createSmallButton(name: "power_up", label: "+", pos: CGPoint(x: 345, y: 39))
        let pLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        pLabel.fontSize = 15
        pLabel.fontColor = .white
        pLabel.position = CGPoint(x: 305, y: 32)
        pLabel.zPosition = 21
        addChild(pLabel)
        self.powerLabel = pLabel

        // Weapon Selection Button
        let weaponBtnTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: SKColor(red: 0.25, green: 0.45, blue: 0.75, alpha: 1.0), size: CGSize(width: 140, height: 42))
        let weaponBtn = SKSpriteNode(texture: weaponBtnTex, size: CGSize(width: 140, height: 42))
        weaponBtn.name = "weapon_cycle"
        weaponBtn.position = CGPoint(x: 450, y: 39)
        weaponBtn.zPosition = 21
        addChild(weaponBtn)

        let wIconTex = TextureHelper.loadTexture(named: currentWeapon.iconName, fallbackColor: .clear, size: CGSize(width: 24, height: 24))
        let wIcon = SKSpriteNode(texture: wIconTex, size: CGSize(width: 24, height: 24))
        wIcon.name = "weapon_cycle"
        wIcon.position = CGPoint(x: 395, y: 39)
        wIcon.zPosition = 22
        addChild(wIcon)
        self.weaponIconSprite = wIcon

        let wLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        wLabel.name = "weapon_cycle"
        wLabel.fontSize = 12
        wLabel.fontColor = .white
        wLabel.verticalAlignmentMode = .center
        wLabel.position = CGPoint(x: 460, y: 39)
        wLabel.zPosition = 22
        addChild(wLabel)
        self.weaponLabel = wLabel

        // Wind Indicator
        let windsockTex = TextureHelper.loadTexture(named: "windsock.png", fallbackColor: .orange, size: CGSize(width: 24, height: 18))
        let sock = SKSpriteNode(texture: windsockTex, size: CGSize(width: 24, height: 18))
        sock.position = CGPoint(x: 550, y: 39)
        sock.zPosition = 21
        addChild(sock)
        self.windsockNode = sock

        let wiLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        wiLabel.fontSize = 13
        wiLabel.fontColor = SKColor(red: 0.95, green: 0.95, blue: 0.3, alpha: 1.0)
        wiLabel.position = CGPoint(x: 605, y: 33)
        wiLabel.zPosition = 21
        addChild(wiLabel)
        self.windLabel = wiLabel

        // Authentic Big Red Fire Button
        let fireTex = TextureHelper.loadTexture(named: "fire_normal_btn.png", fallbackColor: SKColor(red: 0.92, green: 0.22, blue: 0.15, alpha: 1.0), size: CGSize(width: 58, height: 58))
        let fireBtn = SKSpriteNode(texture: fireTex, size: CGSize(width: 56, height: 56))
        fireBtn.name = "fire_btn"
        fireBtn.position = CGPoint(x: size.width - 55, y: 39)
        fireBtn.zPosition = 21
        addChild(fireBtn)
        self.fireBtnNode = fireBtn

        updateHUD()
    }

    private func createSmallButton(name: String, label: String, pos: CGPoint) {
        let btn = SKShapeNode(circleOfRadius: 18)
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
        text.fontSize = 14
        text.fontColor = .white
        text.verticalAlignmentMode = .center
        text.position = pos
        text.zPosition = 22
        addChild(text)
    }

    private func updateHUD() {
        angleLabel?.text = "\(Int(aimAngle))°"
        powerLabel?.text = "\(Int(firePower))%"
        weaponLabel?.text = currentWeapon.rawValue
        let dir = windSpeed >= 0 ? "▶" : "◀"
        windLabel?.text = "\(dir) \(String(format: "%.1f", abs(windSpeed)))"

        windsockNode?.xScale = windSpeed >= 0 ? 1.0 : -1.0
        fuelBarNode?.xScale = max(0, playerFuel / 100.0)

        weaponIconSprite?.texture = TextureHelper.loadTexture(named: currentWeapon.iconName, fallbackColor: .clear, size: CGSize(width: 24, height: 24))

        updateTrajectoryArc()
    }

    private func updatePlayerTurretAngle() {
        let rad = aimAngle * .pi / 180.0
        playerTurret?.zRotation = rad
        updateTrajectoryArc()
    }

    private func startTurn() {
        isProjectileActive = false
        windSpeed = CGFloat.random(in: -4.5...4.5)
        updateHUD()

        if isPlayerTurn {
            updateTrajectoryArc()
        } else {
            trajectoryContainer?.isHidden = true
            runAITurn()
        }
    }

    // MARK: - 7. Player Touches & Input Handling
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, isPlayerTurn, !isProjectileActive else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            switch node.name {
            case "drive_left":
                drivePlayerTank(dx: -14)
            case "drive_right":
                drivePlayerTank(dx: 14)
            case "angle_up":
                aimAngle = min(85, aimAngle + 3)
                updatePlayerTurretAngle()
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "angle_down":
                aimAngle = max(10, aimAngle - 3)
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
            case "weapon_cycle":
                cycleWeapon()
            case "fire_btn":
                animateFireButtonPress()
                firePlayerWeapon()
            default:
                break
            }
        }
    }

    private func animateFireButtonPress() {
        fireBtnNode?.texture = TextureHelper.loadTexture(named: "fire_down_btn.png", fallbackColor: .red, size: CGSize(width: 56, height: 56))
        fireBtnNode?.run(SKAction.sequence([
            SKAction.scale(to: 0.92, duration: 0.08),
            SKAction.scale(to: 1.0, duration: 0.08),
            SKAction.run { [weak self] in
                self?.fireBtnNode?.texture = TextureHelper.loadTexture(named: "fire_normal_btn.png", fallbackColor: .red, size: CGSize(width: 56, height: 56))
            }
        ]))
    }

    private func drivePlayerTank(dx: CGFloat) {
        guard let terrain = terrain, let pNode = playerTankNode else { return }
        guard playerFuel > 0 else {
            SoundManager.shared.playSound("carNoStart.mp3")
            return
        }
        let newX = max(30, min(size.width * 0.45, pNode.position.x + dx))
        let newY = terrain.valueAt(x: newX)
        let newRot = terrain.slopeAt(x: newX)

        playerFuel -= 5.0
        updateHUD()
        SoundManager.shared.playSound("treads.wav")

        playerDriveFrame = (playerDriveFrame % 4) + 1
        let driveTexName = "blue_tankdrive\(playerDriveFrame).png"
        playerBodySprite?.texture = TextureHelper.loadTexture(named: driveTexName, fallbackColor: .green, size: CGSize(width: 52, height: 26))

        pNode.run(SKAction.group([
            SKAction.move(to: CGPoint(x: newX, y: newY + 14), duration: 0.15),
            SKAction.rotate(toAngle: newRot, duration: 0.15)
        ])) { [weak self] in
            self?.updateTrajectoryArc()
        }
    }

    private func cycleWeapon() {
        SoundManager.shared.playSound("weapon_select.mp3")
        let all = WeaponType.allCases
        if let idx = all.firstIndex(of: currentWeapon) {
            currentWeapon = all[(idx + 1) % all.count]
            updateHUD()
        }
    }

    private func firePlayerWeapon() {
        guard let pNode = playerTankNode else { return }
        guard !isProjectileActive else { return }
        isProjectileActive = true
        trajectoryContainer?.isHidden = true

        if currentWeapon == .shield {
            activateShield(forPlayer: true)
            run(SKAction.wait(forDuration: 1.0)) { [weak self] in
                self?.isPlayerTurn = false
                self?.startTurn()
            }
            return
        }

        SoundManager.shared.playSound(currentWeapon.launchSound)
        let rad = aimAngle * .pi / 180.0
        let speed = firePower * 10.5
        let vx = cos(rad) * speed
        let vy = sin(rad) * speed

        let spawnPos = CGPoint(x: pNode.position.x + 22, y: pNode.position.y + 12)
        animateMuzzleFlash(at: spawnPos, zRotation: rad, isPlayer: true)
        spawnProjectile(weapon: currentWeapon, from: spawnPos, velocity: CGVector(dx: vx, dy: vy), isPlayer: true)
    }

    private func activateShield(forPlayer: Bool) {
        SoundManager.shared.playSound("shield.mp3")
        let targetNode = forPlayer ? playerTankNode : aiTankNode
        let shield = SKShapeNode(circleOfRadius: 32)
        shield.fillColor = SKColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 0.35)
        shield.strokeColor = SKColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 0.85)
        shield.lineWidth = 3.0
        shield.zPosition = 10
        targetNode?.addChild(shield)

        let pulse = SKAction.sequence([
            SKAction.scale(to: 1.08, duration: 0.5),
            SKAction.scale(to: 1.0, duration: 0.5)
        ])
        shield.run(SKAction.repeatForever(pulse))

        if forPlayer {
            playerShieldNode = shield
            hasPlayerShield = true
        } else {
            aiShieldNode = shield
            hasAiShield = true
        }
    }

    // MARK: - 8. AI Combat Simulation
    private func runAITurn() {
        showSpeech("Calculating firing solution...", fromPlayer: false)

        guard let pNode = playerTankNode, let aNode = aiTankNode else { return }
        let distance = aNode.position.x - pNode.position.x
        let estimatedAngle: CGFloat = CGFloat.random(in: 40...52)
        let rad = estimatedAngle * .pi / 180.0
        let targetSpeed = sqrt((distance * 480.0) / sin(2 * rad))
        let inaccuracy = CGFloat.random(in: -20...20) / CGFloat(levelNumber)
        let aiPower = max(20, min(100, (targetSpeed / 10.5) + inaccuracy))

        aiTurret?.zRotation = -rad

        run(SKAction.wait(forDuration: 1.4)) { [weak self] in
            guard let self = self, let aNode = self.aiTankNode else { return }
            let aiWeapon = WeaponType.missile
            SoundManager.shared.playSound(aiWeapon.launchSound)

            let vx = -cos(rad) * (aiPower * 10.5)
            let vy = sin(rad) * (aiPower * 10.5)
            let spawnPos = CGPoint(x: aNode.position.x - 22, y: aNode.position.y + 12)
            self.animateMuzzleFlash(at: spawnPos, zRotation: -rad + .pi, isPlayer: false)
            self.spawnProjectile(weapon: aiWeapon, from: spawnPos, velocity: CGVector(dx: vx, dy: vy), isPlayer: false)
        }
    }

    // MARK: - 9. Ballistic Projectile Physics & Effects
    private func spawnProjectile(weapon: WeaponType, from start: CGPoint, velocity: CGVector, isPlayer: Bool) {
        let missile = SKShapeNode(circleOfRadius: weapon == .nuke ? 7.0 : 4.5)
        missile.fillColor = isPlayer ? .yellow : .orange
        missile.strokeColor = .white
        missile.position = start
        missile.zPosition = 12
        addChild(missile)

        var currentPos = start
        var curVx = velocity.dx
        var curVy = velocity.dy
        let dt: CGFloat = 1.0 / 60.0
        let gravity: CGFloat = -480.0
        var mirvSplit = false
        var bouncesRemaining = weapon == .grenade ? 2 : 0

        let flyAction = SKAction.customAction(withDuration: 4.5) { [weak self] _, _ in
            guard let self = self, let terrain = self.terrain else { return }
            curVx += self.windSpeed * 12.0 * dt
            curVy += gravity * dt
            currentPos.x += curVx * dt
            currentPos.y += curVy * dt
            missile.position = currentPos

            // Smoke trail
            let smoke = SKShapeNode(circleOfRadius: weapon == .nuke ? 3.5 : 2.0)
            smoke.fillColor = SKColor(white: 0.85, alpha: 0.6)
            smoke.strokeColor = .clear
            smoke.position = currentPos
            smoke.zPosition = 11
            self.addChild(smoke)
            smoke.run(SKAction.sequence([
                SKAction.fadeAlpha(to: 0.0, duration: 0.35),
                SKAction.removeFromParent()
            ]))

            // MIRV split at apogee
            if weapon == .mirv && !mirvSplit && curVy < 50 && isPlayer {
                mirvSplit = true
                SoundManager.shared.playSound("mirv_spawn.mp3")
                self.spawnClusterSubmunitions(from: currentPos, baseVelocity: CGVector(dx: curVx, dy: curVy))
            }

            // Terrain Collision check
            let groundY = terrain.valueAt(x: currentPos.x)
            let targetNode = isPlayer ? self.aiTankNode : self.playerTankNode
            let hitTarget = targetNode != nil && targetNode!.position.distance(to: currentPos) < 28

            if hitTarget {
                missile.removeAllActions()
                missile.removeFromParent()
                self.handleImpact(weapon: weapon, at: currentPos, hitTank: true, isPlayerAttacker: isPlayer)
            } else if currentPos.y <= groundY || currentPos.x < 0 || currentPos.x > self.size.width {
                if bouncesRemaining > 0 {
                    bouncesRemaining -= 1
                    curVy = -curVy * 0.55
                    curVx = curVx * 0.75
                    currentPos.y = groundY + 2
                    SoundManager.shared.playSound("grenade_tick.mp3")
                } else {
                    missile.removeAllActions()
                    missile.removeFromParent()
                    self.handleImpact(weapon: weapon, at: currentPos, hitTank: false, isPlayerAttacker: isPlayer)
                }
            }
        }

        missile.run(flyAction)
    }

    private func spawnClusterSubmunitions(from pos: CGPoint, baseVelocity: CGVector) {
        for spread in [-120.0, 0.0, 120.0] {
            let sub = SKShapeNode(circleOfRadius: 3.5)
            sub.fillColor = .cyan
            sub.strokeColor = .white
            sub.position = pos
            sub.zPosition = 12
            addChild(sub)

            var cPos = pos
            var vx = baseVelocity.dx + CGFloat(spread)
            var vy = baseVelocity.dy - 30.0
            let dt: CGFloat = 1.0 / 60.0

            sub.run(SKAction.customAction(withDuration: 3.0) { [weak self] _, _ in
                guard let self = self, let terrain = self.terrain, let aNode = self.aiTankNode else { return }
                vy -= 480.0 * dt
                cPos.x += vx * dt
                cPos.y += vy * dt
                sub.position = cPos

                let gY = terrain.valueAt(x: cPos.x)
                if cPos.y <= gY || aNode.position.distance(to: cPos) < 26 {
                    sub.removeAllActions()
                    sub.removeFromParent()
                    self.handleImpact(weapon: .babyMissile, at: cPos, hitTank: aNode.position.distance(to: cPos) < 26, isPlayerAttacker: true)
                }
            })
        }
    }

    private func handleImpact(weapon: WeaponType, at pos: CGPoint, hitTank: Bool, isPlayerAttacker: Bool) {
        SoundManager.shared.playSound(weapon.impactSound)

        // Terrain cratering deformation
        let craterRadius = weapon.blastRadius
        terrain?.applyCrater(center: pos, radius: craterRadius)
        updateTerrainMesh()

        // Explosion effect
        let explosion = SKShapeNode(circleOfRadius: craterRadius > 0 ? craterRadius : 20)
        explosion.fillColor = weapon == .nuke ? SKColor(red: 1.0, green: 0.9, blue: 0.2, alpha: 0.95) : SKColor(red: 1.0, green: 0.4, blue: 0.1, alpha: 0.9)
        explosion.strokeColor = .white
        explosion.lineWidth = 3.0
        explosion.position = pos
        explosion.zPosition = 15
        addChild(explosion)

        explosion.run(SKAction.sequence([
            SKAction.scale(to: 1.6, duration: 0.18),
            SKAction.fadeAlpha(to: 0.0, duration: 0.25),
            SKAction.removeFromParent()
        ]))

        // Screen shake
        if weapon == .nuke || weapon == .mirv {
            let shake = SKAction.sequence([
                SKAction.moveBy(x: -6, y: 4, duration: 0.04),
                SKAction.moveBy(x: 6, y: -4, duration: 0.04),
                SKAction.moveBy(x: -3, y: 2, duration: 0.04),
                SKAction.moveBy(x: 3, y: -2, duration: 0.04)
            ])
            self.run(shake)
        }

        if hitTank {
            var rawDamage = weapon.damage + Double.random(in: -4...6)

            if isPlayerAttacker && hasAiShield {
                hasAiShield = false
                aiShieldNode?.removeFromParent()
                if let aNode = aiTankNode { showDamageText("BLOCKED!", at: aNode.position, color: .cyan) }
                SoundManager.shared.playSound("shield_collision.mp3")
                rawDamage = 0
            } else if !isPlayerAttacker && hasPlayerShield {
                hasPlayerShield = false
                playerShieldNode?.removeFromParent()
                if let pNode = playerTankNode { showDamageText("BLOCKED!", at: pNode.position, color: .cyan) }
                SoundManager.shared.playSound("shield_collision.mp3")
                rawDamage = 0
            }

            if rawDamage > 0 {
                if isPlayerAttacker {
                    aiHealth = max(0, aiHealth - rawDamage)
                    aiHealthBar?.xScale = CGFloat(aiHealth / aiMaxHealth)
                    aiHpText?.text = "HP: \(Int(aiHealth))/\(Int(aiMaxHealth))"
                    if let aNode = aiTankNode {
                        showDamageText("-\(Int(rawDamage))", at: aNode.position, color: .red)
                        let talk = TrashTalkManager.shared.randomHit(currentHealth: aiHealth, maxHealth: aiMaxHealth)
                        showSpeech(talk, fromPlayer: false)
                    }
                } else {
                    playerHealth = max(0, playerHealth - rawDamage)
                    playerHealthBar?.xScale = CGFloat(playerHealth / playerMaxHealth)
                    playerHpText?.text = "HP: \(Int(playerHealth))/\(Int(playerMaxHealth))"
                    if let pNode = playerTankNode {
                        showDamageText("-\(Int(rawDamage))", at: pNode.position, color: .red)
                    }
                    showSpeech("Critical damage sustained!", fromPlayer: true)
                }
            }
        } else {
            if isPlayerAttacker {
                showSpeech(TrashTalkManager.shared.randomMiss(), fromPlayer: false)
            }
        }

        // Adjust tanks to new elevations
        if let terrain = terrain {
            if let pNode = playerTankNode {
                let pY = terrain.valueAt(x: pNode.position.x)
                pNode.position.y = pY + 14
                pNode.zRotation = terrain.slopeAt(x: pNode.position.x)
            }
            if let aNode = aiTankNode {
                let aY = terrain.valueAt(x: aNode.position.x)
                aNode.position.y = aY + 14
                aNode.zRotation = terrain.slopeAt(x: aNode.position.x)
            }
        }

        // Check Victory / Defeat
        run(SKAction.wait(forDuration: 1.5)) { [weak self] in
            guard let self = self else { return }
            if self.aiHealth <= 0 {
                if let aNode = self.aiTankNode {
                    self.animateTankDestruction(tankNode: aNode) {
                        self.endBattle(victory: true)
                    }
                } else {
                    self.endBattle(victory: true)
                }
            } else if self.playerHealth <= 0 {
                if let pNode = self.playerTankNode {
                    self.animateTankDestruction(tankNode: pNode) {
                        self.endBattle(victory: false)
                    }
                } else {
                    self.endBattle(victory: false)
                }
            } else {
                self.isPlayerTurn.toggle()
                self.startTurn()
            }
        }
    }

    private func animateMuzzleFlash(at position: CGPoint, zRotation: CGFloat, isPlayer: Bool) {
        let prefix = isPlayer ? "blue_cannonfire" : "red_cannonfire"
        var frames: [SKTexture] = []
        for i in 0...7 {
            frames.append(TextureHelper.loadTexture(named: "\(prefix)\(i).png", size: CGSize(width: 24, height: 16)))
        }
        let flash = SKSpriteNode(texture: frames[0], size: CGSize(width: 26, height: 18))
        flash.position = position
        flash.zRotation = zRotation
        flash.zPosition = 14
        addChild(flash)

        let anim = SKAction.animate(with: frames, timePerFrame: 0.035)
        flash.run(SKAction.sequence([anim, SKAction.removeFromParent()]))
    }

    private func animateTankDestruction(tankNode: SKNode, onComplete: @escaping () -> Void) {
        SoundManager.shared.playSound("tank_explode1.mp3")
        var exploFrames: [SKTexture] = []
        for i in 1...11 {
            let name = String(format: "tankexplo%02d.png", i)
            exploFrames.append(TextureHelper.loadTexture(named: name, size: CGSize(width: 64, height: 64)))
        }
        let explo = SKSpriteNode(texture: exploFrames[0], size: CGSize(width: 72, height: 72))
        explo.position = tankNode.position
        explo.zPosition = 25
        addChild(explo)

        tankNode.run(SKAction.sequence([
            SKAction.wait(forDuration: 0.15),
            SKAction.fadeAlpha(to: 0.0, duration: 0.35)
        ]))

        let anim = SKAction.animate(with: exploFrames, timePerFrame: 0.055)
        explo.run(SKAction.sequence([
            anim,
            SKAction.removeFromParent(),
            SKAction.run(onComplete)
        ]))
    }

    private func showDamageText(_ text: String, at pos: CGPoint, color: SKColor = .red) {
        let label = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        label.text = text
        label.fontSize = 24
        label.fontColor = color
        label.position = CGPoint(x: pos.x, y: pos.y + 36)
        label.zPosition = 25
        addChild(label)

        label.run(SKAction.sequence([
            SKAction.group([
                SKAction.moveBy(x: 0, y: 32, duration: 0.8),
                SKAction.fadeAlpha(to: 0.0, duration: 0.8)
            ]),
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
