import SpriteKit

public class BattlefieldScene: SKScene {
    public var levelNumber: Int = 1

    // Terrain & Environment
    private var terrain: TerrainModel?
    private var terrainShapeNode: SKShapeNode?
    private var terrainCapNode: SKShapeNode?
    private var bedrockNode: SKNode?
    private var controlBarGroup: SKNode?
    private var joystickNode: SKSpriteNode?
    private var fireButtonNode: SKSpriteNode?

    // Tanks
    private var playerTankNode: SKNode?
    private var aiTankNode: SKNode?
    private var playerTurret: SKSpriteNode?
    private var aiTurret: SKSpriteNode?

    // Dynamic Turn & Weapon State
    private var currentWeapon: WeaponType = .babyMissile
    private var playerHealth: Double = 100
    private var playerMaxHealth: Double = 100
    private var aiHealth: Double = 100
    private var aiMaxHealth: Double = 100
    private var playerShieldHP: Double = 0
    private var playerFuel: CGFloat = 100
    private var maxFuel: CGFloat = 100
    private var battlePot: Int = 10 // INITIAL_POT_AMOUNT = 10 (weapons.balance_sheet.lua:3)
    private var aiTurnCount: Int = 0

    private var playerAngle: CGFloat = 45.0  // Degrees
    private var playerPower: CGFloat = 65.0  // 20 - 100
    private var windSpeed: CGFloat = 0.0     // ALLOW_WIND.SINGLEPLAYER = false (main.lua:104)

    // HUD & Scene Elements
    private var playerHealthBar: SKShapeNode?
    private var aiHealthBar: SKShapeNode?
    private var playerShieldNode: SKSpriteNode?
    private var fuelFillNode: SKSpriteNode?
    private var trajectoryContainer: SKNode?
    private var weaponIconNode: SKSpriteNode?
    private var ammoCountLabel: SKLabelNode?
    private var warbuxDisplayLabel: SKLabelNode?
    private var treasureNodes: [(node: SKSpriteNode, value: Int)] = []

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
    private var lastAimTouch: CGPoint = .zero
    private var lastFrameTime: TimeInterval = 0
    private var driveFrameTimer: TimeInterval = 0
    private var driveFrameIndex: Int = 1
    private var playerBodyNode: SKSpriteNode?
    private var tutorialPromptNode: SKNode?
    private var tutorialArrowNode: SKNode?

    public override func didMove(to view: SKView) {
        // Initialize player stats & inventory from persisted GameState
        let tank = GameState.shared.selectedTank
        playerMaxHealth = Double(tank.armor)
        playerHealth = playerMaxHealth
        aiMaxHealth = Double(90 + levelNumber * 15)
        aiHealth = aiMaxHealth
        playerFuel = CGFloat(GameState.shared.playerGas * 100.0)
        battlePot = 10

        let preferred = GameState.shared.selectedWeapon
        currentWeapon = GameState.shared.ammoCount(for: preferred) > 0 ? preferred : .babyMissile

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
        setupTutorialPrompt()
        updateWeaponHUD()

        startTurn()
    }

    // MARK: - 1. Multi-Theme Parallax Environment (themes.lua:452-800)
    private struct ThemeSpec {
        let skyColor: SKColor
        let backLayer: String
        let midLayer: String
        let frontLayer: String
        let dirtTile: String
        let strokeColor: SKColor
        let capColor: SKColor
        let primaryFlair: [String]
        let secondaryFlair: String
    }

    private var currentThemeSpec: ThemeSpec {
        switch ((max(1, levelNumber) - 1) % 5) + 1 {
        case 1: // DESERT (arizonatheme)
            return ThemeSpec(
                skyColor: SKColor(red: 72.0/255.0, green: 126.0/255.0, blue: 216.0/255.0, alpha: 1.0),
                backLayer: "arizona_back.png",
                midLayer: "arizona_middle.png",
                frontLayer: "arizona_front.png",
                dirtTile: "res/themes/arizonatheme/tiled_pebbles.png",
                strokeColor: SKColor(red: 0.32, green: 0.18, blue: 0.08, alpha: 1.0),
                capColor: SKColor(red: 112.0/255.0, green: 158.0/255.0, blue: 38.0/255.0, alpha: 1.0),
                primaryFlair: ["cactus1.png", "cactus2.png", "cactus3.png"],
                secondaryFlair: "arizona_flair_frames/grass1.png"
            )
        case 2: // MOUNTAINS (greatwalltheme)
            return ThemeSpec(
                skyColor: SKColor(red: 227.0/255.0, green: 247.0/255.0, blue: 254.0/255.0, alpha: 1.0),
                backLayer: "greatwall_back.png",
                midLayer: "greatwall_middle.png",
                frontLayer: "greatwall_front.png",
                dirtTile: "res/themes/greatwalltheme/tiled_pebbles.png",
                strokeColor: SKColor(red: 0.28, green: 0.22, blue: 0.12, alpha: 1.0),
                capColor: SKColor(red: 95.0/255.0, green: 150.0/255.0, blue: 42.0/255.0, alpha: 1.0),
                primaryFlair: ["hill2.png", "hill3.png"],
                secondaryFlair: "greatwall_flair_frames/grass1.png"
            )
        case 3: // SNOW (snowtheme)
            return ThemeSpec(
                skyColor: SKColor(red: 72.0/255.0, green: 126.0/255.0, blue: 216.0/255.0, alpha: 1.0),
                backLayer: "snowbackground.png",
                midLayer: "snowmidground.png",
                frontLayer: "snowforeground.png",
                dirtTile: "res/themes/snowtheme/tiled_pebbles.png",
                strokeColor: SKColor(red: 0.75, green: 0.85, blue: 0.95, alpha: 1.0),
                capColor: SKColor(red: 0.92, green: 0.96, blue: 1.0, alpha: 1.0),
                primaryFlair: ["snowman.png", "snowdrift1.png", "snowdrift2.png"],
                secondaryFlair: "snow_flair_frames/rock.png"
            )
        case 4: // JUNGLE (jungle)
            return ThemeSpec(
                skyColor: SKColor(red: 72.0/255.0, green: 126.0/255.0, blue: 216.0/255.0, alpha: 1.0),
                backLayer: "jungle_frames/background.png",
                midLayer: "jungle_frames/midground.png",
                frontLayer: "jungle_frames/foreground.png",
                dirtTile: "res/themes/jungle/tiled_pebbles.png",
                strokeColor: SKColor(red: 0.18, green: 0.38, blue: 0.14, alpha: 1.0),
                capColor: SKColor(red: 64.0/255.0, green: 148.0/255.0, blue: 40.0/255.0, alpha: 1.0),
                primaryFlair: ["palmtree.png", "smallpalm.png", "flowerbush.png"],
                secondaryFlair: "jungle_flair_frames/grass.png"
            )
        default: // VOLCANO (volcano)
            return ThemeSpec(
                skyColor: SKColor(red: 255.0/255.0, green: 147.0/255.0, blue: 88.0/255.0, alpha: 1.0),
                backLayer: "volcano_frames/background.png",
                midLayer: "volcano_frames/midground.png",
                frontLayer: "volcano_frames/foreground.png",
                dirtTile: "res/themes/volcano/tiled_pebbles.png",
                strokeColor: SKColor(red: 0.25, green: 0.12, blue: 0.10, alpha: 1.0),
                capColor: SKColor(red: 0.45, green: 0.22, blue: 0.12, alpha: 1.0),
                primaryFlair: ["tree.png", "bush.png"],
                secondaryFlair: "tallgrass.png"
            )
        }
    }

