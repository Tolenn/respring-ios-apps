import SpriteKit

public class BattlefieldScene: SKScene {
    public var levelNumber: Int = 1

    // Terrain & Environment
    private var terrain: TerrainModel?
    private var terrainShapeNode: SKShapeNode?
    private var bedrockNode: SKSpriteNode?

    // Tanks
    private var playerTankNode: SKNode?
    private var aiTankNode: SKNode?
    private var playerTurret: SKSpriteNode?
    private var aiTurret: SKSpriteNode?

    // Dynamic Turn & Weapon State
    private var currentWeapon: WeaponType = .missile
    private var playerHealth: Double = 100
    private var aiHealth: Double = 100
    private var playerFuel: CGFloat = 100
    private var maxFuel: CGFloat = 100

    private var playerAngle: CGFloat = 45.0  // Degrees
    private var playerPower: CGFloat = 65.0  // 0 - 100
    private var windSpeed: CGFloat = 0.0     // Pixels/sec^2

    // HUD Elements
    private var playerHealthBar: SKShapeNode?
    private var aiHealthBar: SKShapeNode?
    private var fuelFillNode: SKSpriteNode?
    private var trajectoryContainer: SKNode?
    private var weaponIconNode: SKSpriteNode?
    private var ammoCountLabel: SKLabelNode?
    private var warbuxDisplayLabel: SKLabelNode?

    // Avatars & Speech
    private var playerAvatarNode: SKNode?
    private var aiAvatarNode: SKNode?
    private var activeSpeechNode: SKNode?

    // State Flags
    private var isPlayerTurn: Bool = true
    private var isProjectileActive: Bool = false
    private var isDrivingLeft: Bool = false
    private var isDrivingRight: Bool = false
    private var isAimDragging: Bool = false

    public override func didMove(to view: SKView) {
        // Bright sky blue as in authentic screenshot
        backgroundColor = SKColor(red: 0.35, green: 0.62, blue: 0.90, alpha: 1.0)

        let safeTerrain = TerrainModel(width: size.width, height: size.height)
        self.terrain = safeTerrain

        setupParallaxBackdrop()
        setupBedrockBase()
        setupTerrainNode()
        setupSteppedDecorations()
        setupTopAvatarsHUD()
        setupTanks()
        setupTrajectoryArc()
        setupBottomControlsHUD()

        startTurn()
    }

    // MARK: - 1. Parallax Desert Canyon Environment
    private func setupParallaxBackdrop() {
        // Far Desert Mesas Layer (arizona_back.png)
        let backTex = TextureHelper.loadTexture(named: "arizona_back.png", fallbackColor: .clear, size: CGSize(width: size.width, height: 180))
        let backMesa = SKSpriteNode(texture: backTex)
        backMesa.size = CGSize(width: size.width, height: 170)
        backMesa.position = CGPoint(x: size.width / 2, y: size.height * 0.58)
        backMesa.zPosition = -40
        addChild(backMesa)

        // Midground Canyon Bluffs Layer (arizona_middle.png)
        let midTex = TextureHelper.loadTexture(named: "arizona_middle.png", fallbackColor: .clear, size: CGSize(width: size.width, height: 150))
        let midMesa = SKSpriteNode(texture: midTex)
        midMesa.size = CGSize(width: size.width, height: 140)
        midMesa.position = CGPoint(x: size.width / 2, y: size.height * 0.52)
        midMesa.zPosition = -30
        addChild(midMesa)
    }

    // MARK: - 2. Bedrock Base Layer
    private func setupBedrockBase() {
        let bedrockTex = TextureHelper.loadTexture(named: "bedrock.png", fallbackColor: SKColor(white: 0.85, alpha: 1.0), size: CGSize(width: size.width, height: 50))
        let bedrock = SKSpriteNode(texture: bedrockTex)
        bedrock.size = CGSize(width: size.width, height: 48)
        bedrock.position = CGPoint(x: size.width / 2, y: 78)
        bedrock.zPosition = -12
        addChild(bedrock)
        self.bedrockNode = bedrock
    }

