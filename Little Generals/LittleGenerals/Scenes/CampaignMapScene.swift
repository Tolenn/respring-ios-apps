import SpriteKit

public class CampaignMapScene: SKScene {
    private var levelNodes: [SKNode] = []
    private var activeFactoryNode: SKSpriteNode?

    private var offlinePopupNode: SKNode?

    private let brownDark = SKColor(red: 98.0 / 255.0, green: 65.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)
    private let goldTrim = SKColor(red: 224.0 / 255.0, green: 140.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0)
    private let offWhite = SKColor(red: 238.0 / 255.0, green: 234.0 / 255.0, blue: 222.0 / 255.0, alpha: 1.0)

    public override func didMove(to view: SKView) {
        // Authentic vibrant cyan ocean matching Corona source (campaignMapScene.lua:161-162 RGB: 7, 180, 226)
        backgroundColor = SKColor(red: 7.0 / 255.0, green: 180.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupOceanAndContinent()
        setupOuterIslands()
        setupScreenBorder()
        setupTopHUD()
        setupGeneralAndTankBoxes()
        setupBottomBar()
        setupCampaignSectors()
    }

    private func setupOceanAndContinent() {
        // Master continent assembled from 6 beach boundary tiles (1536x874 native aspect ratio)
        let continent = TextureHelper.aspectFitSprite(
            named: "campaign_continent.png",
            maxSize: CGSize(width: size.width * 0.90, height: size.height * 0.80),
            fallbackColor: SKColor(red: 0.88, green: 0.78, blue: 0.55, alpha: 1.0)
        )
        continent.position = CGPoint(x: size.width / 2, y: size.height * 0.45)
        continent.zPosition = 1
        addChild(continent)
    }

    private func setupOuterIslands() {
        // Native island PNGs (island1: 172x95, island2: 211x108, island3: 180x80, island4: 129x76) at 0.55x scale
        let islandConfigs: [(String, CGPoint)] = [
            ("island1.png", CGPoint(x: size.width * 0.16, y: size.height * 0.75)),
            ("island2.png", CGPoint(x: size.width * 0.84, y: size.height * 0.76)),
            ("island3.png", CGPoint(x: size.width * 0.14, y: size.height * 0.22)),
            ("island4.png", CGPoint(x: size.width * 0.85, y: size.height * 0.20))
        ]

        for (name, pos) in islandConfigs {
            let sprite = TextureHelper.nativeSprite(named: name, scale: 0.55)
            sprite.position = pos
            sprite.zPosition = 2
            addChild(sprite)

            let bob = SKAction.sequence([
                SKAction.moveBy(x: 0, y: 3, duration: 1.5),
                SKAction.moveBy(x: 0, y: -3, duration: 1.5)
            ])
            sprite.run(SKAction.repeatForever(bob))
        }
    }

    private func setupScreenBorder() {
        // Authentic wood & gold border around map screen (campaignMapScene.lua:223-233)
        let outerBorder = SKShapeNode(rectOf: CGSize(width: size.width, height: size.height))
        outerBorder.fillColor = .clear
        outerBorder.strokeColor = brownDark
        outerBorder.lineWidth = 16.0
        outerBorder.position = CGPoint(x: size.width / 2, y: size.height / 2)
        outerBorder.zPosition = 15
        addChild(outerBorder)

        let innerTrim = SKShapeNode(rectOf: CGSize(width: size.width - 14, height: size.height - 14))
        innerTrim.fillColor = .clear
        innerTrim.strokeColor = goldTrim
        innerTrim.lineWidth = 3.0
        innerTrim.position = CGPoint(x: size.width / 2, y: size.height / 2)
        innerTrim.zPosition = 16
        addChild(innerTrim)
    }

    private func setupTopHUD() {
        // Authentic Top-Center Bar (campaignMapScene.lua:250-393):
        // Between top-left Avatar card (x=15..127) and top-right Tank card (x=size.width-127..size.width-15)
        let barHeight: CGFloat = 62
        let barWidth = max(420, size.width - 284)
        let barY = size.height - 15 - barHeight / 2

        let topBar = SKShapeNode(rectOf: CGSize(width: barWidth, height: barHeight), cornerRadius: 4)
        topBar.fillColor = offWhite
        topBar.strokeColor = brownDark
        topBar.lineWidth = 2.5
        topBar.position = CGPoint(x: size.width / 2, y: barY)
        topBar.zPosition = 20
        addChild(topBar)

        // Left section inside topBar: Warbux Icon (73x60 native at 0.65x) + Balance in SingleSleeve size 42
        let warbuxIcon = TextureHelper.nativeSprite(named: "warbux_icon.png", scale: 0.65, fallbackColor: .yellow, fallbackSize: CGSize(width: 47, height: 39))
        warbuxIcon.position = CGPoint(x: -barWidth / 2 + 42, y: 0)
        warbuxIcon.zPosition = 21
        topBar.addChild(warbuxIcon)

        let warbuxLabel = SKLabelNode(fontNamed: "SingleSleeve")
        warbuxLabel.text = "\(GameState.shared.warbux)"
        warbuxLabel.fontSize = 40
        warbuxLabel.fontColor = brownDark
        warbuxLabel.verticalAlignmentMode = .center
        warbuxLabel.horizontalAlignmentMode = .left
        warbuxLabel.position = CGPoint(x: -barWidth / 2 + 74, y: -2)
        warbuxLabel.zPosition = 21
        topBar.addChild(warbuxLabel)

        // Divider line inside topBar (campaignMapScene.lua:333)
        let div1 = SKShapeNode(rectOf: CGSize(width: 2, height: barHeight))
        div1.fillColor = brownDark
        div1.strokeColor = .clear
        div1.position = CGPoint(x: 20, y: 0)
        div1.zPosition = 21
        topBar.addChild(div1)

        // Multiplayer button (multiplayer_icon.png 43x42 native at 0.9x, campaignMapScene.lua:343-391)
        let mpBtn = TextureHelper.nativeSprite(named: "multiplayer_icon.png", scale: 0.9, fallbackColor: .gray, fallbackSize: CGSize(width: 39, height: 38))
        mpBtn.name = "offline_mp_btn"
        mpBtn.position = CGPoint(x: 68, y: 4)
        mpBtn.zPosition = 21
        topBar.addChild(mpBtn)

        let mpBadge = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        mpBadge.name = "offline_mp_btn"
        mpBadge.text = "OFFLINE"
        mpBadge.fontSize = 9
        mpBadge.fontColor = brownDark
        mpBadge.position = CGPoint(x: 68, y: -25)
        mpBadge.zPosition = 22
        topBar.addChild(mpBadge)

        // Game Center / Achievements icon (gamecenter_icon.png 59x58 native at 0.72x, campaignMapScene.lua:282)
        let gcBtn = TextureHelper.nativeSprite(named: "gamecenter_icon.png", scale: 0.72, fallbackColor: .clear, fallbackSize: CGSize(width: 42, height: 42))
        gcBtn.name = "offline_mp_btn"
        gcBtn.position = CGPoint(x: 132, y: 0)
        gcBtn.zPosition = 21
        topBar.addChild(gcBtn)

        // Armory shortcut button on the right side of topBar
        let armoryBtn = TextureHelper.nativeSprite(named: "weapon_normal_btn.png", scale: 0.68, fallbackColor: .orange, fallbackSize: CGSize(width: 110, height: 50))
        armoryBtn.name = "armory_btn"
        armoryBtn.position = CGPoint(x: barWidth / 2 - 68, y: 0)
        armoryBtn.zPosition = 21
        topBar.addChild(armoryBtn)

        let armoryLabel = SKLabelNode(fontNamed: "SingleSleeve")
        armoryLabel.name = "armory_btn"
        armoryLabel.text = "ARMORY"
        armoryLabel.fontSize = 22
        armoryLabel.fontColor = brownDark
        armoryLabel.verticalAlignmentMode = .center
        armoryLabel.position = armoryBtn.position
        armoryLabel.zPosition = 22
        topBar.addChild(armoryLabel)
    }

    private func setupGeneralAndTankBoxes() {
        let cardSize = CGSize(width: 112, height: 155)
        let cardY = size.height - 15 - cardSize.height / 2

        // 1. Top-Left Player General Avatar Card (campaignMapScene.lua:606-637)
        let avatarCard = SKShapeNode(rectOf: cardSize, cornerRadius: 4)
        avatarCard.fillColor = offWhite
        avatarCard.strokeColor = brownDark
        avatarCard.lineWidth = 2.5
        avatarCard.position = CGPoint(x: 15 + cardSize.width / 2, y: cardY)
        avatarCard.zPosition = 20
        addChild(avatarCard)

        let generalNode = TextureHelper.buildGeneralAvatar(isPlayer: true, scale: 0.43)
        generalNode.position = CGPoint(x: 0, y: 20)
        generalNode.zPosition = 21
        avatarCard.addChild(generalNode)

        let avatarTagBg = SKShapeNode(rectOf: CGSize(width: 96, height: 32), cornerRadius: 4)
        avatarTagBg.fillColor = SKColor(red: 0.25, green: 0.58, blue: 0.25, alpha: 1.0)
        avatarTagBg.strokeColor = brownDark
        avatarTagBg.lineWidth = 2.0
        avatarTagBg.position = CGPoint(x: 0, y: -52)
        avatarTagBg.zPosition = 21
        avatarCard.addChild(avatarTagBg)

        let avatarTag = SKLabelNode(fontNamed: "SingleSleeve")
        avatarTag.text = "GENERAL"
        avatarTag.fontSize = 22
        avatarTag.fontColor = .white
        avatarTag.verticalAlignmentMode = .center
        avatarTag.position = avatarTagBg.position
        avatarTag.zPosition = 22
        avatarCard.addChild(avatarTag)

        // 2. Top-Right Tank Depot Card (campaignMapScene.lua:586-605)
        let tankCard = SKShapeNode(rectOf: cardSize, cornerRadius: 4)
        tankCard.name = "armory_btn"
        tankCard.fillColor = offWhite
        tankCard.strokeColor = brownDark
        tankCard.lineWidth = 2.5
        tankCard.position = CGPoint(x: size.width - 15 - cardSize.width / 2, y: cardY)
        tankCard.zPosition = 20
        addChild(tankCard)

        let tankFrame = TextureHelper.nativeSprite(named: "newui_frames/frame.png", scale: 0.54)
        tankFrame.name = "armory_btn"
        tankFrame.position = CGPoint(x: 0, y: 20)
        tankFrame.zPosition = 21
        tankCard.addChild(tankFrame)

        let currentTank = GameState.shared.selectedTank
        let tankSprite = TextureHelper.aspectFitSprite(named: currentTank.textureName, maxSize: CGSize(width: 74, height: 52), fallbackColor: .green)
        tankSprite.name = "armory_btn"
        tankSprite.position = CGPoint(x: 0, y: 20)
        tankSprite.zPosition = 22
        tankCard.addChild(tankSprite)

        let tankTagBg = SKShapeNode(rectOf: CGSize(width: 96, height: 32), cornerRadius: 4)
        tankTagBg.name = "armory_btn"
        tankTagBg.fillColor = goldTrim
        tankTagBg.strokeColor = brownDark
        tankTagBg.lineWidth = 2.0
        tankTagBg.position = CGPoint(x: 0, y: -52)
        tankTagBg.zPosition = 21
        tankCard.addChild(tankTagBg)

        let tankTag = SKLabelNode(fontNamed: "SingleSleeve")
        tankTag.name = "armory_btn"
        tankTag.text = "TANKS"
        tankTag.fontSize = 24
        tankTag.fontColor = .white
        tankTag.verticalAlignmentMode = .center
        tankTag.position = tankTagBg.position
        tankTag.zPosition = 22
        tankCard.addChild(tankTag)
    }

    private func setupBottomBar() {
        // Authentic Bottom-Left Missions Button & Bottom-Right Options Button (84x90 native, campaignMapScene.lua:525-545)
        let missionsBtn = TextureHelper.nativeSprite(named: "missions_normal_btn.png", scale: 0.85, fallbackColor: .clear, fallbackSize: CGSize(width: 71, height: 76))
        missionsBtn.name = "level_\(GameState.shared.currentLevel)"
        missionsBtn.position = CGPoint(x: 15 + missionsBtn.size.width / 2, y: 15 + missionsBtn.size.height / 2)
        missionsBtn.zPosition = 20
        addChild(missionsBtn)

        let optionsBtn = TextureHelper.nativeSprite(named: "options_normal_btn.png", scale: 0.85, fallbackColor: .clear, fallbackSize: CGSize(width: 71, height: 76))
        optionsBtn.name = "armory_btn"
        optionsBtn.position = CGPoint(x: size.width - 15 - optionsBtn.size.width / 2, y: 15 + optionsBtn.size.height / 2)
        optionsBtn.zPosition = 20
        addChild(optionsBtn)

        let statsBg = SKShapeNode(rectOf: CGSize(width: 460, height: 30), cornerRadius: 6)
        statsBg.fillColor = offWhite
        statsBg.strokeColor = brownDark
        statsBg.lineWidth = 2.0
        statsBg.position = CGPoint(x: size.width / 2, y: 26)
        statsBg.zPosition = 20
        addChild(statsBg)

        let gasPct = Int(round(GameState.shared.playerGas * 100))
        let statsLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        statsLabel.text = "WINS: \(GameState.shared.totalWins)   |   KILLS: \(GameState.shared.totalKills)   |   TANK: \(GameState.shared.selectedTank.name.uppercased())   |   GAS: \(gasPct)%"
        statsLabel.fontSize = 11.5
        statsLabel.fontColor = brownDark
        statsLabel.verticalAlignmentMode = .center
        statsLabel.position = statsBg.position
        statsLabel.zPosition = 21
        addChild(statsLabel)
    }

    private func setupCampaignSectors() {
        struct SectorConfig {
            let level: Int
            let name: String
            let posNorm: CGPoint
            let landTileName: String
            let primaryFlairName: String
            let secondaryFlairName: String
            let tileOffsets: [(CGFloat, CGFloat)]
        }

        // Authentic isometric diamond countries (campaigns.lua:14-29 & campaignThemes.lua:101-228):
        // Each diamond tile is 152x76 native (`N=(-76,-38), E=(76,-38), S=(76,38), W=(-76,38)`).
        let sectors: [SectorConfig] = [
            SectorConfig(
                level: 1,
                name: "Arizona Desert",
                posNorm: CGPoint(x: 0.27, y: 0.36),
                landTileName: "campaignThemeorange_frames/orange.png",
                primaryFlairName: "mapterrain_desert_frames/cactus1.png",
                secondaryFlairName: "mapterrain_desert_frames/cactus2.png",
                tileOffsets: [(0, 0), (-1, 0), (0, -1), (1, 0)]
            ),
            SectorConfig(
                level: 2,
                name: "Great Wall Hills",
                posNorm: CGPoint(x: 0.38, y: 0.55),
                landTileName: "campaignThemegreen_frames/green.png",
                primaryFlairName: "mapterrain_hills_frames/greenhill1.png",
                secondaryFlairName: "mapterrain_hills_frames/greenhill2.png",
                tileOffsets: [(0, 0), (-1, 0), (0, 1), (1, 0)]
            ),
            SectorConfig(
                level: 3,
                name: "Arctic Tundra",
                posNorm: CGPoint(x: 0.53, y: 0.43),
                landTileName: "campaignThemesnow_frames/snow.png",
                primaryFlairName: "mapterrain_snow_frames/lrgtree.png",
                secondaryFlairName: "mapterrain_snow_frames/smtree.png",
                tileOffsets: [(0, 0), (-1, 0), (0, -1), (1, 0), (0, 1)]
            ),
            SectorConfig(
                level: 4,
                name: "Tropic Jungle",
                posNorm: CGPoint(x: 0.65, y: 0.55),
                landTileName: "campaignThemedarkgreen_frames/darkgreen.png",
                primaryFlairName: "mapterrain_jungle_frames/bigpalm.png",
                secondaryFlairName: "mapterrain_jungle_frames/smallpalm.png",
                tileOffsets: [(0, 0), (-1, 0), (0, 1), (1, 0)]
            ),
            SectorConfig(
                level: 5,
                name: "Volcano Fortress",
                posNorm: CGPoint(x: 0.74, y: 0.37),
                landTileName: "campaignThemepurple_frames/purple.png",
                primaryFlairName: "mapterrain_volcano_frames/bigvolcano.png",
                secondaryFlairName: "mapterrain_volcano_frames/smallvolcano.png",
                tileOffsets: [(0, 0), (-1, 0), (0, -1), (1, 0)]
            )
        ]

        let currentLvl = GameState.shared.currentLevel
        let tileScale: CGFloat = 0.56
        let stepX: CGFloat = 76.0 * tileScale
        let stepY: CGFloat = 38.0 * tileScale

        // 0. Player Homeland Country ("yellow.png" tiles + citysmaller.png HQ at top-center of continent, campaigns.lua:10, 42-46)
        let homelandPos = CGPoint(x: size.width * 0.49, y: size.height * 0.63)
        let homelandGroup = SKNode()
        homelandGroup.position = homelandPos
        homelandGroup.zPosition = 6
        addChild(homelandGroup)

        for (gx, gy) in [(0, 0), (-1, 0), (0, -1)] as [(CGFloat, CGFloat)] {
            let isoX = (gx - gy) * stepX
            let isoY = (gx + gy) * stepY
            let hTile = TextureHelper.nativeSprite(named: "campaignThemeyellow_frames/yellow.png", scale: tileScale)
            hTile.position = CGPoint(x: isoX, y: isoY)
            hTile.zPosition = -1
            homelandGroup.addChild(hTile)
        }

        let city = TextureHelper.nativeSprite(named: "citysmaller.png", scale: 0.36, fallbackColor: .gray, fallbackSize: CGSize(width: 72, height: 72))
        city.position = CGPoint(x: 0, y: 12)
        city.zPosition = 2
        homelandGroup.addChild(city)

        // Animated ocean jumping fish (fish_jump_frames/fish_01.png..fish_22.png, campaignMapScene.lua:455)
        let fishFrames = (1...22).map { i -> SKTexture in
            let name = String(format: "fish_jump_frames/fish_%02d.png", i)
            return TextureHelper.loadTexture(named: name, fallbackColor: .clear, size: CGSize(width: 60, height: 35))
        }
        if let firstFish = fishFrames.first {
            let fishNode = SKSpriteNode(texture: firstFish, size: CGSize(width: 60, height: 35))
            fishNode.position = CGPoint(x: size.width * 0.20, y: size.height * 0.16)
            fishNode.zPosition = 3
            addChild(fishNode)
            fishNode.run(SKAction.repeatForever(SKAction.sequence([
                SKAction.wait(forDuration: 2.0),
                SKAction.animate(with: fishFrames, timePerFrame: 0.045),
                SKAction.wait(forDuration: 3.0)
            ])))
        }

        for sector in sectors {
            let isUnlocked = sector.level <= currentLvl
            let isCompleted = sector.level < currentLvl
            let isActive = sector.level == currentLvl

            let sectorPos = CGPoint(x: size.width * sector.posNorm.x, y: size.height * sector.posNorm.y)

            let sectorGroup = SKNode()
            sectorGroup.position = sectorPos
            sectorGroup.name = "level_\(sector.level)"
            sectorGroup.zPosition = 10
            addChild(sectorGroup)

            // 1. Multi-Tile Isometric Country Cluster (campaigns.lua:14-29 & campaignThemes.lua:101-136)
            // Completed countries turn Player-owned yellow ("yellow.png"); active country is highlighted with "red.png" center tile
            for (idx, offset) in sector.tileOffsets.enumerated() {
                let (gx, gy) = offset
                let isoX = (gx - gy) * stepX
                let isoY = (gx + gy) * stepY
                let tileTexName: String
                if isCompleted {
                    tileTexName = "campaignThemeyellow_frames/yellow.png"
                } else if isActive && idx == 0 {
                    tileTexName = "campaignThemered_frames/red.png"
                } else {
                    tileTexName = sector.landTileName
                }

                let landTile = TextureHelper.nativeSprite(named: tileTexName, scale: tileScale, fallbackColor: .clear, fallbackSize: CGSize(width: 85, height: 42))
                landTile.name = "level_\(sector.level)"
                landTile.position = CGPoint(x: isoX, y: isoY - 6)
                landTile.alpha = isUnlocked ? 0.98 : 0.62
                landTile.zPosition = -2
                sectorGroup.addChild(landTile)

                // Country border line (NS_line.png 84x46 native) along N/E edges
                let borderLine = TextureHelper.nativeSprite(named: "campaignThemeassets_frames/NS_line.png", scale: tileScale)
                borderLine.name = "level_\(sector.level)"
                borderLine.position = CGPoint(x: isoX + stepX * 0.5, y: isoY + stepY * 0.5 - 6)
                borderLine.alpha = 0.75
                borderLine.zPosition = -1
                sectorGroup.addChild(borderLine)
            }

            // 2. Isometric Map Terrain Flair (res/maps/flair/*, campaignThemes.lua:138-228)
            let flair1 = TextureHelper.nativeSprite(named: sector.primaryFlairName, scale: 0.48)
            flair1.name = "level_\(sector.level)"
            flair1.position = CGPoint(x: 24, y: 12)
            flair1.alpha = isUnlocked ? 1.0 : 0.55
            flair1.zPosition = 1
            sectorGroup.addChild(flair1)

            let flair2 = TextureHelper.nativeSprite(named: sector.secondaryFlairName, scale: 0.45)
            flair2.name = "level_\(sector.level)"
            flair2.position = CGPoint(x: -36, y: -12)
            flair2.alpha = isUnlocked ? 1.0 : 0.55
            flair2.zPosition = 1
            sectorGroup.addChild(flair2)

            // 3. Military Factory Hub:
            // Active mission animates factory_frames/factory01..07.png (143x192 native at 0.34x scale),
            // Completed uses factorysmokeless.png (145x139 native at 0.34x), Locked uses brokenfactory.png (145x114 native at 0.34x)
            let hubName = isCompleted ? "factorysmokeless.png" : (isActive ? "factory_frames/factory01.png" : "brokenfactory.png")
            let hubSprite = TextureHelper.nativeSprite(named: hubName, scale: 0.34, fallbackColor: .gray, fallbackSize: CGSize(width: 49, height: 55))
            hubSprite.name = "level_\(sector.level)"
            hubSprite.position = CGPoint(x: -14, y: 10)
            hubSprite.zPosition = 2
            sectorGroup.addChild(hubSprite)

            if isActive {
                let factoryFrames = (1...7).map { i -> SKTexture in
                    let fName = String(format: "factory_frames/factory%02d.png", i)
                    return TextureHelper.loadTexture(named: fName, fallbackColor: .gray, size: CGSize(width: 143, height: 190))
                }
                hubSprite.run(SKAction.repeatForever(SKAction.animate(with: factoryFrames, timePerFrame: 0.12)))

                // bouncing attack arrow (arrowleft.png 102x80 native at 0.42x scale, campaignThemes.lua:134-136)
                let arrow = TextureHelper.nativeSprite(named: "campaignThemeassets_frames/arrowleft.png", scale: 0.42)
                arrow.name = "level_\(sector.level)"
                arrow.position = CGPoint(x: 24, y: 34)
                arrow.zPosition = 14
                sectorGroup.addChild(arrow)
                arrow.run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.moveBy(x: -4, y: -4, duration: 0.45),
                    SKAction.moveBy(x: 4, y: 4, duration: 0.45)
                ])))
            }

            // Animated smoke puffs from chimney if active
            if isActive {
                let smokeAction = SKAction.repeatForever(SKAction.sequence([
                    SKAction.run { [weak sectorGroup] in
                        guard let group = sectorGroup else { return }
                        let puff = SKShapeNode(circleOfRadius: 3.5)
                        puff.fillColor = SKColor(white: 0.9, alpha: 0.7)
                        puff.strokeColor = .clear
                        puff.position = CGPoint(x: -16, y: 16)
                        puff.zPosition = 12
                        group.addChild(puff)

                        puff.run(SKAction.sequence([
                            SKAction.group([
                                SKAction.moveBy(x: CGFloat.random(in: -5...5), y: 18, duration: 1.0),
                                SKAction.scale(to: 2.2, duration: 1.0),
                                SKAction.fadeOut(withDuration: 1.0)
                            ]),
                            SKAction.removeFromParent()
                        ]))
                    },
                    SKAction.wait(forDuration: 0.45)
                ]))
                sectorGroup.run(smokeAction)
            }

            // 3. Mission Pin / Badge Label
            let badgeBg = SKShapeNode(rectOf: CGSize(width: 82, height: 20), cornerRadius: 4)
            badgeBg.name = "level_\(sector.level)"
            badgeBg.fillColor = isActive ? SKColor(red: 0.85, green: 0.65, blue: 0.15, alpha: 0.92) : (isCompleted ? SKColor(white: 0.2, alpha: 0.8) : SKColor(white: 0.1, alpha: 0.5))
            badgeBg.strokeColor = isActive ? .white : .clear
            badgeBg.lineWidth = 1.0
            badgeBg.position = CGPoint(x: 0, y: -22)
            sectorGroup.addChild(badgeBg)

            let badgeText = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
            badgeText.name = "level_\(sector.level)"
            badgeText.text = isCompleted ? "★ \(sector.name.uppercased())" : (isActive ? "▶ MISSION \(sector.level)" : "🔒 MISSION \(sector.level)")
            badgeText.fontSize = 8.5
            badgeText.fontColor = .white
            badgeText.verticalAlignmentMode = .center
            badgeText.position = CGPoint(x: 0, y: -22)
            badgeText.zPosition = 11
            sectorGroup.addChild(badgeText)

            levelNodes.append(sectorGroup)
        }
    }

    private func showOfflineNotice() {
        offlinePopupNode?.removeFromParent()

        let overlay = SKNode()
        overlay.zPosition = 100

        let bg = SKSpriteNode(color: SKColor(white: 0.0, alpha: 0.65), size: size)
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bg.name = "close_offline_popup"
        overlay.addChild(bg)

        let box = TextureHelper.nativeSprite(named: "popup_box.png", scale: 0.72, fallbackColor: SKColor(white: 0.15, alpha: 0.95), fallbackSize: CGSize(width: 448, height: 290))
        box.position = CGPoint(x: size.width / 2, y: size.height / 2)
        overlay.addChild(box)

        let title = SKLabelNode(fontNamed: "SingleSleeve")
        title.text = "Offline Restoration Mode"
        title.fontSize = 30
        title.fontColor = brownDark
        title.position = CGPoint(x: 0, y: 78)
        box.addChild(title)

        let lines = [
            "Online Multiplayer, OpenFeint, Push Notifications,",
            "and IAP servers (little-generals.com) are retired.",
            "All 5 Campaign Themes, 18 Tanks, and 19 Weapons",
            "are 100% unlockable offline using Warbux!"
        ]
        for (idx, line) in lines.enumerated() {
            let lbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
            lbl.text = line
            lbl.fontSize = 13.5
            lbl.fontColor = brownDark
            lbl.position = CGPoint(x: 0, y: 34 - CGFloat(idx) * 24)
            box.addChild(lbl)
        }

        let okBtn = TextureHelper.nativeSprite(named: "accept_normal_btn.png", scale: 0.80, fallbackColor: .green, fallbackSize: CGSize(width: 67, height: 72))
        okBtn.name = "close_offline_popup"
        okBtn.position = CGPoint(x: 0, y: -88)
        box.addChild(okBtn)

        addChild(overlay)
        offlinePopupNode = overlay
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let hitNodes = nodes(at: location)

        if offlinePopupNode != nil {
            if hitNodes.contains(where: { $0.name == "close_offline_popup" }) {
                SoundManager.shared.playSound("button1.mp3")
                offlinePopupNode?.removeFromParent()
                offlinePopupNode = nil
            }
            return
        }

        for node in hitNodes {
            if node.name == "offline_mp_btn" {
                SoundManager.shared.playSound("button1.mp3")
                showOfflineNotice()
                return
            }

            if node.name == "armory_btn" {
                SoundManager.shared.playSound("button1.mp3")
                let armory = ArmoryScene(size: size)
                armory.scaleMode = scaleMode
                view?.presentScene(armory, transition: SKTransition.push(with: .left, duration: 0.3))
                return
            }

            if let name = node.name, name.hasPrefix("level_") {
                let lvlStr = name.replacingOccurrences(of: "level_", with: "")
                if let lvl = Int(lvlStr) {
                    if lvl <= GameState.shared.currentLevel {
                        SoundManager.shared.playSound("weapon_select.mp3")
                        launchBattle(level: lvl)
                    } else {
                        SoundManager.shared.playSound("shield_collision.mp3")
                    }
                    return
                }
            }
        }
    }

    private func launchBattle(level: Int) {
        SoundManager.shared.stopMusic()
        let battleScene = BattlefieldScene(size: size)
        battleScene.levelNumber = level
        battleScene.scaleMode = scaleMode
        let transition = SKTransition.doorway(withDuration: 0.6)
        view?.presentScene(battleScene, transition: transition)
    }
}