    private func setupParallaxBackdrop() {
        let spec = currentThemeSpec
        backgroundColor = spec.skyColor

        // Each 1024-wide theme layer is scaled uniformly by (size.width / 1024.0) so its native height and aspect ratio are preserved!
        let layerScale = size.width / 1024.0

        // 1. Distant mountain horizon (e.g. arizona_back.png: 1024x181 native)
        let backLayer = TextureHelper.nativeSprite(named: spec.backLayer, scale: layerScale, fallbackColor: .clear, fallbackSize: CGSize(width: 1024, height: 181))
        backLayer.position = CGPoint(x: size.width / 2, y: 455)
        backLayer.zPosition = -40
        addChild(backLayer)

        // 2. Midground ridge (e.g. arizona_middle.png: 1024x50 native)
        let midLayer = TextureHelper.nativeSprite(named: spec.midLayer, scale: layerScale, fallbackColor: .clear, fallbackSize: CGSize(width: 1024, height: 50))
        midLayer.position = CGPoint(x: size.width / 2, y: 422)
        midLayer.zPosition = -30
        addChild(midLayer)

        // 3. Foreground mesas & silhouettes (e.g. arizona_front.png: 1024x270 native)
        let frontLayer = TextureHelper.nativeSprite(named: spec.frontLayer, scale: layerScale, fallbackColor: .clear, fallbackSize: CGSize(width: 1024, height: 270))
        frontLayer.position = CGPoint(x: size.width / 2, y: 340)
        frontLayer.zPosition = -20
        addChild(frontLayer)
    }

    // MARK: - 2. Bedrock Base Layer (bedrock.png: 717x252 native at 0.5x world scale, tiled horizontally)
    private func setupBedrockBase() {
        let container = SKNode()
        container.zPosition = -8
        let tileScale: CGFloat = 0.50
        let sample = TextureHelper.nativeSprite(named: "bedrock.png", scale: tileScale, fallbackColor: SKColor(white: 0.85, alpha: 1.0), fallbackSize: CGSize(width: 358, height: 126))
        let tileW = max(200, sample.size.width)
        var x: CGFloat = tileW / 2
        while x - tileW / 2 < size.width {
            let tile = TextureHelper.nativeSprite(named: "bedrock.png", scale: tileScale, fallbackColor: SKColor(white: 0.85, alpha: 1.0), fallbackSize: CGSize(width: 358, height: 126))
            tile.position = CGPoint(x: x, y: 80)
            container.addChild(tile)
            x += tileW - 2
        }
        addChild(container)
        self.bedrockNode = container
    }

    // MARK: - 3. Stepped Dirt Terrain & Underground Treasures (themes.lua:297-391)
    private func setupTerrainNode() {
        guard let terrain = terrain else { return }
        let spec = currentThemeSpec

        let shape = SKShapeNode(path: terrain.createPath())
        shape.strokeColor = spec.strokeColor
        shape.lineWidth = 2.0

        let dirtTex = TextureHelper.loadTexture(named: spec.dirtTile, fallbackColor: SKColor(red: 0.44, green: 0.24, blue: 0.12, alpha: 1.0), size: CGSize(width: 52, height: 52))
        shape.fillTexture = dirtTex
        shape.fillColor = .white
        shape.zPosition = -5
        addChild(shape)
        self.terrainShapeNode = shape

        // Green grass / surface cap along the horizontal tops of each step
        let cap = SKShapeNode(path: terrain.createTopCapPath())
        cap.strokeColor = spec.capColor
        cap.lineWidth = 4.5
        cap.zPosition = -4
        addChild(cap)
        self.terrainCapNode = cap

        // Embed Collectible Underground Treasures at true native aspect ratios (themes.lua:305-380)
        // goldnuggets.png is 220x220 native (scaled by 0.26 -> 57x57), ruby.png & emerald.png are 106x105 native
        treasureNodes.removeAll()
        let treasures: [(name: String, xNorm: CGFloat, y: CGFloat, scale: CGFloat, value: Int)] = [
            ("goldnuggets.png", 0.42, 200, 0.26, 200),
            ("ruby.png", 0.26, 175, 0.34, 300),
            ("emerald.png", 0.74, 185, 0.34, 400)
        ]
        for item in treasures {
            let tNode = TextureHelper.nativeSprite(named: item.name, scale: item.scale, fallbackColor: .yellow, fallbackSize: CGSize(width: 48, height: 48))
            let xPos = size.width * item.xNorm
            let maxY = max(145, terrain.valueAt(x: xPos) - 42)
            tNode.position = CGPoint(x: xPos, y: min(item.y, maxY))
            tNode.zPosition = -3
            addChild(tNode)
            treasureNodes.append((node: tNode, value: item.value))
        }
    }

    private func setupSteppedDecorations() {
        guard let terrain = terrain else { return }
        let spec = currentThemeSpec
        let worldScale: CGFloat = 0.50 // Matches DEFAULT_X_SCALE (~0.5) in battlefieldScene.lua:223-225

        // Primary flair (cactus1: 48x138, cactus2: 100x68, cactus3: 36x33 at 0.5x scale) anchored at bottom on terrain step
        let primaryPlacements: [(xNorm: CGFloat, flairIdx: Int)] = [
            (0.18, 0), // Tall saguaro on left hill
            (0.25, 1), // Prickly pear bush behind player tank
            (0.53, 0), // Tall saguaro on valley slope
            (0.63, 2), // Small barrel cactus next to enemy tank
            (0.81, 0), // Tall saguaro on right hill
            (0.89, 1)  // Prickly pear bush on right step
        ]
        for item in primaryPlacements {
            let x = size.width * item.xNorm
            let y = terrain.valueAt(x: x)
            let fName = spec.primaryFlair[item.flairIdx % spec.primaryFlair.count]
            let fSprite = TextureHelper.nativeSprite(named: fName, scale: worldScale)
            fSprite.anchorPoint = CGPoint(x: 0.5, y: 0.05)
            fSprite.position = CGPoint(x: x, y: y)
            fSprite.zPosition = -2
            addChild(fSprite)
        }

        // Secondary grass tufts (grass1.png: 43x102 native at 0.45x scale)
        let secondaryNorms: [CGFloat] = [0.09, 0.37, 0.49, 0.74, 0.96]
        for normX in secondaryNorms {
            let x = size.width * normX
            let y = terrain.valueAt(x: x)
            let gSprite = TextureHelper.nativeSprite(named: spec.secondaryFlair, scale: 0.45)
            gSprite.anchorPoint = CGPoint(x: 0.5, y: 0.05)
            gSprite.position = CGPoint(x: x, y: y)
            gSprite.zPosition = -2
            addChild(gSprite)
        }
    }

    private func updateTerrainMesh() {
        guard let terrain = terrain else { return }
        terrainShapeNode?.path = terrain.createPath()
        terrainCapNode?.path = terrain.createTopCapPath()
    }

