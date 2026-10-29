import SpriteKit

public class CampaignMapScene: SKScene {
    private var levelNodes: [SKNode] = []
    private var activeFactoryNode: SKSpriteNode?

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.14, green: 0.38, blue: 0.58, alpha: 1.0)
        
        // Start authentic campaign march music
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupMapBackground()
        setupTopHUD()
        setupCampaignSectors()
    }

    private func setupMapBackground() {
        // Authentic archipelago islands map backdrop (campaignTheme1islands.png)
        let mapTex = TextureHelper.loadTexture(named: "campaignTheme1islands.png", fallbackColor: SKColor(red: 0.16, green: 0.42, blue: 0.62, alpha: 1.0), size: size)
        let mapNode = SKSpriteNode(texture: mapTex)
        mapNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        mapNode.size = size
        mapNode.zPosition = -10
        addChild(mapNode)

        // Coastal beach accents (campaignTheme1beach1.png ... beach5.png)
        let beachPositions: [(String, CGPoint, CGSize)] = [
            ("campaignTheme1beach1.png", CGPoint(x: size.width * 0.22, y: size.height * 0.45), CGSize(width: 140, height: 90)),
            ("campaignTheme1beach2.png", CGPoint(x: size.width * 0.52, y: size.height * 0.65), CGSize(width: 160, height: 100)),
            ("campaignTheme1beach3.png", CGPoint(x: size.width * 0.78, y: size.height * 0.35), CGSize(width: 150, height: 95))
        ]

        for (beachName, pos, bSize) in beachPositions {
            let bTex = TextureHelper.loadTexture(named: beachName, fallbackColor: .clear, size: bSize)
            let bSprite = SKSpriteNode(texture: bTex, size: bSize)
            bSprite.position = pos
            bSprite.alpha = 0.85
            bSprite.zPosition = -8
            addChild(bSprite)
        }

        // Animated ocean grid lines
        let grid = SKShapeNode()
        let path = CGMutablePath()
        for y in stride(from: 0, to: size.height, by: 45) {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: size.width, y: y))
        }
        for x in stride(from: 0, to: size.width, by: 45) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: size.height))
        }
        grid.path = path
        grid.strokeColor = SKColor(white: 1.0, alpha: 0.06)
        grid.lineWidth = 1.0
        grid.zPosition = -5
        addChild(grid)
    }

    private func setupTopHUD() {
        // Metallic Top Header Banner
        let bannerTex = TextureHelper.loadTexture(named: "controlbar_back.png", fallbackColor: SKColor(white: 0.1, alpha: 0.9), size: CGSize(width: size.width, height: 56))
        let banner = SKSpriteNode(texture: bannerTex, size: CGSize(width: size.width, height: 56))
        banner.position = CGPoint(x: size.width / 2, y: size.height - 28)
        banner.zPosition = 20
        addChild(banner)

        let title = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        title.text = "GLOBAL CAMPAIGN THEATER"
        title.fontSize = 18
        title.fontColor = .white
        title.position = CGPoint(x: 18, y: size.height - 35)
        title.horizontalAlignmentMode = .left
        title.zPosition = 21
        addChild(title)

        // Warbux currency with authentic icon
        let warbuxIconTex = TextureHelper.loadTexture(named: "warbux_icon.png", fallbackColor: .yellow, size: CGSize(width: 22, height: 22))
        let warbuxIcon = SKSpriteNode(texture: warbuxIconTex, size: CGSize(width: 22, height: 22))
        warbuxIcon.position = CGPoint(x: size.width - 250, y: size.height - 28)
        warbuxIcon.zPosition = 21
        addChild(warbuxIcon)

        let warbuxLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxLabel.text = "\(GameState.shared.warbux)"
        warbuxLabel.fontSize = 16
        warbuxLabel.fontColor = SKColor(red: 1.0, green: 0.88, blue: 0.2, alpha: 1.0)
        warbuxLabel.position = CGPoint(x: size.width - 232, y: size.height - 34)
        warbuxLabel.horizontalAlignmentMode = .left
        warbuxLabel.zPosition = 21
        addChild(warbuxLabel)

        // Armory button with weapon_normal_btn.png
        let armoryTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: SKColor(red: 0.85, green: 0.45, blue: 0.1, alpha: 1.0), size: CGSize(width: 110, height: 36))
        let armoryBtn = SKSpriteNode(texture: armoryTex, size: CGSize(width: 110, height: 36))
        armoryBtn.name = "armory_btn"
        armoryBtn.position = CGPoint(x: size.width - 70, y: size.height - 28)
        armoryBtn.zPosition = 21
        addChild(armoryBtn)

        let armoryLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        armoryLabel.name = "armory_btn"
        armoryLabel.text = "ARMORY"
        armoryLabel.fontSize = 13
        armoryLabel.fontColor = .white
        armoryLabel.verticalAlignmentMode = .center
        armoryLabel.position = armoryBtn.position
        armoryLabel.zPosition = 22
        addChild(armoryLabel)
    }

    private func setupCampaignSectors() {
        // Sector configurations matching campaignThemes.lua & campaigns.lua
        struct SectorConfig {
            let level: Int
            let name: String
            let pos: CGPoint
            let landTexture: String
            let flairTexture: String
            let size: CGSize
        }

        let sectors: [SectorConfig] = [
            SectorConfig(level: 1, name: "Sector Alpha (Desert)", pos: CGPoint(x: 160, y: 190), landTexture: "campaignThemetansand.png", flairTexture: "mapterrain_desert.png", size: CGSize(width: 170, height: 110)),
            SectorConfig(level: 2, name: "Citadel Ridge (Hills)", pos: CGPoint(x: 320, y: 320), landTexture: "campaignThemegreen.png", flairTexture: "mapterrain_hills.png", size: CGSize(width: 180, height: 115)),
            SectorConfig(level: 3, name: "Frozen Tundra (Snow)", pos: CGPoint(x: 490, y: 175), landTexture: "campaignThemesnow.png", flairTexture: "mapterrain_snow.png", size: CGSize(width: 180, height: 120)),
            SectorConfig(level: 4, name: "Highland Bastion (Jungle)", pos: CGPoint(x: 640, y: 330), landTexture: "campaignThemedarkgreen.png", flairTexture: "mapterrain_jungle.png", size: CGSize(width: 190, height: 120)),
            SectorConfig(level: 5, name: "Volcano Fortress", pos: CGPoint(x: 710, y: 165), landTexture: "campaignThemered.png", flairTexture: "mapterrain_volcano.png", size: CGSize(width: 175, height: 115))
        ]

        let currentLvl = GameState.shared.currentLevel

        for sector in sectors {
            let isUnlocked = sector.level <= currentLvl
            let isCompleted = sector.level < currentLvl
            let isActive = sector.level == currentLvl

            let sectorGroup = SKNode()
            sectorGroup.position = sector.pos
            sectorGroup.name = "level_\(sector.level)"
            sectorGroup.zPosition = 5
            addChild(sectorGroup)

            // 1. Authentic Land Continent Texture
            let landTex = TextureHelper.loadTexture(named: sector.landTexture, fallbackColor: SKColor(white: 0.3, alpha: 0.8), size: sector.size)
            let landSprite = SKSpriteNode(texture: landTex, size: sector.size)
            landSprite.name = "level_\(sector.level)"
            landSprite.alpha = isUnlocked ? 1.0 : 0.45
            sectorGroup.addChild(landSprite)

            // 2. Authentic Map Terrain Flair (desert, hills, snow, jungle, volcano)
            let flairTex = TextureHelper.loadTexture(named: sector.flairTexture, fallbackColor: .clear, size: CGSize(width: 60, height: 42))
            let flairSprite = SKSpriteNode(texture: flairTex, size: CGSize(width: 60, height: 42))
            flairSprite.name = "level_\(sector.level)"
            flairSprite.position = CGPoint(x: 28, y: -10)
            flairSprite.alpha = isUnlocked ? 0.95 : 0.35
            sectorGroup.addChild(flairSprite)

            // 3. Authentic Sector Base Hub (factory.png / factorysmokeless.png / brokenfactory.png)
            let hubTextureName: String
            if isCompleted {
                hubTextureName = "factorysmokeless.png"
            } else if isActive {
                hubTextureName = "factory.png"
            } else {
                hubTextureName = "brokenfactory.png"
            }

            let hubTex = TextureHelper.loadTexture(named: hubTextureName, fallbackColor: .gray, size: CGSize(width: 44, height: 38))
            let hubSprite = SKSpriteNode(texture: hubTex, size: CGSize(width: 44, height: 38))
            hubSprite.name = "level_\(sector.level)"
            hubSprite.position = CGPoint(x: -25, y: 10)
            sectorGroup.addChild(hubSprite)

            if isActive {
                // Smoke animation on active factory
                let smokePuff = SKShapeNode(circleOfRadius: 4)
                smokePuff.fillColor = SKColor(white: 0.9, alpha: 0.6)
                smokePuff.strokeColor = .clear
                smokePuff.position = CGPoint(x: -18, y: 30)
                smokePuff.zPosition = 6
                sectorGroup.addChild(smokePuff)

                let smokeAnim = SKAction.sequence([
                    SKAction.group([
                        SKAction.moveBy(x: CGFloat.random(in: -3...3), y: 18, duration: 1.0),
                        SKAction.scale(to: 2.2, duration: 1.0),
                        SKAction.fadeAlpha(to: 0.0, duration: 1.0)
                    ]),
                    SKAction.run {
                        smokePuff.position = CGPoint(x: -18, y: 30)
                        smokePuff.setScale(1.0)
                        smokePuff.alpha = 0.6
                    }
                ])
                smokePuff.run(SKAction.repeatForever(smokeAnim))

                // Highlight pulse for current mission
                let pulse = SKAction.sequence([
                    SKAction.scale(to: 1.06, duration: 0.6),
                    SKAction.scale(to: 1.0, duration: 0.6)
                ])
                sectorGroup.run(SKAction.repeatForever(pulse))
            }

            // 4. Sector Marker Label & Stars
            let badge = SKShapeNode(circleOfRadius: 14)
            badge.fillColor = isCompleted ? SKColor(red: 0.2, green: 0.75, blue: 0.25, alpha: 1.0) : (isActive ? SKColor(red: 0.95, green: 0.75, blue: 0.1, alpha: 1.0) : SKColor(white: 0.2, alpha: 0.8))
            badge.strokeColor = .white
            badge.lineWidth = 1.5
            badge.position = CGPoint(x: -25, y: -22)
            badge.name = "level_\(sector.level)"
            sectorGroup.addChild(badge)

            let badgeText = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
            badgeText.text = isCompleted ? "✓" : (isUnlocked ? "\(sector.level)" : "🔒")
            badgeText.fontSize = 12
            badgeText.fontColor = .white
            badgeText.verticalAlignmentMode = .center
            badgeText.position = badge.position
            badgeText.name = "level_\(sector.level)"
            sectorGroup.addChild(badgeText)

            let nameLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
            nameLabel.text = sector.name
            nameLabel.fontSize = 11
            nameLabel.fontColor = isUnlocked ? .white : SKColor(white: 0.7, alpha: 1.0)
            nameLabel.position = CGPoint(x: 0, y: -48)
            nameLabel.name = "level_\(sector.level)"
            sectorGroup.addChild(nameLabel)
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            if node.name == "armory_btn" {
                SoundManager.shared.playSound("weapon_select.mp3")
                let armory = ArmoryScene(size: size)
                armory.scaleMode = scaleMode
                view?.presentScene(armory, transition: SKTransition.push(with: .left, duration: 0.3))
                return
            }

            if let name = node.name, name.starts(with: "level_") {
                let numStr = String(name.dropFirst("level_".count))
                if let levelNum = Int(numStr), levelNum <= GameState.shared.currentLevel {
                    SoundManager.shared.playSound("weapon_select.mp3")
                    SoundManager.shared.stopMusic()
                    let battle = BattlefieldScene(size: size)
                    battle.levelNumber = levelNum
                    battle.scaleMode = scaleMode
                    view?.presentScene(battle, transition: SKTransition.doorsOpenHorizontal(withDuration: 0.5))
                    return
                } else {
                    SoundManager.shared.playSound("bleep.mp3")
                }
            }
        }
    }
}