    // MARK: - 3. Stepped Dirt Terrain & Nuggets
    private func setupTerrainNode() {
        guard let terrain = terrain else { return }

        let shape = SKShapeNode(path: terrain.createPath())
        shape.strokeColor = SKColor(red: 0.32, green: 0.18, blue: 0.08, alpha: 1.0)
        shape.lineWidth = 2.0

        let dirtTex = TextureHelper.loadTexture(named: "square_1.png", fallbackColor: SKColor(red: 0.44, green: 0.24, blue: 0.12, alpha: 1.0), size: CGSize(width: 52, height: 52))
        shape.fillTexture = dirtTex
        shape.fillColor = .white
        shape.zPosition = -5
        addChild(shape)
        self.terrainShapeNode = shape

        // Embed Authentic Gold Nuggets Vein inside the dirt
        let goldTex = TextureHelper.loadTexture(named: "goldnuggets.png", fallbackColor: .yellow, size: CGSize(width: 50, height: 40))
        let goldNode = SKSpriteNode(texture: goldTex, size: CGSize(width: 50, height: 40))
        goldNode.position = CGPoint(x: size.width * 0.42, y: 150)
        goldNode.zPosition = -4
        addChild(goldNode)
    }

    private func setupSteppedDecorations() {
        guard let terrain = terrain else { return }

        // Saguaro Cacti on terrain steps
        let cactusPositions: [CGFloat] = [size.width * 0.18, size.width * 0.38, size.width * 0.53, size.width * 0.81]
        let cactusNames = ["cactus1.png", "cactus2.png", "cactus3.png"]

        for (i, x) in cactusPositions.enumerated() {
            let y = terrain.valueAt(x: x)
            let cName = cactusNames[i % cactusNames.count]
            let cTex = TextureHelper.loadTexture(named: cName, fallbackColor: .clear, size: CGSize(width: 24, height: 46))
            let cSprite = SKSpriteNode(texture: cTex, size: CGSize(width: 24, height: 46))
            cSprite.position = CGPoint(x: x, y: y + 21)
            cSprite.zPosition = -3
            addChild(cSprite)
        }

        // Grass tufts along plateau edges
        let grassPositions: [CGFloat] = [size.width * 0.12, size.width * 0.22, size.width * 0.40, size.width * 0.72, size.width * 0.88]
        for x in grassPositions {
            let y = terrain.valueAt(x: x)
            let gTex = TextureHelper.loadTexture(named: "grass1.png", fallbackColor: .clear, size: CGSize(width: 26, height: 18))
            let gSprite = SKSpriteNode(texture: gTex, size: CGSize(width: 26, height: 18))
            gSprite.position = CGPoint(x: x, y: y + 8)
            gSprite.zPosition = -3
            addChild(gSprite)
        }
    }

    private func updateTerrainMesh() {
        guard let terrain = terrain, let shape = terrainShapeNode else { return }
        shape.path = terrain.createPath()
    }