    // MARK: - 4. Top Avatars HUD (battleControls.lu Proto 25 & battleAvatar.lua:780-1073)
    private func setupTopAvatarsHUD() {
        // In battleControls.lu Proto 25: battleAvatar scale = 0.425 (94x94 frame), placed 10px from top-left and top-right corners
        let avatarScale: CGFloat = 0.425
        let halfFrame: CGFloat = 47.0
        let margin: CGFloat = 10.0

        // --- PLAYER AVATAR (Top-Left) ---
        let pAvatarGroup = TextureHelper.buildGeneralAvatar(isPlayer: true, scale: avatarScale)
        pAvatarGroup.position = CGPoint(x: margin + halfFrame, y: size.height - margin - halfFrame)
        pAvatarGroup.zPosition = 30
        addChild(pAvatarGroup)
        self.playerAvatarNode = pAvatarGroup

        // Health Bar below Player Frame (battleControls.lu Proto 25: width=94, height=8)
        let pHpBg = SKShapeNode(rectOf: CGSize(width: 94, height: 8), cornerRadius: 2)
        pHpBg.fillColor = SKColor(red: 0.85, green: 0.15, blue: 0.15, alpha: 1.0)
        pHpBg.strokeColor = SKColor(red: 98.0/255.0, green: 65.0/255.0, blue: 24.0/255.0, alpha: 1.0)
        pHpBg.lineWidth = 1.5
        pHpBg.position = CGPoint(x: 0, y: -halfFrame - 8)
        pHpBg.zPosition = 10
        pAvatarGroup.addChild(pHpBg)

        let pHp = SKShapeNode(rectOf: CGSize(width: 92, height: 6), cornerRadius: 1)
        pHp.fillColor = SKColor(red: 0.25, green: 0.82, blue: 0.25, alpha: 1.0)
        pHp.strokeColor = .clear
        pHp.position = pHpBg.position
        pHp.zPosition = 11
        pAvatarGroup.addChild(pHp)
        self.playerHealthBar = pHp

        // --- ENEMY AVATAR (Top-Right) ---
        let aiAvatarGroup = TextureHelper.buildGeneralAvatar(isPlayer: false, scale: avatarScale)
        aiAvatarGroup.position = CGPoint(x: size.width - margin - halfFrame, y: size.height - margin - halfFrame)
        aiAvatarGroup.zPosition = 30
        addChild(aiAvatarGroup)
        self.aiAvatarNode = aiAvatarGroup

        let aiHpBg = SKShapeNode(rectOf: CGSize(width: 94, height: 8), cornerRadius: 2)
        aiHpBg.fillColor = SKColor(red: 0.85, green: 0.15, blue: 0.15, alpha: 1.0)
        aiHpBg.strokeColor = SKColor(red: 98.0/255.0, green: 65.0/255.0, blue: 24.0/255.0, alpha: 1.0)
        aiHpBg.lineWidth = 1.5
        aiHpBg.position = CGPoint(x: 0, y: -halfFrame - 8)
        aiHpBg.zPosition = 10
        aiAvatarGroup.addChild(aiHpBg)

        let aiHp = SKShapeNode(rectOf: CGSize(width: 92, height: 6), cornerRadius: 1)
        aiHp.fillColor = SKColor(red: 0.25, green: 0.82, blue: 0.25, alpha: 1.0)
        aiHp.strokeColor = .clear
        aiHp.position = aiHpBg.position
        aiHp.zPosition = 11
        aiAvatarGroup.addChild(aiHp)
        self.aiHealthBar = aiHp
    }

    // MARK: - 5. Tanks Setup (Native Aspect Ratios at World Scale 0.50)
    private func setupTanks() {
        guard let terrain = terrain else { return }
        let tankScale: CGFloat = 0.50

        // Player Tank on left plateau (normX = 0.28)
        let pTank = SKNode()
        let pStartX: CGFloat = size.width * 0.28
        let pStartY = terrain.valueAt(x: pStartX)
        pTank.position = CGPoint(x: pStartX, y: pStartY)
        pTank.zPosition = 10
        addChild(pTank)
        self.playerTankNode = pTank

        let selectedTank = GameState.shared.selectedTank
        let pBodySprite = TextureHelper.nativeSprite(named: selectedTank.textureName, scale: tankScale, fallbackColor: .green, fallbackSize: CGSize(width: 74, height: 61))
        pBodySprite.anchorPoint = CGPoint(x: 0.5, y: 0.05)
        pBodySprite.position = .zero
        pBodySprite.zPosition = 1
        pTank.addChild(pBodySprite)
        self.playerBodyNode = pBodySprite

        let pTurret = TextureHelper.nativeSprite(named: "blue_cannonfire0.png", scale: tankScale, fallbackColor: .darkGray, fallbackSize: CGSize(width: 53, height: 20))
        pTurret.anchorPoint = CGPoint(x: 0.15, y: 0.5)
        pTurret.position = CGPoint(x: 2, y: pBodySprite.size.height * 0.72)
        pTurret.zRotation = playerAngle * .pi / 180.0
        pTurret.zPosition = 0
        pTank.addChild(pTurret)
        self.playerTurret = pTurret

        // AI Enemy Tank in valley plateau (normX = 0.59)
        let aiTank = SKNode()
        let aiStartX: CGFloat = size.width * 0.59
        let aiStartY = terrain.valueAt(x: aiStartX)
        aiTank.position = CGPoint(x: aiStartX, y: aiStartY)
        aiTank.zPosition = 10
        addChild(aiTank)
        self.aiTankNode = aiTank

        let aiBodySprite = TextureHelper.nativeSprite(named: "gold_tankdrive1.png", scale: tankScale, fallbackColor: .orange, fallbackSize: CGSize(width: 106, height: 62))
        aiBodySprite.anchorPoint = CGPoint(x: 0.5, y: 0.05)
        aiBodySprite.xScale = -1.0
        aiBodySprite.position = .zero
        aiBodySprite.zPosition = 1
        aiTank.addChild(aiBodySprite)

        let aiTurret = TextureHelper.nativeSprite(named: "gold_tank_cannonfire0.png", scale: tankScale, fallbackColor: .darkGray, fallbackSize: CGSize(width: 53, height: 20))
        aiTurret.anchorPoint = CGPoint(x: 0.15, y: 0.5)
        aiTurret.position = CGPoint(x: -2, y: aiBodySprite.size.height * 0.72)
        aiTurret.zRotation = 135.0 * .pi / 180.0
        aiTurret.zPosition = 0
        aiTank.addChild(aiTurret)
        self.aiTurret = aiTurret

        showSpeech(TrashTalkManager.shared.randomTaunt(), fromPlayer: false)
    }

    // MARK: - 6. Trajectory Arc (Alternating largecircle.png 19x19 & smallcircle.png 8x8, battleControls.lua:548-555)
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

        let rad = playerAngle * .pi / 180.0
        let turretBase = CGPoint(x: pTank.position.x + 2, y: pTank.position.y + 22)
        let muzzlePos = CGPoint(x: turretBase.x + cos(rad) * 20, y: turretBase.y + sin(rad) * 20)
        let speed = playerPower * 8.5
        var vx = speed * cos(rad)
        var vy = speed * sin(rad)
        let gravity: CGFloat = -420.0
        let dt: CGFloat = 0.048

        var current = muzzlePos

