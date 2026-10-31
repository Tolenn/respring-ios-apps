import UIKit
import SpriteKit

public class CampaignMapScene: SKScene {
    private var activeFactoryNode: SKSpriteNode?
    private var redArrowNode: SKNode?
    private var moneyCollectNode: SKNode?
    private var tutorialBannerLabel: SKLabelNode?
    private var warbuxLabel: SKLabelNode?
    private var offlinePopupNode: SKNode?
    private var hasCollectedWarbux: Bool = false

    private let brownDark = SKColor(red: 98.0 / 255.0, green: 65.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)
    private let goldTrim = SKColor(red: 224.0 / 255.0, green: 140.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0)
    private let offWhite = SKColor(red: 238.0 / 255.0, green: 234.0 / 255.0, blue: 222.0 / 255.0, alpha: 1.0)

    public override func didMove(to view: SKView) {
        // Authentic ocean background
        backgroundColor = SKColor(red: 7.0 / 255.0, green: 180.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupTerritoryMap()
        setupScreenBorder()
        setupTopHUD()
        setupGeneralAndTankBoxes()
        setupBottomHUD()
    }

    // MARK: - 1. Full-Screen Authentic Continental Territory Map (campaignThemes.lua & campaigns.lua)
    private func setupTerritoryMap() {
        let mapContainer = SKNode()
        mapContainer.zPosition = 1
        addChild(mapContainer)

        let w = size.width
        let h = size.height

        // Define authentic territory polygon regions covering the entire scene (matching target screenshot)
        struct TerritoryDef {
            let id: Int
            let name: String
            let color: SKColor
            let points: [CGPoint]
            let center: CGPoint
        }

        let territories: [TerritoryDef] = [
            // 1. Center Homeland (Bright Yellow) with Capital City
            TerritoryDef(
                id: 0,
                name: "Homeland",
                color: SKColor(red: 245.0/255.0, green: 185.0/255.0, blue: 20.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: w * 0.40, y: h * 0.62),
                    CGPoint(x: w * 0.54, y: h * 0.66),
                    CGPoint(x: w * 0.65, y: h * 0.56),
                    CGPoint(x: w * 0.62, y: h * 0.42),
                    CGPoint(x: w * 0.54, y: h * 0.36),
                    CGPoint(x: w * 0.42, y: h * 0.38),
                    CGPoint(x: w * 0.36, y: h * 0.48)
                ],
                center: CGPoint(x: w * 0.50, y: h * 0.49)
            ),
            // 2. North-West Forest / Industrial Territory (Deep Forest Green)
            TerritoryDef(
                id: 2,
                name: "Great Wall Hills",
                color: SKColor(red: 45.0/255.0, green: 90.0/255.0, blue: 39.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: 0, y: h),
                    CGPoint(x: w * 0.42, y: h),
                    CGPoint(x: w * 0.40, y: h * 0.70),
                    CGPoint(x: w * 0.36, y: h * 0.64),
                    CGPoint(x: w * 0.22, y: h * 0.68),
                    CGPoint(x: 0, y: h * 0.78)
                ],
                center: CGPoint(x: w * 0.22, y: h * 0.82)
            ),
            // 3. Mid-West Plains Territory (Bright Green)
            TerritoryDef(
                id: 4,
                name: "Jungle Plains",
                color: SKColor(red: 132.0/255.0, green: 169.0/255.0, blue: 52.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: 0, y: h * 0.78),
                    CGPoint(x: w * 0.22, y: h * 0.68),
                    CGPoint(x: w * 0.36, y: h * 0.48),
                    CGPoint(x: w * 0.42, y: h * 0.38),
                    CGPoint(x: w * 0.32, y: h * 0.30),
                    CGPoint(x: w * 0.16, y: h * 0.32),
                    CGPoint(x: 0, y: h * 0.45)
                ],
                center: CGPoint(x: w * 0.18, y: h * 0.50)
            ),
            // 4. North Winding River (Cyan-Blue Water)
            TerritoryDef(
                id: 99,
                name: "Northern River",
                color: SKColor(red: 2.0/255.0, green: 132.0/255.0, blue: 199.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: w * 0.42, y: h),
                    CGPoint(x: w * 0.62, y: h),
                    CGPoint(x: w * 0.58, y: h * 0.82),
                    CGPoint(x: w * 0.48, y: h * 0.78),
                    CGPoint(x: w * 0.54, y: h * 0.66),
                    CGPoint(x: w * 0.40, y: h * 0.62),
                    CGPoint(x: w * 0.36, y: h * 0.64),
                    CGPoint(x: w * 0.40, y: h * 0.70)
                ],
                center: CGPoint(x: w * 0.50, y: h * 0.84)
            ),
            // 5. East & North-East Desert Territory (Warm Orange-Gold) with Cacti & Factory
            TerritoryDef(
                id: 1,
                name: "Arizona Desert",
                color: SKColor(red: 217.0/255.0, green: 119.0/255.0, blue: 6.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: w * 0.62, y: h),
                    CGPoint(x: w, y: h),
                    CGPoint(x: w, y: h * 0.52),
                    CGPoint(x: w * 0.82, y: h * 0.56),
                    CGPoint(x: w * 0.65, y: h * 0.56),
                    CGPoint(x: w * 0.54, y: h * 0.66),
                    CGPoint(x: w * 0.48, y: h * 0.78),
                    CGPoint(x: w * 0.58, y: h * 0.82)
                ],
                center: CGPoint(x: w * 0.76, y: h * 0.72)
            ),
            // 6. South-East Volcanic Territory (Dark Purple-Grey) with Mini-Volcanoes
            TerritoryDef(
                id: 5,
                name: "Volcano Peak",
                color: SKColor(red: 92.0/255.0, green: 84.0/255.0, blue: 112.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: w * 0.65, y: h * 0.56),
                    CGPoint(x: w * 0.82, y: h * 0.56),
                    CGPoint(x: w, y: h * 0.52),
                    CGPoint(x: w, y: h * 0.22),
                    CGPoint(x: w * 0.80, y: h * 0.18),
                    CGPoint(x: w * 0.66, y: h * 0.32),
                    CGPoint(x: w * 0.62, y: h * 0.42)
                ],
                center: CGPoint(x: w * 0.78, y: h * 0.38)
            ),
            // 7. South Jungle Territory (Deep Dark Green) with Palm Trees
            TerritoryDef(
                id: 3,
                name: "Arctic Tundra",
                color: SKColor(red: 30.0/255.0, green: 69.0/255.0, blue: 29.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: w * 0.62, y: h * 0.42),
                    CGPoint(x: w * 0.66, y: h * 0.32),
                    CGPoint(x: w * 0.80, y: h * 0.18),
                    CGPoint(x: w, y: h * 0.22),
                    CGPoint(x: w, y: 0),
                    CGPoint(x: w * 0.45, y: 0),
                    CGPoint(x: w * 0.48, y: h * 0.22),
                    CGPoint(x: w * 0.54, y: h * 0.36)
                ],
                center: CGPoint(x: w * 0.68, y: h * 0.15)
            ),
            // 8. South-West Forest Territory (Medium Pine Green)
            TerritoryDef(
                id: 4,
                name: "Jungle Basin",
                color: SKColor(red: 45.0/255.0, green: 90.0/255.0, blue: 39.0/255.0, alpha: 1.0),
                points: [
                    CGPoint(x: 0, y: h * 0.45),
                    CGPoint(x: w * 0.16, y: h * 0.32),
                    CGPoint(x: w * 0.32, y: h * 0.30),
                    CGPoint(x: w * 0.42, y: h * 0.38),
                    CGPoint(x: w * 0.54, y: h * 0.36),
                    CGPoint(x: w * 0.48, y: h * 0.22),
                    CGPoint(x: w * 0.45, y: 0),
                    CGPoint(x: 0, y: 0)
                ],
                center: CGPoint(x: w * 0.25, y: h * 0.18)
            )
        ]

        // Draw each territory polygon with crisp white border
        for terr in territories {
            let path = CGMutablePath()
            guard let firstPt = terr.points.first else { continue }
            path.move(to: firstPt)
            for pt in terr.points.dropFirst() {
                path.addLine(to: pt)
            }
            path.closeSubpath()

            let shape = SKShapeNode(path: path)
            shape.fillColor = terr.color
            shape.strokeColor = .white
            shape.lineWidth = 3.5
            shape.zPosition = 2
            if terr.id > 0 && terr.id < 99 {
                shape.name = "level_\(terr.id)"
            }
            mapContainer.addChild(shape)
        }

        // --- MAP FLAIR & PROPS (matching target screenshot) ---
        // 1. Capitol Building in yellow Homeland center
        let capitol = TextureHelper.nativeSprite(named: "res/maps/citysmaller.png", scale: 0.85, fallbackColor: .clear, fallbackSize: CGSize(width: 140, height: 110))
        capitol.name = "collect_warbux"
        capitol.position = CGPoint(x: w * 0.50, y: h * 0.49)
        capitol.zPosition = 5
        mapContainer.addChild(capitol)

        // 2. Green Warbux Collection Icon on Capitol Building
        let moneyStack = TextureHelper.nativeSprite(named: "res/ui/money_collection.png", scale: 0.85, fallbackColor: .green, fallbackSize: CGSize(width: 48, height: 42))
        moneyStack.name = "collect_warbux"
        moneyStack.position = CGPoint(x: w * 0.555, y: h * 0.485)
        moneyStack.zPosition = 6
        mapContainer.addChild(moneyStack)
        self.moneyCollectNode = moneyStack

        // Bouncing pulse on money stack icon
        let pulse = SKAction.repeatForever(SKAction.sequence([
            SKAction.scale(to: 0.95, duration: 0.6),
            SKAction.scale(to: 0.80, duration: 0.6)
        ]))
        moneyStack.run(pulse)

        // 3. Giant Red Arrow pointing down at Capitol building
        let redArrow = TextureHelper.nativeSprite(named: "select_arrow.png", scale: 1.6, fallbackColor: .red, fallbackSize: CGSize(width: 60, height: 75))
        redArrow.color = SKColor(red: 220.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        redArrow.colorBlendFactor = 0.95
        redArrow.zRotation = .pi // pointing down
        redArrow.position = CGPoint(x: w * 0.54, y: h * 0.69)
        redArrow.zPosition = 7
        mapContainer.addChild(redArrow)
        self.redArrowNode = redArrow

        let arrowBob = SKAction.repeatForever(SKAction.sequence([
            SKAction.moveBy(x: 0, y: -14, duration: 0.45),
            SKAction.moveBy(x: 0, y: 14, duration: 0.45)
        ]))
        redArrow.run(arrowBob)

        // 4. Curved Yellow/Gold Attack Arrows pointing outward from Homeland
        let arrowConfigs: [(x: CGFloat, y: CGFloat, rot: CGFloat, lvl: Int)] = [
            (w * 0.38, h * 0.48, .pi * 0.85, 4),   // Arrow to West plains
            (w * 0.48, h * 0.38, -.pi * 0.5, 3),   // Arrow to South jungle
            (w * 0.63, h * 0.48, -.pi * 0.15, 1),  // Arrow to East desert
            (w * 0.53, h * 0.58, .pi * 0.25, 2)    // Arrow to North-East
        ]
        for cfg in arrowConfigs {
            let yArrow = TextureHelper.nativeSprite(named: "select_arrow.png", scale: 0.9, fallbackColor: .yellow, fallbackSize: CGSize(width: 45, height: 50))
            yArrow.color = SKColor(red: 235.0/255.0, green: 165.0/255.0, blue: 25.0/255.0, alpha: 1.0)
            yArrow.colorBlendFactor = 0.95
            yArrow.zRotation = cfg.rot
            yArrow.name = "level_\(cfg.lvl)"
            yArrow.position = CGPoint(x: cfg.x, y: cfg.y)
            yArrow.zPosition = 5
            mapContainer.addChild(yArrow)
        }

        // 5. Desert Saguaro Cacti (cactus1.png, cactus2.png)
        let desertCacti: [(x: CGFloat, y: CGFloat, name: String, scale: CGFloat)] = [
            (w * 0.18, h * 0.68, "mapterrain_desert_frames/cactus1.png", 0.65),
            (w * 0.33, h * 0.72, "mapterrain_desert_frames/cactus2.png", 0.60),
            (w * 0.67, h * 0.63, "mapterrain_desert_frames/cactus1.png", 0.65),
            (w * 0.83, h * 0.69, "mapterrain_desert_frames/cactus2.png", 0.65),
            (w * 0.96, h * 0.62, "mapterrain_desert_frames/cactus1.png", 0.60)
        ]
        for item in desertCacti {
            let cactus = TextureHelper.nativeSprite(named: item.name, scale: item.scale, fallbackColor: .clear)
            cactus.position = CGPoint(x: item.x, y: item.y)
            cactus.zPosition = 4
            mapContainer.addChild(cactus)
        }

        // 6. Factories & Mystery Badges
        let f1 = TextureHelper.nativeSprite(named: "res/maps/factory.png", scale: 0.65, fallbackColor: .clear)
        f1.name = "level_2"
        f1.position = CGPoint(x: w * 0.23, y: h * 0.88)
        f1.zPosition = 4
        mapContainer.addChild(f1)

        let f2 = TextureHelper.nativeSprite(named: "res/maps/factory.png", scale: 0.65, fallbackColor: .clear)
        f2.name = "level_1"
        f2.position = CGPoint(x: w * 0.82, y: h * 0.90)
        f2.zPosition = 4
        mapContainer.addChild(f2)

        // Authentic Mystery Question Mark Badge on Desert Territory (question.png, campaignMapScene.lua)
        let qBadge = TextureHelper.nativeSprite(named: "res/ui/question.png", scale: 0.75, fallbackColor: .clear, fallbackSize: CGSize(width: 27, height: 51))
        qBadge.name = "level_1"
        qBadge.position = CGPoint(x: w * 0.83, y: h * 0.52)
        qBadge.zPosition = 5
        mapContainer.addChild(qBadge)

        let qBob = SKAction.repeatForever(SKAction.sequence([
            SKAction.moveBy(x: 0, y: 3.5, duration: 0.7),
            SKAction.moveBy(x: 0, y: -3.5, duration: 0.7)
        ]))
        qBadge.run(qBob)

        // 7. Volcanoes in South-East Purple Territory
        let vol1 = TextureHelper.nativeSprite(named: "mapterrain_volcano_frames/bigvolcano.png", scale: 0.60, fallbackColor: .clear)
        vol1.position = CGPoint(x: w * 0.62, y: h * 0.29)
        vol1.zPosition = 4
        mapContainer.addChild(vol1)

        let vol2 = TextureHelper.nativeSprite(named: "mapterrain_volcano_frames/smallvolcano.png", scale: 0.55, fallbackColor: .clear)
        vol2.position = CGPoint(x: w * 0.67, y: h * 0.28)
        vol2.zPosition = 4
        mapContainer.addChild(vol2)

        // 8. Palm Trees in South Dark-Green Jungle Territory
        let palm1 = TextureHelper.nativeSprite(named: "mapterrain_jungle_frames/bigpalm.png", scale: 0.65, fallbackColor: .clear)
        palm1.position = CGPoint(x: w * 0.50, y: h * 0.24)
        palm1.zPosition = 4
        mapContainer.addChild(palm1)

        let palm2 = TextureHelper.nativeSprite(named: "mapterrain_jungle_frames/smallpalm.png", scale: 0.60, fallbackColor: .clear)
        palm2.position = CGPoint(x: w * 0.18, y: h * 0.24)
        palm2.zPosition = 4
        mapContainer.addChild(palm2)

        // 9. Pine Trees with Snow in North-West & South-West
        let pine1 = TextureHelper.nativeSprite(named: "mapterrain_snow_frames/lrgtree.png", scale: 0.60, fallbackColor: .clear)
        pine1.position = CGPoint(x: w * 0.27, y: h * 0.79)
        pine1.zPosition = 4
        mapContainer.addChild(pine1)

        let pine2 = TextureHelper.nativeSprite(named: "mapterrain_snow_frames/smtree.png", scale: 0.55, fallbackColor: .clear)
        pine2.position = CGPoint(x: w * 0.60, y: h * 0.23)
        pine2.zPosition = 4
        mapContainer.addChild(pine2)
    }

    // MARK: - 2. Screen Border Outline
    private func setupScreenBorder() {
        let outerBorder = SKShapeNode(rectOf: CGSize(width: size.width, height: size.height))
        outerBorder.fillColor = .clear
        outerBorder.strokeColor = brownDark
        outerBorder.lineWidth = 14.0
        outerBorder.position = CGPoint(x: size.width / 2, y: size.height / 2)
        outerBorder.zPosition = 15
        addChild(outerBorder)

        let innerTrim = SKShapeNode(rectOf: CGSize(width: size.width - 12, height: size.height - 12))
        innerTrim.fillColor = .clear
        innerTrim.strokeColor = goldTrim
        innerTrim.lineWidth = 2.5
        innerTrim.position = CGPoint(x: size.width / 2, y: size.height / 2)
        innerTrim.zPosition = 16
        addChild(innerTrim)
    }

    // MARK: - 3. Top HUD: Avatar Card, Center Cash/MP Bar, Tanks Card (Matching Target Screenshot)
    private func setupTopHUD() {
        let barHeight: CGFloat = 52
        let barWidth: CGFloat = 340
        let barY = size.height - 15 - barHeight / 2

        // Top-Center Rounded Cream Bar
        let topBar = SKShapeNode(rectOf: CGSize(width: barWidth, height: barHeight), cornerRadius: 4)
        topBar.fillColor = offWhite
        topBar.strokeColor = brownDark
        topBar.lineWidth = 2.5
        topBar.position = CGPoint(x: size.width / 2, y: barY)
        topBar.zPosition = 20
        addChild(topBar)

        // Left: Warbux Cash Stack Icon
        let warbuxIcon = TextureHelper.nativeSprite(named: "warbux_icon.png", scale: 0.70, fallbackColor: .green, fallbackSize: CGSize(width: 48, height: 40))
        warbuxIcon.position = CGPoint(x: -barWidth / 2 + 40, y: 0)
        warbuxIcon.zPosition = 21
        topBar.addChild(warbuxIcon)

        // Center: Warbux Balance
        let warbuxVal = SKLabelNode(fontNamed: "SingleSleeve")
        warbuxVal.text = "\(GameState.shared.warbux)"
        warbuxVal.fontSize = 38
        warbuxVal.fontColor = brownDark
        warbuxVal.verticalAlignmentMode = .center
        warbuxVal.horizontalAlignmentMode = .right
        warbuxVal.position = CGPoint(x: 45, y: -2)
        warbuxVal.zPosition = 21
        topBar.addChild(warbuxVal)
        self.warbuxLabel = warbuxVal

        // Right: Divider & 2-People Multiplayer Icon
        let div = SKShapeNode(rectOf: CGSize(width: 2.0, height: barHeight - 4))
        div.fillColor = brownDark
        div.strokeColor = .clear
        div.position = CGPoint(x: 90, y: 0)
        div.zPosition = 21
        topBar.addChild(div)

        let mpBtn = TextureHelper.nativeSprite(named: "multiplayer_icon.png", scale: 0.90, fallbackColor: .gray, fallbackSize: CGSize(width: 38, height: 38))
        mpBtn.name = "offline_mp_btn"
        mpBtn.position = CGPoint(x: 130, y: 0)
        mpBtn.zPosition = 21
        topBar.addChild(mpBtn)
    }

    private func setupGeneralAndTankBoxes() {
        let cardSize = CGSize(width: 98, height: 124)
        let cardY = size.height - 15 - cardSize.height / 2

        // --- 1. Top-Left General Avatar Card with "AVATAR" Tab ---
        let avatarCard = SKShapeNode(rectOf: cardSize, cornerRadius: 3)
        avatarCard.fillColor = offWhite
        avatarCard.strokeColor = brownDark
        avatarCard.lineWidth = 2.5
        avatarCard.position = CGPoint(x: 15 + cardSize.width / 2, y: cardY)
        avatarCard.zPosition = 20
        addChild(avatarCard)

        let generalPortrait = TextureHelper.buildGeneralAvatar(isPlayer: true, scale: 0.38)
        generalPortrait.position = CGPoint(x: 0, y: 15)
        generalPortrait.zPosition = 21
        avatarCard.addChild(generalPortrait)

        let avatarTab = SKShapeNode(rectOf: CGSize(width: cardSize.width, height: 28), cornerRadius: 2)
        avatarTab.fillColor = SKColor(red: 224.0/255.0, green: 140.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        avatarTab.strokeColor = brownDark
        avatarTab.lineWidth = 2.0
        avatarTab.position = CGPoint(x: 0, y: -cardSize.height / 2 + 14)
        avatarTab.zPosition = 21
        avatarCard.addChild(avatarTab)

        let avatarLabel = SKLabelNode(fontNamed: "SingleSleeve")
        avatarLabel.text = "AVATAR"
        avatarLabel.fontSize = 18
        avatarLabel.fontColor = .white
        avatarLabel.verticalAlignmentMode = .center
        avatarLabel.position = .zero
        avatarLabel.zPosition = 22
        avatarTab.addChild(avatarLabel)

        // --- 2. Top-Right Tank Card with "TANKS" Tab ---
        let tankCard = SKShapeNode(rectOf: cardSize, cornerRadius: 3)
        tankCard.fillColor = offWhite
        tankCard.strokeColor = brownDark
        tankCard.lineWidth = 2.5
        tankCard.name = "armory_btn"
        tankCard.position = CGPoint(x: size.width - 15 - cardSize.width / 2, y: cardY)
        tankCard.zPosition = 20
        addChild(tankCard)

        let tankSprite = TextureHelper.nativeSprite(named: GameState.shared.selectedTank.textureName, scale: 0.42, fallbackColor: .green, fallbackSize: CGSize(width: 74, height: 50))
        tankSprite.name = "armory_btn"
        tankSprite.position = CGPoint(x: 0, y: 16)
        tankSprite.zPosition = 21
        tankCard.addChild(tankSprite)

        let tankTab = SKShapeNode(rectOf: CGSize(width: cardSize.width, height: 28), cornerRadius: 2)
        tankTab.fillColor = SKColor(red: 224.0/255.0, green: 140.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        tankTab.strokeColor = brownDark
        tankTab.lineWidth = 2.0
        tankTab.name = "armory_btn"
        tankTab.position = CGPoint(x: 0, y: -cardSize.height / 2 + 14)
        tankTab.zPosition = 21
        tankCard.addChild(tankTab)

        let tankLabel = SKLabelNode(fontNamed: "SingleSleeve")
        tankLabel.text = "TANKS"
        tankLabel.fontSize = 18
        tankLabel.fontColor = .white
        tankLabel.verticalAlignmentMode = .center
        tankLabel.position = .zero
        tankLabel.zPosition = 22
        tankTab.addChild(tankLabel)
    }

    // MARK: - 4. Bottom HUD: Missions, Options & Authentic Tutorial Prompt Banner
    private func setupBottomHUD() {
        // Bottom-Left Round Clipboard Missions Button
        let missionsBtn = TextureHelper.nativeSprite(named: "missions_normal_btn.png", scale: 0.85, fallbackColor: .clear, fallbackSize: CGSize(width: 71, height: 76))
        missionsBtn.name = "level_\(GameState.shared.currentLevel)"
        missionsBtn.position = CGPoint(x: 20 + missionsBtn.size.width / 2, y: 16 + missionsBtn.size.height / 2)
        missionsBtn.zPosition = 20
        addChild(missionsBtn)

        // Bottom-Right Round Options Gear Button
        let optionsBtn = TextureHelper.nativeSprite(named: "options_normal_btn.png", scale: 0.85, fallbackColor: .clear, fallbackSize: CGSize(width: 71, height: 76))
        optionsBtn.name = "armory_btn"
        optionsBtn.position = CGPoint(x: size.width - 20 - optionsBtn.size.width / 2, y: 16 + optionsBtn.size.height / 2)
        optionsBtn.zPosition = 20
        addChild(optionsBtn)

        // Center Large Cream Tutorial Banner: "CLICK THE [money] ICON TO COLLECT WARBUX!"
        let bannerW: CGFloat = min(580, size.width - 220)
        let bannerH: CGFloat = 58
        let banner = SKShapeNode(rectOf: CGSize(width: bannerW, height: bannerH), cornerRadius: 4)
        banner.fillColor = SKColor(red: 251.0/255.0, green: 240.0/255.0, blue: 221.0/255.0, alpha: 1.0)
        banner.strokeColor = brownDark
        banner.lineWidth = 3.0
        banner.position = CGPoint(x: size.width / 2, y: 16 + bannerH / 2)
        banner.zPosition = 20
        addChild(banner)

        let bannerLabel = SKLabelNode(fontNamed: "SingleSleeve")
        bannerLabel.text = "CLICK THE   💵   ICON TO COLLECT WARBUX!"
        bannerLabel.fontSize = 24
        bannerLabel.fontColor = brownDark
        bannerLabel.verticalAlignmentMode = .center
        bannerLabel.position = .zero
        bannerLabel.zPosition = 21
        banner.addChild(bannerLabel)
        self.tutorialBannerLabel = bannerLabel
    }

    // MARK: - 5. Touch Handling & Interactivity
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
            if node.name == "collect_warbux" {
                collectWarbux(at: location)
                return
            }

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
                    SoundManager.shared.playSound("weapon_select.mp3")
                    launchBattle(level: lvl)
                    return
                }
            }
        }
    }

    private func collectWarbux(at pos: CGPoint) {
        guard !hasCollectedWarbux else { return }
        hasCollectedWarbux = true

        SoundManager.shared.playSound("kaching.mp3")
        GameState.shared.warbux += 100
        warbuxLabel?.text = "\(GameState.shared.warbux)"

        // Floating +$100 popup
        let pop = SKLabelNode(fontNamed: "SingleSleeve")
        pop.text = "+$100"
        pop.fontSize = 26
        pop.fontColor = SKColor(red: 0.2, green: 0.85, blue: 0.2, alpha: 1.0)
        pop.position = CGPoint(x: size.width * 0.55, y: size.height * 0.54)
        pop.zPosition = 30
        addChild(pop)

        pop.run(SKAction.sequence([
            SKAction.group([
                SKAction.moveBy(x: 0, y: 40, duration: 0.8),
                SKAction.fadeOut(withDuration: 0.8)
            ]),
            SKAction.removeFromParent()
        ]))

        // Fade out red arrow & money stack
        redArrowNode?.run(SKAction.sequence([
            SKAction.fadeOut(withDuration: 0.3),
            SKAction.removeFromParent()
        ]))
        redArrowNode = nil

        moneyCollectNode?.run(SKAction.sequence([
            SKAction.scale(to: 1.3, duration: 0.2),
            SKAction.fadeOut(withDuration: 0.2),
            SKAction.removeFromParent()
        ]))
        moneyCollectNode = nil

        // Advance tutorial banner to attack prompt
        tutorialBannerLabel?.text = "SELECT AN ENEMY TERRITORY TO ATTACK!"
    }

    private func showOfflineNotice() {
        let overlay = SKNode()
        overlay.zPosition = 100
        overlay.name = "close_offline_popup"

        let scrim = SKShapeNode(rectOf: size)
        scrim.fillColor = SKColor(white: 0, alpha: 0.5)
        scrim.strokeColor = .clear
        scrim.position = CGPoint(x: size.width / 2, y: size.height / 2)
        scrim.name = "close_offline_popup"
        overlay.addChild(scrim)

        let pop = SKShapeNode(rectOf: CGSize(width: 440, height: 200), cornerRadius: 10)
        pop.fillColor = offWhite
        pop.strokeColor = brownDark
        pop.lineWidth = 3.0
        pop.position = CGPoint(x: size.width / 2, y: size.height / 2)
        pop.name = "close_offline_popup"
        overlay.addChild(pop)

        let title = SKLabelNode(fontNamed: "SingleSleeve")
        title.text = "OFFLINE PORT NOTICE"
        title.fontSize = 26
        title.fontColor = brownDark
        title.position = CGPoint(x: 0, y: 50)
        pop.addChild(title)

        let body = SKLabelNode(fontNamed: "HelveticaNeue")
        body.text = "Multiplayer servers were decommissioned.\nSingle player campaign and skirmish are fully restored!"
        body.fontSize = 13.5
        body.numberOfLines = 2
        body.fontColor = brownDark
        body.position = CGPoint(x: 0, y: -5)
        pop.addChild(body)

        let okLabel = SKLabelNode(fontNamed: "SingleSleeve")
        okLabel.text = "TAP TO CLOSE"
        okLabel.fontSize = 20
        okLabel.fontColor = goldTrim
        okLabel.position = CGPoint(x: 0, y: -65)
        pop.addChild(okLabel)

        addChild(overlay)
        self.offlinePopupNode = overlay
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