    // MARK: - 4. Top Avatars HUD (Matching Screenshot Frames)
    private func setupTopAvatarsHUD() {
        let frameSize = CGSize(width: 88, height: 88)
        let frameTex = TextureHelper.loadTexture(named: "frame.png", fallbackColor: SKColor(red: 0.92, green: 0.88, blue: 0.80, alpha: 1.0), size: frameSize)

        // --- PLAYER AVATAR (Top-Left) ---
        let pAvatarGroup = SKNode()
        pAvatarGroup.position = CGPoint(x: 52, y: size.height - 52)
        pAvatarGroup.zPosition = 30
        addChild(pAvatarGroup)
        self.playerAvatarNode = pAvatarGroup

        // Framed border
        let pFrame = SKSpriteNode(texture: frameTex, size: frameSize)
        pAvatarGroup.addChild(pFrame)

        // General portrait pieces (British General: Blue beret, monocle, mustache)
        let pBody = SKSpriteNode(texture: TextureHelper.loadTexture(named: "body1.png", fallbackColor: .clear, size: CGSize(width: 60, height: 50)))
        pBody.position = CGPoint(x: 0, y: -16)
        pAvatarGroup.addChild(pBody)

        let pHead = SKSpriteNode(texture: TextureHelper.loadTexture(named: "head1.png", fallbackColor: .clear, size: CGSize(width: 48, height: 48)))
        pHead.position = CGPoint(x: 0, y: 2)
        pAvatarGroup.addChild(pHead)

        let pHat = SKSpriteNode(texture: TextureHelper.loadTexture(named: "hat1.png", fallbackColor: .clear, size: CGSize(width: 52, height: 26)))
        pHat.position = CGPoint(x: 0, y: 22)
        pAvatarGroup.addChild(pHat)

        let pMustache = SKSpriteNode(texture: TextureHelper.loadTexture(named: "mustache1.png", fallbackColor: .clear, size: CGSize(width: 38, height: 16)))
        pMustache.position = CGPoint(x: 0, y: -4)
        pAvatarGroup.addChild(pMustache)

        let pMonocle = SKSpriteNode(texture: TextureHelper.loadTexture(named: "spectacle.png", fallbackColor: .clear, size: CGSize(width: 20, height: 20)))
        pMonocle.position = CGPoint(x: 10, y: 4)
        pAvatarGroup.addChild(pMonocle)

        // Health Bar below Player Frame
        let pHpBg = SKShapeNode(rectOf: CGSize(width: 84, height: 8), cornerRadius: 2)
        pHpBg.fillColor = SKColor(red: 0.8, green: 0.1, blue: 0.1, alpha: 1.0)
        pHpBg.strokeColor = .black
        pHpBg.lineWidth = 1.0
        pHpBg.position = CGPoint(x: 0, y: -48)
        pAvatarGroup.addChild(pHpBg)

        let pHp = SKShapeNode(rectOf: CGSize(width: 84, height: 8), cornerRadius: 2)
        pHp.fillColor = SKColor(red: 0.2, green: 0.85, blue: 0.25, alpha: 1.0)
        pHp.strokeColor = .clear
        pHp.position = CGPoint(x: 0, y: -48)
        pAvatarGroup.addChild(pHp)
        self.playerHealthBar = pHp

        // --- ENEMY AVATAR (Top-Right) ---
        let aiAvatarGroup = SKNode()
        aiAvatarGroup.position = CGPoint(x: size.width - 52, y: size.height - 52)
        aiAvatarGroup.zPosition = 30
        addChild(aiAvatarGroup)
        self.aiAvatarNode = aiAvatarGroup

        let aiFrame = SKSpriteNode(texture: frameTex, size: frameSize)
        aiAvatarGroup.addChild(aiFrame)

        let aiBody = SKSpriteNode(texture: TextureHelper.loadTexture(named: "body1_dark.png", fallbackColor: .clear, size: CGSize(width: 60, height: 50)))
        aiBody.position = CGPoint(x: 0, y: -16)
        aiAvatarGroup.addChild(aiBody)

        let aiHead = SKSpriteNode(texture: TextureHelper.loadTexture(named: "head1_dark.png", fallbackColor: .clear, size: CGSize(width: 48, height: 48)))
        aiHead.position = CGPoint(x: 0, y: 2)
        aiAvatarGroup.addChild(aiHead)

        let aiHat = SKSpriteNode(texture: TextureHelper.loadTexture(named: "hat2.png", fallbackColor: .clear, size: CGSize(width: 54, height: 26)))
        aiHat.position = CGPoint(x: 0, y: 22)
        aiAvatarGroup.addChild(aiHat)

        let aiShades = SKSpriteNode(texture: TextureHelper.loadTexture(named: "sunglasses.png", fallbackColor: .clear, size: CGSize(width: 32, height: 16)))
        aiShades.position = CGPoint(x: -2, y: 6)
        aiAvatarGroup.addChild(aiShades)

        let aiCigar = SKSpriteNode(texture: TextureHelper.loadTexture(named: "cigar1.png", fallbackColor: .clear, size: CGSize(width: 26, height: 14)))
        aiCigar.position = CGPoint(x: 12, y: -8)
        aiAvatarGroup.addChild(aiCigar)

        // Health Bar below AI Frame
        let aiHpBg = SKShapeNode(rectOf: CGSize(width: 84, height: 8), cornerRadius: 2)
        aiHpBg.fillColor = SKColor(red: 0.8, green: 0.1, blue: 0.1, alpha: 1.0)
        aiHpBg.strokeColor = .black
        aiHpBg.lineWidth = 1.0
        aiHpBg.position = CGPoint(x: 0, y: -48)
        aiAvatarGroup.addChild(aiHpBg)

        let aiHp = SKShapeNode(rectOf: CGSize(width: 84, height: 8), cornerRadius: 2)
        aiHp.fillColor = SKColor(red: 0.2, green: 0.85, blue: 0.25, alpha: 1.0)
        aiHp.strokeColor = .clear
        aiHp.position = CGPoint(x: 0, y: -48)
        aiAvatarGroup.addChild(aiHp)
        self.aiHealthBar = aiHp
    }