        for i in 0..<13 {
            // Alternate largecircle.png (19x19 native) and smallcircle.png (8x8 native) at 0.72x scale
            let isLarge = (i % 2 == 0)
            let dot = TextureHelper.nativeSprite(
                named: isLarge ? "largecircle.png" : "smallcircle.png",
                scale: 0.72,
                fallbackColor: .white,
                fallbackSize: isLarge ? CGSize(width: 19, height: 19) : CGSize(width: 8, height: 8)
            )
            dot.position = current
            dot.alpha = CGFloat(15 - i) / 15.0 * 0.96
            container.addChild(dot)

            if currentWeapon == .laser {
                current.x += cos(rad) * 24.0
                current.y += sin(rad) * 24.0
            } else {
                vx += windSpeed * dt
                vy += gravity * dt
                current.x += vx * dt
                current.y += vy * dt
            }

            if let terrain = terrain, current.y <= terrain.valueAt(x: current.x) {
                break
            }
        }
    }

    // MARK: - 7. Bottom Controls HUD (Exact 1024-wide layout from battleControls.lu Proto 35 buildControls2)
    private func setupBottomControlsHUD() {
        // In battleControls.lu Proto 35: the entire controlBar group is built in a 1024-wide coordinate space
        // centered at x = 0 (-512..+512), then scaled uniformly by (size.width / 1024.0).
        let barScale = size.width / 1024.0
        let barGroup = SKNode()
        barGroup.position = CGPoint(x: size.width / 2, y: 60.0 * barScale)
        barGroup.setScale(barScale)
        barGroup.zPosition = 20
        addChild(barGroup)
        self.controlBarGroup = barGroup

        // 0. Control bar background (controlbar_back.png: 1024x156 native)
        let controlBar = TextureHelper.nativeSprite(named: "controlbar_back.png", scale: 1.0, fallbackColor: SKColor(red: 0.88, green: 0.65, blue: 0.35, alpha: 1.0), fallbackSize: CGSize(width: 1024, height: 156))
        controlBar.position = CGPoint(x: 0, y: -18)
        controlBar.zPosition = 0
        barGroup.addChild(controlBar)

        // 1. Left: Circular Green Joystick Drive Button (joystick_top.png: 104x88 native at x = -419)
        let joyNode = TextureHelper.nativeSprite(named: "joystick_top.png", scale: 1.0, fallbackColor: .green, fallbackSize: CGSize(width: 104, height: 88))
        joyNode.name = "joystick_drive"
        joyNode.position = CGPoint(x: -419, y: -14)
        joyNode.zPosition = 2
        barGroup.addChild(joyNode)
        self.joystickNode = joyNode

        // 2. Red Gas Can (gastank_back.png + gastank_fill.png: 47x60 native at x = -335, y = -32)
        let gasBack = TextureHelper.nativeSprite(named: "gastank_back.png", scale: 1.0, fallbackColor: .red, fallbackSize: CGSize(width: 47, height: 60))
        gasBack.position = CGPoint(x: -335, y: -32)
        gasBack.zPosition = 1
        barGroup.addChild(gasBack)

        let gasFill = TextureHelper.nativeSprite(named: "gastank_fill.png", scale: 1.0, fallbackColor: .red, fallbackSize: CGSize(width: 47, height: 60))
        gasFill.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        gasFill.position = CGPoint(x: -335, y: -32 - gasFill.size.height / 2)
        gasFill.yScale = max(0.0, min(1.0, playerFuel / maxFuel))
        gasFill.zPosition = 2
        barGroup.addChild(gasFill)
        self.fuelFillNode = gasFill

        // 3. Missions / Clipboard Button (missions_normal_btn.png: round clipboard button at x = -245)
        let missionsBtn = TextureHelper.nativeSprite(named: "missions_normal_btn.png", scale: 0.72, fallbackColor: .clear, fallbackSize: CGSize(width: 58, height: 62))
        missionsBtn.name = "missions_btn"
        missionsBtn.position = CGPoint(x: -245, y: -30)
        missionsBtn.zPosition = 2
        barGroup.addChild(missionsBtn)

        // 4. Open Briefcase of Cash + Clean Pot Amount Box (matching target screenshot layout)
        let briefcase = TextureHelper.nativeSprite(named: "res/ui/briefcase.png", scale: 0.65, fallbackColor: .clear, fallbackSize: CGSize(width: 60, height: 50))
        briefcase.position = CGPoint(x: -135, y: -30)
        briefcase.zPosition = 2
        barGroup.addChild(briefcase)

        let brownDark = SKColor(red: 98.0/255.0, green: 65.0/255.0, blue: 24.0/255.0, alpha: 1.0)
        let potBox = SKShapeNode(rectOf: CGSize(width: 116, height: 44), cornerRadius: 4)
        potBox.fillColor = .white
        potBox.strokeColor = brownDark
        potBox.lineWidth = 2.5
        potBox.position = CGPoint(x: -22, y: -32)
        potBox.zPosition = 2
        barGroup.addChild(potBox)

        let dollarSign = SKLabelNode(fontNamed: "SingleSleeve")
        dollarSign.text = "$"
        dollarSign.fontSize = 32
        dollarSign.fontColor = brownDark
        dollarSign.verticalAlignmentMode = .center
        dollarSign.position = CGPoint(x: -36, y: -1)
        dollarSign.zPosition = 3
        potBox.addChild(dollarSign)

        let warbuxVal = SKLabelNode(fontNamed: "SingleSleeve")
        warbuxVal.text = "\(battlePot)"
        warbuxVal.fontSize = 30
        warbuxVal.fontColor = brownDark
        warbuxVal.horizontalAlignmentMode = .right
        warbuxVal.verticalAlignmentMode = .center
        warbuxVal.position = CGPoint(x: 44, y: -1)
        warbuxVal.zPosition = 3
        potBox.addChild(warbuxVal)
        self.warbuxDisplayLabel = warbuxVal

        // 5. Surrender Flag Button (flag_normal_btn.png: 71x74 native at x = 124, y = -30)
        let flagBtn = TextureHelper.nativeSprite(named: "flag_normal_btn.png", scale: 1.0, fallbackColor: .clear, fallbackSize: CGSize(width: 71, height: 74))
        flagBtn.name = "surrender_btn"
        flagBtn.position = CGPoint(x: 124, y: -30)
        flagBtn.zPosition = 1
        barGroup.addChild(flagBtn)

        // 6. Weapon Selector Button (weapon_normal_btn.png: 162x75 native at x = 255, y = -30)
        let wBtn = TextureHelper.nativeSprite(named: "weapon_normal_btn.png", scale: 1.0, fallbackColor: .clear, fallbackSize: CGSize(width: 162, height: 75))
        wBtn.name = "weapon_select_btn"
        wBtn.position = CGPoint(x: 255, y: -30)
        wBtn.zPosition = 1
        barGroup.addChild(wBtn)

        let wIcon = TextureHelper.nativeSprite(named: currentWeapon.iconName, scale: 0.80, fallbackColor: .clear, fallbackSize: CGSize(width: 38, height: 38))
        wIcon.name = "weapon_select_btn"
        wIcon.position = CGPoint(x: -36, y: 0)
        wIcon.zPosition = 2
        wBtn.addChild(wIcon)
        self.weaponIconNode = wIcon

        let ammoCount = SKLabelNode(fontNamed: "SingleSleeve")
        ammoCount.name = "weapon_select_btn"
        ammoCount.text = "1"
        ammoCount.fontSize = 30
        ammoCount.fontColor = brownDark
        ammoCount.horizontalAlignmentMode = .right
        ammoCount.verticalAlignmentMode = .center
        ammoCount.position = CGPoint(x: 58, y: -2)
        ammoCount.zPosition = 2
        wBtn.addChild(ammoCount)
        self.ammoCountLabel = ammoCount

        // 7. Right: Big Red Circular FIRE Button (fire_normal_btn.png: 95x95 native at x = 425, y = -13)
        let fireBtn = TextureHelper.nativeSprite(named: "fire_normal_btn.png", scale: 1.0, fallbackColor: .red, fallbackSize: CGSize(width: 95, height: 95))
        fireBtn.name = "fire_btn"
        fireBtn.position = CGPoint(x: 425, y: -13)
        fireBtn.zPosition = 2
        barGroup.addChild(fireBtn)
        self.fireButtonNode = fireBtn
    }

    // MARK: - Top Tutorial Prompt & Red Arrow
    private func setupTutorialPrompt() {
        let barScale = size.width / 1024.0

        // Banner: cream banner centered at top
        let banner = SKNode()
        banner.position = CGPoint(x: size.width / 2, y: size.height - 42)
        banner.zPosition = 50

        let bg = SKShapeNode(rectOf: CGSize(width: 480, height: 56), cornerRadius: 3)
        bg.fillColor = SKColor(red: 247.0/255.0, green: 240.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        bg.strokeColor = SKColor(red: 98.0/255.0, green: 65.0/255.0, blue: 24.0/255.0, alpha: 1.0)
        bg.lineWidth = 3.0
        banner.addChild(bg)

        let label = SKLabelNode(fontNamed: "SingleSleeve")
        label.text = "CLICK   🚀   TO SELECT WEAPON."
        label.fontSize = 24
        label.fontColor = SKColor(red: 98.0/255.0, green: 65.0/255.0, blue: 24.0/255.0, alpha: 1.0)
        label.verticalAlignmentMode = .center
        banner.addChild(label)

        addChild(banner)
        self.tutorialPromptNode = banner

        // Bouncing Red Arrow pointing down at weapon button
        let arrow = TextureHelper.nativeSprite(named: "select_arrow.png", scale: 1.1, fallbackColor: .red, fallbackSize: CGSize(width: 56, height: 60))
        arrow.color = SKColor(red: 0.9, green: 0.1, blue: 0.1, alpha: 1.0)
        arrow.colorBlendFactor = 0.85
        arrow.zRotation = .pi // pointing down
        let arrowPos = CGPoint(x: size.width / 2 + 255 * barScale, y: 155 * barScale)
        arrow.position = arrowPos
        arrow.zPosition = 50
        addChild(arrow)
        self.tutorialArrowNode = arrow

        let bob = SKAction.repeatForever(SKAction.sequence([
            SKAction.moveBy(x: 0, y: -12, duration: 0.4),
            SKAction.moveBy(x: 0, y: 12, duration: 0.4)
        ]))
        arrow.run(bob)
    }

    private func dismissTutorialPrompt() {
        tutorialPromptNode?.run(SKAction.sequence([
            SKAction.fadeOut(withDuration: 0.25),
            SKAction.removeFromParent()
        ]))
        tutorialPromptNode = nil

        tutorialArrowNode?.run(SKAction.sequence([
            SKAction.fadeOut(withDuration: 0.25),
            SKAction.removeFromParent()
        ]))
        tutorialArrowNode = nil
    }

    private func updateWeaponHUD() {
        if let wIcon = weaponIconNode {
            let tex = TextureHelper.loadTexture(named: currentWeapon.iconName, fallbackColor: .clear, size: CGSize(width: 48, height: 48))
            wIcon.texture = tex
            let raw = tex.size()
            if raw.width > 0 && raw.height > 0 {
                let ratio = min(44.0 / raw.width, 44.0 / raw.height)
                wIcon.size = CGSize(width: raw.width * ratio, height: raw.height * ratio)
            }
        }
        let count = GameState.shared.ammoCount(for: currentWeapon)
        // Show "1" for default single shot in screenshot or actual owned count
        ammoCountLabel?.text = currentWeapon.isInfiniteDefault ? "1" : "\(count)"
    }

    private func addPotBonus(_ amount: Int, at pos: CGPoint? = nil) {
        guard amount > 0 else { return }
        battlePot += amount
        warbuxDisplayLabel?.text = "\(battlePot)"

        if let p = pos {
            let pop = SKLabelNode(fontNamed: "SingleSleeve")
            pop.text = "+$\(amount)"
            pop.fontSize = 20
            pop.fontColor = SKColor(red: 1.0, green: 0.9, blue: 0.2, alpha: 1.0)
            pop.position = p
            pop.zPosition = 40
            addChild(pop)
            pop.run(SKAction.sequence([
                SKAction.group([
                    SKAction.moveBy(x: 0, y: 36, duration: 0.9),
                    SKAction.fadeOut(withDuration: 0.9)
                ]),
                SKAction.removeFromParent()
            ]))
        }
    }

    // MARK: - Frame Update: Continuous Driving & Tread Cycle
    public override func update(_ currentTime: TimeInterval) {
        let dt = lastFrameTime > 0 ? min(0.1, currentTime - lastFrameTime) : 0.016
        lastFrameTime = currentTime

        if isDrivingLeft && isPlayerTurn && !isProjectileActive {
            driveTank(step: -65.0 * CGFloat(dt), isReverse: true, dt: dt)
        } else if isDrivingRight && isPlayerTurn && !isProjectileActive {
            driveTank(step: 65.0 * CGFloat(dt), isReverse: false, dt: dt)
        }
    }

    // MARK: - 8. Touch Input: Real-Time Sliding Finger Aiming & Driving
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let hitNodes = nodes(at: location)

        for node in hitNodes {
            if node.name == "fire_btn" {
                if isPlayerTurn && !isProjectileActive {
                    dismissTutorialPrompt()
                    fireWeapon(fromPlayer: true)
                }
                return
            }

            if node.name == "weapon_select_btn" {
                dismissTutorialPrompt()
                cycleWeapon()
                return
            }

            if node.name == "surrender_btn" {
                endBattle(playerWon: false)
                return
            }

            if node.name == "missions_btn" {
                SoundManager.shared.playSound("weapon_select.mp3")
                return
            }

            if node.name == "joystick_drive" {
                // If touching left half of joystick -> drive left; right half -> drive right
                let localX = joystickNode != nil ? touch.location(in: joystickNode!).x : (location.x - 65)
                if localX < 0 {
                    isDrivingLeft = true
                    isDrivingRight = false
                } else {
                    isDrivingRight = true
                    isDrivingLeft = false
                }
                driveTank(step: localX < 0 ? -1.5 : 1.5, isReverse: localX < 0, dt: 0.016)
                return
            }
        }

        // Outside bottom HUD: Finger sliding controls elevation angle and power smoothly without resetting!
        if location.y > 90 * (size.width / 1024.0) && isPlayerTurn && !isProjectileActive {
            isAimDragging = true
            lastAimTouch = location
            // Authentic behavior: DO NOT snap or reset angle/power on touch down!
        }
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)

        if isDrivingLeft || isDrivingRight {
            if let joy = joystickNode {
                let localX = touch.location(in: joy).x
                if localX < 0 {
                    isDrivingLeft = true
                    isDrivingRight = false
                } else {
                    isDrivingRight = true
                    isDrivingLeft = false
                }
            }
            return
        }

        if isAimDragging && isPlayerTurn && !isProjectileActive {
            let dx = location.x - lastAimTouch.x
            let dy = location.y - lastAimTouch.y

            // Authentic delta aiming matching battleControls.lua:381-413
            // ANGLE_SENSITIVITY ~ 6.0, POWER_SENSITIVITY ~ 6.0
            playerAngle = max(5.0, min(88.0, playerAngle + dx / 6.0))
            playerPower = max(20.0, min(100.0, playerPower + dy / 6.0))
            playerTurret?.zRotation = playerAngle * .pi / 180.0
            lastAimTouch = location

            updateTrajectoryArc()
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isAimDragging = false
        isDrivingLeft = false
        isDrivingRight = false
        playerBodyNode?.texture = TextureHelper.loadTexture(named: "blue_tankdrive1.png", fallbackColor: .clear)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isAimDragging = false
        isDrivingLeft = false
        isDrivingRight = false
        playerBodyNode?.texture = TextureHelper.loadTexture(named: "blue_tankdrive1.png", fallbackColor: .clear)
    }

    // MARK: - 9. Tank Driving & Fuel
    private func driveTank(step: CGFloat, isReverse: Bool, dt: TimeInterval) {
        guard let pTank = playerTankNode, let terrain = terrain, playerFuel > 0 else { return }

        let newX = max(40, min(size.width * 0.45, pTank.position.x + step))
        let newY = terrain.valueAt(x: newX)
        pTank.position = CGPoint(x: newX, y: newY)

        let slope = terrain.slopeAt(x: newX)
        pTank.zRotation = slope

        playerFuel = max(0, playerFuel - CGFloat(dt) * 6.0)
        fuelFillNode?.yScale = playerFuel / maxFuel
        GameState.shared.playerGas = Double(playerFuel / maxFuel)

        driveFrameTimer += dt
        if driveFrameTimer >= 0.08 {
            driveFrameTimer = 0
            driveFrameIndex = (driveFrameIndex % 4) + 1
            let frameName = isReverse ? "blue_tankrdrive\(driveFrameIndex).png" : "blue_tankdrive\(driveFrameIndex).png"
            playerBodyNode?.texture = TextureHelper.loadTexture(named: frameName, fallbackColor: .clear)
        }

        updateTrajectoryArc()
    }

    private func settleTanksOnTerrain() {
        guard let terrain = terrain else { return }
        if let pTank = playerTankNode {
            pTank.position.y = terrain.valueAt(x: pTank.position.x)
            pTank.zRotation = terrain.slopeAt(x: pTank.position.x)
        }
        if let aiTank = aiTankNode {
            aiTank.position.y = terrain.valueAt(x: aiTank.position.x)
            aiTank.zRotation = terrain.slopeAt(x: aiTank.position.x)
        }
    }

    private func cycleWeapon() {
        let owned = WeaponType.allCases.filter { GameState.shared.ammoCount(for: $0) > 0 }
        guard !owned.isEmpty else { return }
        if let idx = owned.firstIndex(of: currentWeapon) {
            currentWeapon = owned[(idx + 1) % owned.count]
        } else {
            currentWeapon = owned[0]
        }
        GameState.shared.selectedWeapon = currentWeapon
        updateWeaponHUD()
        SoundManager.shared.playSound("weapon_select.mp3")
        updateTrajectoryArc()
    }

    // MARK: - 10. Turn Logic, Special Weapons & Authentic AI Solver
    private func startTurn() {
        isProjectileActive = false
        // ALLOW_WIND.SINGLEPLAYER = false (main.lua:104)
        windSpeed = 0.0
        updateTrajectoryArc()

        if !isPlayerTurn {
            run(SKAction.sequence([
                SKAction.wait(forDuration: 1.1),
                SKAction.run { [weak self] in
                    self?.executeAITurn()
                }
            ]))
        }
    }

    private func fireWeapon(fromPlayer: Bool, aiWeaponOverride: WeaponType? = nil, aiPowerOverride: CGFloat? = nil) {
        guard !isProjectileActive else { return }
        isProjectileActive = true
        trajectoryContainer?.removeAllChildren()

        let weapon = fromPlayer ? currentWeapon : (aiWeaponOverride ?? .missile)
        let originNode = fromPlayer ? playerTankNode : aiTankNode
        let turret = fromPlayer ? playerTurret : aiTurret

        guard let origin = originNode, let turr = turret else { return }

        if fromPlayer {
            GameState.shared.consumeAmmo(for: weapon)
            currentWeapon = GameState.shared.ammoCount(for: weapon) > 0 ? weapon : .babyMissile
            updateWeaponHUD()
        }

        SoundManager.shared.playSound(weapon.launchSound)

        // Special Weapon 1: Defensive Energy Shield (weapons.shield.lua)
        if weapon == .shield && fromPlayer {
            playerShieldHP = 50.0
            playerShieldNode?.removeFromParent()
            let sTex = TextureHelper.loadTexture(named: "shield.png", fallbackColor: .cyan, size: CGSize(width: 64, height: 64))
            let sNode = SKSpriteNode(texture: sTex, size: CGSize(width: 64, height: 64))
            sNode.alpha = 0.75
            sNode.zPosition = 12
            origin.addChild(sNode)
            playerShieldNode = sNode
            run(SKAction.sequence([
                SKAction.wait(forDuration: 0.7),
                SKAction.run { [weak self] in self?.endTurn() }
            ]))
            return
        }

        // Cannon muzzle flash animation
        let flashFrames = (0...7).compactMap { i -> SKTexture? in
            let name = fromPlayer ? "blue_cannonfire\(i).png" : "gold_tank_cannonfire\(i).png"
            return TextureHelper.loadTexture(named: name, fallbackColor: .white, size: CGSize(width: 32, height: 12))
        }
        if !flashFrames.isEmpty {
            turr.run(SKAction.animate(with: flashFrames, timePerFrame: 0.04))
        }

        let rad = turr.zRotation
        let startPos = CGPoint(x: origin.position.x + cos(rad) * 20, y: origin.position.y + 22 + sin(rad) * 20)

        // Special Weapon 2: Linear Laser Beam (weapons.laser.lua / battleControls.lua:319)
        if weapon == .laser {
            var rayPos = startPos
            let targetNode = fromPlayer ? aiTankNode : playerTankNode
            var didHitTank = false
            for _ in 0..<80 {
                rayPos.x += cos(rad) * 12.0
                rayPos.y += sin(rad) * 12.0
                if let target = targetNode, rayPos.distance(to: target.position) < 26 {
                    didHitTank = true
                    break
                }
                if let terrain = terrain, rayPos.y <= terrain.valueAt(x: rayPos.x) {
                    break
                }
            }
            let beamPath = CGMutablePath()
            beamPath.move(to: startPos)
            beamPath.addLine(to: rayPos)
            let beam = SKShapeNode(path: beamPath)
            beam.strokeColor = SKColor(red: 0.2, green: 1.0, blue: 1.0, alpha: 0.95)
            beam.lineWidth = 5.0
            beam.glowWidth = 4.0
            beam.zPosition = 26
            addChild(beam)
            beam.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.35),
                SKAction.removeFromParent()
            ]))
            handleImpact(pos: rayPos, weapon: weapon, hitTarget: didHitTank, targetIsPlayer: !fromPlayer, fromPlayer: fromPlayer)
            return
        }

        let powerVal = fromPlayer ? playerPower : (aiPowerOverride ?? 65.0)
        let speed = powerVal * 8.5
        let vx = speed * cos(rad)
        let vy = speed * sin(rad)

        let hopsRemaining = (weapon == .frog) ? 2 : ((weapon == .grenade) ? 1 : 0)
        let canSplitAtApex = (weapon == .mirv || weapon == .funkyBomb || weapon == .fBomb)
        spawnProjectile(
            startPos: startPos,
            vx: vx,
            vy: vy,
            weapon: weapon,
            fromPlayer: fromPlayer,
            canSplit: canSplitAtApex,
            hopsRemaining: hopsRemaining,
            endsTurnOnFinish: true
        )
    }

    private func spawnProjectile(
        startPos: CGPoint,
        vx initialVx: CGFloat,
        vy initialVy: CGFloat,
        weapon: WeaponType,
        fromPlayer: Bool,
        canSplit: Bool,
        hopsRemaining: Int,
        endsTurnOnFinish: Bool
    ) {
        var vx = initialVx
        var vy = initialVy
        var hasSplit = false
        var hasImpacted = false
        let gravity: CGFloat = -420.0

        let missileTex = TextureHelper.loadTexture(named: weapon.iconName, fallbackColor: .yellow, size: CGSize(width: 14, height: 14))
        let projectile = SKSpriteNode(texture: missileTex, size: CGSize(width: 14, height: 14))
        projectile.position = startPos
        projectile.zPosition = 25
        addChild(projectile)

        let dt: CGFloat = 1.0 / 60.0
        let flight = SKAction.repeatForever(SKAction.run { [weak self, weak projectile] in
            guard let self = self, let proj = projectile, !hasImpacted else { return }

            let prevVy = vy
            vx += self.windSpeed * dt
            vy += gravity * dt
            proj.position.x += vx * dt
            proj.position.y += vy * dt
            proj.zRotation = atan2(vy, vx)

            // Multi-warhead split at trajectory apex (weapons.mirv.lua / weapons.funky_bomb.lua)
            if canSplit && !hasSplit && prevVy >= 0 && vy < 0 {
                hasSplit = true
                for offsetVx in [-55.0, 55.0] as [CGFloat] {
                    self.spawnProjectile(
                        startPos: proj.position,
                        vx: vx + offsetVx,
                        vy: vy,
                        weapon: weapon,
                        fromPlayer: fromPlayer,
                        canSplit: false,
                        hopsRemaining: 0,
                        endsTurnOnFinish: false
                    )
                }
            }

            // Direct tank hit check
            let targetNode = fromPlayer ? self.aiTankNode : self.playerTankNode
            if let target = targetNode, proj.position.distance(to: target.position) < 26 {
                hasImpacted = true
                proj.removeAllActions()
                proj.removeFromParent()
                self.handleImpact(pos: proj.position, weapon: weapon, hitTarget: true, targetIsPlayer: !fromPlayer, fromPlayer: fromPlayer, endsTurn: endsTurnOnFinish)
                return
            }

            // Terrain collision check
            if let terrain = self.terrain, proj.position.y <= terrain.valueAt(x: proj.position.x) {
                hasImpacted = true
                let impactPos = CGPoint(x: proj.position.x, y: terrain.valueAt(x: proj.position.x))
                proj.removeAllActions()
                proj.removeFromParent()

                // Bounce / Leapfrog behavior (weapons.leapfrog.lua / weapons.grenade.lua)
                if hopsRemaining > 0 {
                    if weapon == .frog {
                        self.handleImpact(pos: impactPos, weapon: weapon, hitTarget: false, targetIsPlayer: !fromPlayer, fromPlayer: fromPlayer, endsTurn: false)
                    } else {
                        SoundManager.shared.playSound("grenade_tick.mp3")
                    }
                    self.spawnProjectile(
                        startPos: CGPoint(x: impactPos.x, y: impactPos.y + 8),
                        vx: vx * 0.65,
                        vy: abs(vy) * 0.55 + 95,
                        weapon: weapon,
                        fromPlayer: fromPlayer,
                        canSplit: false,
                        hopsRemaining: hopsRemaining - 1,
                        endsTurnOnFinish: endsTurnOnFinish
                    )
                    return
                }

                // Terrain Roller behavior (weapons.roller.lua)
                if weapon == .roller {
                    self.rollAlongTerrain(from: impactPos, direction: vx >= 0 ? 1.0 : -1.0, weapon: weapon, fromPlayer: fromPlayer, endsTurn: endsTurnOnFinish)
                    return
                }

                self.handleImpact(pos: impactPos, weapon: weapon, hitTarget: false, targetIsPlayer: !fromPlayer, fromPlayer: fromPlayer, endsTurn: endsTurnOnFinish)
                return
            }

            // Off-screen check
            if proj.position.y < -50 || proj.position.x < -100 || proj.position.x > self.size.width + 100 {
                hasImpacted = true
                proj.removeAllActions()
                proj.removeFromParent()
                if endsTurnOnFinish {
                    self.scheduleEndTurn(delay: 0.5)
                }
            }
        })
        projectile.run(flight)
    }

    private func rollAlongTerrain(from startPos: CGPoint, direction: CGFloat, weapon: WeaponType, fromPlayer: Bool, endsTurn: Bool) {
        guard let terrain = terrain else {
            handleImpact(pos: startPos, weapon: weapon, hitTarget: false, targetIsPlayer: !fromPlayer, fromPlayer: fromPlayer, endsTurn: endsTurn)
            return
        }
        let rollerTex = TextureHelper.loadTexture(named: "roller.png", fallbackColor: .gray, size: CGSize(width: 16, height: 16))
        let rollerNode = SKSpriteNode(texture: rollerTex, size: CGSize(width: 16, height: 16))
        rollerNode.position = startPos
        rollerNode.zPosition = 25
        addChild(rollerNode)

        let targetNode = fromPlayer ? aiTankNode : playerTankNode
        var stepsLeft = 18
        var hasExploded = false
        let rollStep = SKAction.repeat(SKAction.sequence([
            SKAction.wait(forDuration: 0.035),
            SKAction.run { [weak self, weak rollerNode] in
                guard let self = self, let rNode = rollerNode, let terr = self.terrain, !hasExploded else { return }
                stepsLeft -= 1
                let nextX = max(20, min(self.size.width - 20, rNode.position.x + direction * 6.5))
                let nextY = terr.valueAt(x: nextX) + 6
                rNode.position = CGPoint(x: nextX, y: nextY)
                rNode.zRotation -= direction * 0.4

                if let target = targetNode, rNode.position.distance(to: target.position) < 26 {
                    hasExploded = true
                    let hitPos = rNode.position
                    rNode.removeAllActions()
                    rNode.removeFromParent()
                    self.handleImpact(pos: hitPos, weapon: weapon, hitTarget: true, targetIsPlayer: !fromPlayer, fromPlayer: fromPlayer, endsTurn: endsTurn)
                } else if stepsLeft <= 0 {
                    hasExploded = true
                    let endPos = rNode.position
                    rNode.removeAllActions()
                    rNode.removeFromParent()
                    self.handleImpact(pos: endPos, weapon: weapon, hitTarget: false, targetIsPlayer: !fromPlayer, fromPlayer: fromPlayer, endsTurn: endsTurn)
                }
            }
        ]), count: 18)
        rollerNode.run(rollStep)
    }

    private func handleImpact(pos: CGPoint, weapon: WeaponType, hitTarget: Bool, targetIsPlayer: Bool, fromPlayer: Bool = true, endsTurn: Bool = true) {
        SoundManager.shared.playSound(weapon.impactSound)

        // Terrain modification: Dirt Bomb adds dirt mound; other weapons carve crater
        if weapon == .dirtbomb {
            terrain?.applyDirtMound(center: pos, radius: weapon.blastRadius)
        } else {
            terrain?.applyCrater(center: pos, radius: weapon.blastRadius)
            if fromPlayer && weapon.blastRadius > 0 {
                // Rock destruction bonus (weapons.balance_sheet.lua:9)
                addPotBonus(5)
            }
        }
        updateTerrainMesh()
        settleTanksOnTerrain()

        // Check underground treasure hits (themes.lua:305-380)
        if fromPlayer {
            let collectRadius = max(28, weapon.blastRadius + 16)
            for i in (0..<treasureNodes.count).reversed() {
                let item = treasureNodes[i]
                if item.node.position.distance(to: pos) <= collectRadius {
                    SoundManager.shared.playSound("kaching.mp3")
                    addPotBonus(item.value, at: item.node.position)
                    item.node.removeFromParent()
                    treasureNodes.remove(at: i)
                }
            }
        }

        // Explosion visual
        let explo = SKShapeNode(circleOfRadius: max(16, weapon.blastRadius))
        explo.fillColor = weapon == .dirtbomb
            ? SKColor(red: 0.55, green: 0.35, blue: 0.18, alpha: 0.9)
            : SKColor(red: 1.0, green: 0.5, blue: 0.1, alpha: 0.9)
        explo.strokeColor = .yellow
        explo.position = pos
        explo.zPosition = 26
        addChild(explo)

        explo.run(SKAction.sequence([
            SKAction.scale(to: 1.4, duration: 0.15),
            SKAction.fadeOut(withDuration: 0.25),
            SKAction.removeFromParent()
        ]))

        // Check splash proximity damage even if not a direct hit
        let targetNode = targetIsPlayer ? playerTankNode : aiTankNode
        var effectiveHit = hitTarget
        var damageScale: Double = 1.0
        if !effectiveHit, let target = targetNode {
            let dist = target.position.distance(to: pos)
            if dist <= weapon.blastRadius + 18 {
                effectiveHit = true
                damageScale = max(0.45, Double(1.0 - dist / (weapon.blastRadius + 30)))
            }
        }

        if effectiveHit {
            let firepowerMult = fromPlayer ? Double(GameState.shared.selectedTank.firepower) / 30.0 : 1.0
            var dmg = weapon.damage * damageScale * firepowerMult
            if targetIsPlayer {
                if playerShieldHP > 0 {
                    let absorbed = min(playerShieldHP, dmg)
                    playerShieldHP -= absorbed
                    dmg -= absorbed
                    SoundManager.shared.playSound("shield_collision.mp3")
                    if playerShieldHP <= 0 {
                        playerShieldNode?.removeFromParent()
                        playerShieldNode = nil
                    }
                }
                playerHealth = max(0, playerHealth - dmg)
                playerHealthBar?.xScale = CGFloat(playerHealth / playerMaxHealth)
                showSpeech(TrashTalkManager.shared.randomTaunt(), fromPlayer: false)
                if playerHealth <= 0 {
                    destroyTank(isPlayer: true)
                    return
                }
            } else {
                aiHealth = max(0, aiHealth - dmg)
                aiHealthBar?.xScale = CGFloat(aiHealth / aiMaxHealth)
                // WARBUX_AWARDS.TANK = 50 (weapons.balance_sheet.lua:10)
                addPotBonus(50, at: CGPoint(x: pos.x, y: pos.y + 24))
                showSpeech(TrashTalkManager.shared.randomCheer(), fromPlayer: true)
                if aiHealth <= 0 {
                    destroyTank(isPlayer: false)
                    return
                }
            }
        }

        if endsTurn {
            scheduleEndTurn(delay: 0.7)
        }
    }

    private func scheduleEndTurn(delay: TimeInterval) {
        run(SKAction.sequence([
            SKAction.wait(forDuration: delay),
            SKAction.run { [weak self] in
                self?.endTurn()
            }
        ]))
    }

    // Authentic AI Ballistic Trajectory Solver with Fudge (ai.lua:495-570, 706-710)
    private func executeAITurn() {
        guard !isProjectileActive, let aiTank = aiTankNode, let pTank = playerTankNode, let terrain = terrain else { return }
        aiTurnCount += 1

        let startPos = CGPoint(x: aiTank.position.x, y: aiTank.position.y + 6)
        let targetPos = pTank.position
        let gravity: CGFloat = -420.0
        let dt: CGFloat = 1.0 / 30.0

        var bestAngleDeg: CGFloat = 135.0
        var bestPower: CGFloat = 65.0
        var bestDist = CGFloat.greatestFiniteMagnitude

        // Simulate candidate paths across angles (110°..162°) and powers (40..90)
        for deg in stride(from: CGFloat(112.0), through: CGFloat(160.0), by: 4.0) {
            let rad = deg * .pi / 180.0
            for pwr in stride(from: CGFloat(42.0), through: CGFloat(88.0), by: 5.0) {
                let speed = pwr * 8.5
                var vx = speed * cos(rad)
                var vy = speed * sin(rad)
                var simPos = CGPoint(x: startPos.x + cos(rad) * 22, y: startPos.y + sin(rad) * 22)

                for _ in 0..<120 {
                    vx += windSpeed * dt
                    vy += gravity * dt
                    simPos.x += vx * dt
                    simPos.y += vy * dt

                    let d = simPos.distance(to: targetPos)
                    if d < bestDist {
                        bestDist = d
                        bestAngleDeg = deg
                        bestPower = pwr
                    }
                    if simPos.y <= terrain.valueAt(x: simPos.x) || simPos.x < 0 {
                        break
                    }
                }
            }
        }

        // Apply AI_SHOT_FUDGE that tightens with level and consecutive turns (ai.lua:709)
        let baseFudge = max(2.5, 9.0 - CGFloat(levelNumber) * 1.1)
        let turnAdjustedFudge = max(1.0, baseFudge - CGFloat(aiTurnCount - 1) * 1.6)
        let finalAngleDeg = max(105.0, min(168.0, bestAngleDeg + CGFloat.random(in: -turnAdjustedFudge...turnAdjustedFudge)))
        let finalPower = max(35.0, min(95.0, bestPower + CGFloat.random(in: -turnAdjustedFudge...turnAdjustedFudge)))

        aiTurret?.zRotation = finalAngleDeg * .pi / 180.0
        let aiWeapons: [WeaponType] = levelNumber >= 3 ? [.missile, .grenade, .mirv, .babyMissile] : [.babyMissile, .missile]
        let chosenWeapon = aiWeapons.randomElement() ?? .missile

        fireWeapon(fromPlayer: false, aiWeaponOverride: chosenWeapon, aiPowerOverride: finalPower)
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
        GameState.shared.lastBattlePot = battlePot

        if playerWon {
            // Award accumulated battle pot (currentBattle.lua:525, battleOverScene.lua:209)
            GameState.shared.warbux += battlePot
            GameState.shared.totalWins += 1
            GameState.shared.totalKills += 1
            GameState.shared.winStreak += 1
            if levelNumber >= GameState.shared.currentLevel && GameState.shared.currentLevel < 5 {
                GameState.shared.currentLevel = levelNumber + 1
            }
        } else {
            GameState.shared.totalLosses += 1
            GameState.shared.winStreak = 0
        }
        GameState.shared.save()

        let over = BattleOverScene(size: size)
        over.scaleMode = scaleMode
        view?.presentScene(over, transition: SKTransition.fade(withDuration: 0.5))
    }

    // MARK: - 11. Speech Bubbles (speech_small.png: 435x120 native at 0.44x scale)
    private func showSpeech(_ text: String, fromPlayer: Bool) {
        activeSpeechNode?.removeFromParent()

        let bubbleGroup = SKNode()
        let bubbleBg = TextureHelper.nativeSprite(named: "speech_small.png", scale: 0.44, fallbackColor: SKColor(white: 0.95, alpha: 0.95), fallbackSize: CGSize(width: 191, height: 53))
        bubbleBg.xScale = fromPlayer ? 1.0 : -1.0
        bubbleGroup.addChild(bubbleBg)

        let quote = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        quote.text = "\"\(text)\""
        quote.fontSize = 11.5
        quote.fontColor = SKColor(red: 98.0/255.0, green: 65.0/255.0, blue: 24.0/255.0, alpha: 1.0)
        quote.preferredMaxLayoutWidth = 155
        quote.numberOfLines = 2
        quote.verticalAlignmentMode = .center
        bubbleGroup.addChild(quote)

        let anchor = fromPlayer ? (playerAvatarNode?.position ?? CGPoint(x: 57, y: size.height - 57)) : (aiAvatarNode?.position ?? CGPoint(x: size.width - 57, y: size.height - 57))
        bubbleGroup.position = CGPoint(x: anchor.x + (fromPlayer ? 148 : -148), y: anchor.y - 6)
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