    // MARK: - 5. Tanks Setup
    private func setupTanks() {
        guard let terrain = terrain else { return }

        // Player Tank
        let pTank = SKNode()
        let pStartX: CGFloat = 145
        let pStartY = terrain.valueAt(x: pStartX)
        pTank.position = CGPoint(x: pStartX, y: pStartY + 14)
        pTank.zPosition = 10
        addChild(pTank)
        self.playerTankNode = pTank

        let pBodyTex = TextureHelper.loadTexture(named: "blue_tankdrive1.png", fallbackColor: .green, size: CGSize(width: 44, height: 26))
        let pBodySprite = SKSpriteNode(texture: pBodyTex, size: CGSize(width: 44, height: 26))
        pTank.addChild(pBodySprite)

        let pTurretTex = TextureHelper.loadTexture(named: "blue_cannonfire0.png", fallbackColor: .darkGray, size: CGSize(width: 28, height: 10))
        let pTurret = SKSpriteNode(texture: pTurretTex, size: CGSize(width: 28, height: 10))
        pTurret.anchorPoint = CGPoint(x: 0.1, y: 0.5)
        pTurret.position = CGPoint(x: 0, y: 6)
        pTurret.zRotation = playerAngle * .pi / 180.0
        pTank.addChild(pTurret)
        self.playerTurret = pTurret

        // AI Enemy Tank
        let aiTank = SKNode()
        let aiStartX: CGFloat = size.width * 0.58
        let aiStartY = terrain.valueAt(x: aiStartX)
        aiTank.position = CGPoint(x: aiStartX, y: aiStartY + 14)
        aiTank.zPosition = 10
        addChild(aiTank)
        self.aiTankNode = aiTank

        let aiBodyTex = TextureHelper.loadTexture(named: "gold_tankdrive1.png", fallbackColor: .orange, size: CGSize(width: 44, height: 26))
        let aiBodySprite = SKSpriteNode(texture: aiBodyTex, size: CGSize(width: 44, height: 26))
        aiBodySprite.xScale = -1.0
        aiTank.addChild(aiBodySprite)

        let aiTurretTex = TextureHelper.loadTexture(named: "gold_tank_cannonfire0.png", fallbackColor: .darkGray, size: CGSize(width: 28, height: 10))
        let aiTurret = SKSpriteNode(texture: aiTurretTex, size: CGSize(width: 28, height: 10))
        aiTurret.anchorPoint = CGPoint(x: 0.1, y: 0.5)
        aiTurret.position = CGPoint(x: 0, y: 6)
        aiTurret.zRotation = 135.0 * .pi / 180.0
        aiTank.addChild(aiTurret)
        self.aiTurret = aiTurret

        showSpeech(TrashTalkManager.shared.randomTaunt(), fromPlayer: false)
    }

    // MARK: - 6. Trajectory Arc (Glowing Dots: smallcircle.png)
    private func setupTrajectoryArc() {
        let container = SKNode()
        container.zPosition = 15
        addChild(container)
        self.trajectoryContainer = container
        updateTrajectoryArc()
    }

    private func updateTrajectoryArc() {
        guard let container = trajectoryContainer, let pTank = playerTankNode else { return }
        container.removeAllChildren()

        guard isPlayerTurn, !isProjectileActive else { return }

        let turretPos = CGPoint(x: pTank.position.x + 12, y: pTank.position.y + 6)
        let rad = playerAngle * .pi / 180.0
        let speed = playerPower * 8.5
        var vx = speed * cos(rad)
        var vy = speed * sin(rad)
        let gravity: CGFloat = -420.0
        let dt: CGFloat = 0.055

        var current = turretPos
        let circleTex = TextureHelper.loadTexture(named: "smallcircle.png", fallbackColor: .white, size: CGSize(width: 10, height: 10))

        for i in 0..<18 {
            let dot = SKSpriteNode(texture: circleTex, size: CGSize(width: 9, height: 9))
            dot.position = current
            dot.alpha = CGFloat(18 - i) / 18.0 * 0.95
            container.addChild(dot)

            vx += windSpeed * dt
            vy += gravity * dt
            current.x += vx * dt
            current.y += vy * dt

            if let terrain = terrain, current.y <= terrain.valueAt(x: current.x) {
                break
            }
        }
    }

    // MARK: - 7. Bottom Controls HUD (Authentic Little Generals HUD)
    private func setupBottomControlsHUD() {
        let barHeight: CGFloat = 78

        // Control bar background
        let barTex = TextureHelper.loadTexture(named: "controlbar_back.png", fallbackColor: SKColor(red: 0.88, green: 0.65, blue: 0.35, alpha: 1.0), size: CGSize(width: size.width, height: barHeight))
        let controlBar = SKSpriteNode(texture: barTex, size: CGSize(width: size.width, height: barHeight))
        controlBar.position = CGPoint(x: size.width / 2, y: barHeight / 2)
        controlBar.zPosition = 20
        addChild(controlBar)

        // 1. Left: Circular Green Joystick Drive Button (joystick_top.png)
        let joyTex = TextureHelper.loadTexture(named: "joystick_top.png", fallbackColor: .green, size: CGSize(width: 72, height: 60))
        let joyNode = SKSpriteNode(texture: joyTex, size: CGSize(width: 72, height: 60))
        joyNode.name = "joystick_drive"
        joyNode.position = CGPoint(x: 52, y: barHeight / 2)
        joyNode.zPosition = 22
        addChild(joyNode)

        // 2. Red Gas Can (gastank_back.png + gastank_fill.png)
        let gasBackTex = TextureHelper.loadTexture(named: "gastank_back.png", fallbackColor: .red, size: CGSize(width: 32, height: 42))
        let gasBack = SKSpriteNode(texture: gasBackTex, size: CGSize(width: 32, height: 42))
        gasBack.position = CGPoint(x: 115, y: barHeight / 2)
        gasBack.zPosition = 21
        addChild(gasBack)

        let gasFillTex = TextureHelper.loadTexture(named: "gastank_fill.png", fallbackColor: .orange, size: CGSize(width: 30, height: 38))
        let gasFill = SKSpriteNode(texture: gasFillTex, size: CGSize(width: 30, height: 38))
        gasFill.position = gasBack.position
        gasFill.zPosition = 22
        addChild(gasFill)
        self.fuelFillNode = gasFill

        // 3. Battery Icon (battery_available.png)
        let battTex = TextureHelper.loadTexture(named: "battery_available.png", fallbackColor: .clear, size: CGSize(width: 24, height: 42))
        let batt = SKSpriteNode(texture: battTex, size: CGSize(width: 24, height: 42))
        batt.position = CGPoint(x: 152, y: barHeight / 2)
        batt.zPosition = 21
        addChild(batt)

        // 4. Parachute Icon (parachute_available.png)
        let chuteTex = TextureHelper.loadTexture(named: "parachute_available.png", fallbackColor: .clear, size: CGSize(width: 38, height: 40))
        let chute = SKSpriteNode(texture: chuteTex, size: CGSize(width: 38, height: 40))
        chute.position = CGPoint(x: 190, y: barHeight / 2)
        chute.zPosition = 21
        addChild(chute)

        // 5. Briefcase of Cash + Warbucks Box ($ 10)
        let warbuxBtnTex = TextureHelper.loadTexture(named: "warbucks_normal_btn.png", fallbackColor: .clear, size: CGSize(width: 48, height: 38))
        let warbuxBtn = SKSpriteNode(texture: warbuxBtnTex, size: CGSize(width: 48, height: 38))
        warbuxBtn.position = CGPoint(x: 245, y: barHeight / 2)
        warbuxBtn.zPosition = 21
        addChild(warbuxBtn)

        let warbuxBarTex = TextureHelper.loadTexture(named: "warbucks_bar.png", fallbackColor: .white, size: CGSize(width: 78, height: 34))
        let warbuxBar = SKSpriteNode(texture: warbuxBarTex, size: CGSize(width: 78, height: 34))
        warbuxBar.position = CGPoint(x: 312, y: barHeight / 2)
        warbuxBar.zPosition = 21
        addChild(warbuxBar)

        let dollarSign = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        dollarSign.text = "$"
        dollarSign.fontSize = 20
        dollarSign.fontColor = .black
        dollarSign.verticalAlignmentMode = .center
        dollarSign.position = CGPoint(x: 284, y: barHeight / 2)
        dollarSign.zPosition = 22
        addChild(dollarSign)

        let warbuxVal = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxVal.text = "\(GameState.shared.warbux)"
        warbuxVal.fontSize = 16
        warbuxVal.fontColor = .black
        warbuxVal.verticalAlignmentMode = .center
        warbuxVal.position = CGPoint(x: 326, y: barHeight / 2)
        warbuxVal.zPosition = 22
        addChild(warbuxVal)
        self.warbuxDisplayLabel = warbuxVal

        // 6. Surrender Flag Button (flag_normal_btn.png)
        let flagTex = TextureHelper.loadTexture(named: "flag_normal_btn.png", fallbackColor: .clear, size: CGSize(width: 44, height: 46))
        let flagBtn = SKSpriteNode(texture: flagTex, size: CGSize(width: 44, height: 46))
        flagBtn.name = "surrender_btn"
        flagBtn.position = CGPoint(x: 380, y: barHeight / 2)
        flagBtn.zPosition = 21
        addChild(flagBtn)

        // 7. Weapon Selector Button with Gear (weapon_normal_btn.png) + Ammo Count Box
        let wBtnTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: .clear, size: CGSize(width: 90, height: 46))
        let wBtn = SKSpriteNode(texture: wBtnTex, size: CGSize(width: 90, height: 46))
        wBtn.name = "weapon_select_btn"
        wBtn.position = CGPoint(x: 456, y: barHeight / 2)
        wBtn.zPosition = 21
        addChild(wBtn)

        let wIconTex = TextureHelper.loadTexture(named: currentWeapon.iconName, fallbackColor: .clear, size: CGSize(width: 24, height: 24))
        let wIcon = SKSpriteNode(texture: wIconTex, size: CGSize(width: 24, height: 24))
        wIcon.name = "weapon_select_btn"
        wIcon.position = CGPoint(x: 436, y: barHeight / 2)
        wIcon.zPosition = 22
        addChild(wIcon)
        self.weaponIconNode = wIcon

        let ammoCount = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        ammoCount.name = "weapon_select_btn"
        ammoCount.text = "1"
        ammoCount.fontSize = 17
        ammoCount.fontColor = .black
        ammoCount.verticalAlignmentMode = .center
        ammoCount.position = CGPoint(x: 480, y: barHeight / 2)
        ammoCount.zPosition = 22
        addChild(ammoCount)
        self.ammoCountLabel = ammoCount

        // 8. Right: Big Red Circular FIRE Button (fire_normal_btn.png)
        let fireTex = TextureHelper.loadTexture(named: "fire_normal_btn.png", fallbackColor: .red, size: CGSize(width: 76, height: 76))
        let fireBtn = SKSpriteNode(texture: fireTex, size: CGSize(width: 76, height: 76))
        fireBtn.name = "fire_btn"
        fireBtn.position = CGPoint(x: size.width - 54, y: barHeight / 2)
        fireBtn.zPosition = 22
        addChild(fireBtn)
    }

    // MARK: - 8. Touch Input: Real-Time Sliding Finger Aiming & Driving
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let hitNodes = nodes(at: location)

        for node in hitNodes {
            if node.name == "fire_btn" {
                if isPlayerTurn && !isProjectileActive {
                    fireWeapon(fromPlayer: true)
                }
                return
            }

            if node.name == "weapon_select_btn" {
                cycleWeapon()
                return
            }

            if node.name == "surrender_btn" {
                endBattle(playerWon: false)
                return
            }

            if node.name == "joystick_drive" {
                // If touching left half of joystick -> drive left; right half -> drive right
                let localX = location.x - 52
                if localX < 0 {
                    isDrivingLeft = true
                } else {
                    isDrivingRight = true
                }
                driveTank(step: localX < 0 ? -12 : 12)
                return
            }
        }

        // Outside bottom HUD: Finger sliding controls elevation angle and power!
        if location.y > 80 && isPlayerTurn && !isProjectileActive {
            isAimDragging = true
            updateAimFromTouch(location)
        }
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)

        if isAimDragging && isPlayerTurn && !isProjectileActive {
            updateAimFromTouch(location)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isAimDragging = false
        isDrivingLeft = false
        isDrivingRight = false
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isAimDragging = false
        isDrivingLeft = false
        isDrivingRight = false
    }

    private func updateAimFromTouch(_ touchPos: CGPoint) {
        guard let pTank = playerTankNode else { return }
        let turretPos = CGPoint(x: pTank.position.x, y: pTank.position.y + 6)

        let dx = touchPos.x - turretPos.x
        let dy = touchPos.y - turretPos.y

        // Calculate angle in degrees
        var deg = atan2(dy, dx) * 180.0 / .pi
        if deg < 5 { deg = 5 }
        if deg > 88 { deg = 88 }
        self.playerAngle = deg
        playerTurret?.zRotation = deg * .pi / 180.0

        // Calculate power from pull/distance
        let dist = sqrt(dx * dx + dy * dy)
        let calcPower = max(20, min(100, dist / 3.8))
        self.playerPower = calcPower

        updateTrajectoryArc()
    }

    // MARK: - 9. Tank Driving & Fuel
    private func driveTank(step: CGFloat) {
        guard let pTank = playerTankNode, let terrain = terrain, playerFuel > 0 else { return }

        let newX = max(40, min(size.width * 0.45, pTank.position.x + step))
        let newY = terrain.valueAt(x: newX)
        pTank.position = CGPoint(x: newX, y: newY + 14)

        let slope = terrain.slopeAt(x: newX)
        pTank.zRotation = slope

        playerFuel = max(0, playerFuel - 4.5)
        fuelFillNode?.xScale = playerFuel / maxFuel

        SoundManager.shared.playSound("treads.wav")
        updateTrajectoryArc()
    }

    private func cycleWeapon() {
        let all = WeaponType.allCases
        if let idx = all.firstIndex(of: currentWeapon) {
            let next = all[(idx + 1) % all.count]
            currentWeapon = next
            weaponIconNode?.texture = TextureHelper.loadTexture(named: next.iconName, fallbackColor: .clear, size: CGSize(width: 24, height: 24))
            SoundManager.shared.playSound("weapon_select.mp3")
            updateTrajectoryArc()
        }
    }

    // MARK: - 10. Turn Logic & Firing
    private func startTurn() {
        isProjectileActive = false
        windSpeed = CGFloat.random(in: -35...35)
        updateTrajectoryArc()

        if !isPlayerTurn {
            run(SKAction.sequence([
                SKAction.wait(forDuration: 1.4),
                SKAction.run { [weak self] in
                    self?.executeAITurn()
                }
            ]))
        }
    }

    private func fireWeapon(fromPlayer: Bool) {
        guard !isProjectileActive else { return }
        isProjectileActive = true
        trajectoryContainer?.removeAllChildren()

        let weapon = currentWeapon
        let originNode = fromPlayer ? playerTankNode : aiTankNode
        let turret = fromPlayer ? playerTurret : aiTurret

        guard let origin = originNode, let turr = turret else { return }

        SoundManager.shared.playSound(weapon.launchSound)

        // Cannon muzzle flash animation
        let flashFrames = (0...7).compactMap { i -> SKTexture? in
            let name = fromPlayer ? "blue_cannonfire\(i).png" : "gold_tank_cannonfire\(i).png"
            return TextureHelper.loadTexture(named: name, fallbackColor: .white, size: CGSize(width: 32, height: 12))
        }
        if !flashFrames.isEmpty {
            turr.run(SKAction.animate(with: flashFrames, timePerFrame: 0.04))
        }

        // Projectile setup
        let rad = turr.zRotation
        let speed = (fromPlayer ? playerPower : CGFloat.random(in: 55...75)) * 8.5
        var vx = speed * cos(rad) * (fromPlayer ? 1.0 : -1.0)
        var vy = speed * sin(rad)
        let gravity: CGFloat = -420.0

        let startPos = CGPoint(x: origin.position.x + cos(rad) * 22, y: origin.position.y + sin(rad) * 22)

        let missileTex = TextureHelper.loadTexture(named: weapon.iconName, fallbackColor: .yellow, size: CGSize(width: 14, height: 14))
        let projectile = SKSpriteNode(texture: missileTex, size: CGSize(width: 14, height: 14))
        projectile.position = startPos
        projectile.zPosition = 25
        addChild(projectile)

        let dt: CGFloat = 1.0 / 60.0
        let flight = SKAction.repeatForever(SKAction.run { [weak self, weak projectile] in
            guard let self = self, let proj = projectile else { return }

            vx += self.windSpeed * dt
            vy += gravity * dt
            proj.position.x += vx * dt
            proj.position.y += vy * dt
            proj.zRotation = atan2(vy, vx)

            // Hit checks
            let targetNode = fromPlayer ? self.aiTankNode : self.playerTankNode
            if let target = targetNode, proj.position.distance(to: target.position) < 26 {
                proj.removeFromParent()
                self.handleImpact(pos: proj.position, weapon: weapon, hitTarget: true, targetIsPlayer: !fromPlayer)
                return
            }

            if let terrain = self.terrain, proj.position.y <= terrain.valueAt(x: proj.position.x) {
                proj.removeFromParent()
                self.handleImpact(pos: proj.position, weapon: weapon, hitTarget: false, targetIsPlayer: !fromPlayer)
                return
            }

            if proj.position.y < -50 || proj.position.x < -100 || proj.position.x > self.size.width + 100 {
                proj.removeFromParent()
                self.endTurn()
            }
        })
        projectile.run(flight)
    }

    private func handleImpact(pos: CGPoint, weapon: WeaponType, hitTarget: Bool, targetIsPlayer: Bool) {
        SoundManager.shared.playSound(weapon.impactSound)

        // Cratering deformation
        terrain?.applyCrater(center: pos, radius: weapon.blastRadius)
        updateTerrainMesh()

        // Explosion visual
        let explo = SKShapeNode(circleOfRadius: max(16, weapon.blastRadius))
        explo.fillColor = SKColor(red: 1.0, green: 0.5, blue: 0.1, alpha: 0.9)
        explo.strokeColor = .yellow
        explo.position = pos
        explo.zPosition = 26
        addChild(explo)

        explo.run(SKAction.sequence([
            SKAction.scale(to: 1.4, duration: 0.15),
            SKAction.fadeOut(withDuration: 0.25),
            SKAction.removeFromParent()
        ]))

        // Apply Damage
        if hitTarget {
            let dmg = weapon.damage
            if targetIsPlayer {
                playerHealth = max(0, playerHealth - dmg)
                playerHealthBar?.xScale = CGFloat(playerHealth / 100.0)
                showSpeech(TrashTalkManager.shared.randomTaunt(), fromPlayer: false)
                if playerHealth <= 0 {
                    destroyTank(isPlayer: true)
                    return
                }
            } else {
                aiHealth = max(0, aiHealth - dmg)
                aiHealthBar?.xScale = CGFloat(aiHealth / 100.0)
                showSpeech(TrashTalkManager.shared.randomCheer(), fromPlayer: true)
                if aiHealth <= 0 {
                    destroyTank(isPlayer: false)
                    return
                }
            }
        }

        endTurn()
    }

    private func executeAITurn() {
        guard !isProjectileActive else { return }
        fireWeapon(fromPlayer: false)
    }

    private func endTurn() {
        isPlayerTurn.toggle()
        startTurn()
    }

    private func destroyTank(isPlayer: Bool) {
        let node = isPlayer ? playerTankNode : aiTankNode
        node?.removeFromParent()
        SoundManager.shared.playSound("tank_explode1.mp3")

        run(SKAction.sequence([
            SKAction.wait(forDuration: 1.2),
            SKAction.run { [weak self] in
                self?.endBattle(playerWon: !isPlayer)
            }
        ]))
    }

    private func endBattle(playerWon: Bool) {
        GameState.shared.lastBattleWon = playerWon
        if playerWon {
            GameState.shared.warbux += 150
            if GameState.shared.currentLevel == 1 {
                GameState.shared.currentLevel = 2
            }
        }

        let over = BattleOverScene(size: size)
        over.scaleMode = scaleMode
        view?.presentScene(over, transition: SKTransition.fade(withDuration: 0.5))
    }

    // MARK: - 11. Speech Bubbles
    private func showSpeech(_ text: String, fromPlayer: Bool) {
        activeSpeechNode?.removeFromParent()

        let bubbleGroup = SKNode()
        let bubbleTex = TextureHelper.loadTexture(named: "speech_small.png", fallbackColor: SKColor(white: 0.15, alpha: 0.85), size: CGSize(width: 150, height: 46))
        let bubbleBg = SKSpriteNode(texture: bubbleTex, size: CGSize(width: 160, height: 48))
        bubbleBg.xScale = fromPlayer ? 1.0 : -1.0
        bubbleGroup.addChild(bubbleBg)

        let quote = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        quote.text = "\"\(text)\""
        quote.fontSize = 11
        quote.fontColor = .white
        quote.preferredMaxLayoutWidth = 140
        quote.numberOfLines = 2
        quote.verticalAlignmentMode = .center
        bubbleGroup.addChild(quote)

        let anchor = fromPlayer ? (playerAvatarNode?.position ?? CGPoint(x: 52, y: size.height - 52)) : (aiAvatarNode?.position ?? CGPoint(x: size.width - 52, y: size.height - 52))
        bubbleGroup.position = CGPoint(x: anchor.x + (fromPlayer ? 115 : -115), y: anchor.y - 12)
        bubbleGroup.zPosition = 35
        addChild(bubbleGroup)
        self.activeSpeechNode = bubbleGroup

        bubbleGroup.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.5),
            SKAction.fadeOut(withDuration: 0.3),
            SKAction.removeFromParent()
        ]))
    }
}

private extension CGPoint {
    func distance(to other: CGPoint) -> CGFloat {
        let dx = x - other.x
        let dy = y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}
