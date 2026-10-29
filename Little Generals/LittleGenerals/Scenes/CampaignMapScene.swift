import SpriteKit

public class CampaignMapScene: SKScene {
    private var levelNodes: [SKNode] = []
    private var activeFactoryNode: SKSpriteNode?

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.12, green: 0.35, blue: 0.55, alpha: 1.0)
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupMapBackground()
        setupTopHUD()
        setupCampaignSectors()
    }

    private func setupMapBackground() {
        // Ocean backdrop
        let oceanTex = TextureHelper.loadTexture(named: "water.png", fallbackColor: SKColor(red: 0.14, green: 0.38, blue: 0.58, alpha: 1.0), size: size)
        let ocean = SKSpriteNode(texture: oceanTex, size: size)
        ocean.position = CGPoint(x: size.width / 2, y: size.height / 2)
        ocean.zPosition = -15
        addChild(ocean)

        // Archipelago Islands backdrop
        let mapTex = TextureHelper.loadTexture(named: "campaignTheme1islands.png", fallbackColor: .clear, size: CGSize(width: size.width * 0.96, height: size.height * 0.82))
        let mapNode = SKSpriteNode(texture: mapTex, size: CGSize(width: size.width * 0.96, height: size.height * 0.82))
        mapNode.position = CGPoint(x: size.width / 2, y: size.height * 0.46)
        mapNode.zPosition = -10
        addChild(mapNode)

        // Coastal beach accents
        let beachConfigs: [(String, CGPoint, CGSize)] = [
            ("campaignTheme1beach1.png", CGPoint(x: size.width * 0.20, y: size.height * 0.42), CGSize(width: 140, height: 80)),
            ("campaignTheme1beach2.png", CGPoint(x: size.width * 0.50, y: size.height * 0.62), CGSize(width: 160, height: 90)),
            ("campaignTheme1beach3.png", CGPoint(x: size.width * 0.76, y: size.height * 0.32), CGSize(width: 150, height: 85))
        ]

        for (beachName, pos, bSize) in beachConfigs {
            let bTex = TextureHelper.loadTexture(named: beachName, fallbackColor: .clear, size: bSize)
            let bSprite = SKSpriteNode(texture: bTex, size: bSize)
            bSprite.position = pos
            bSprite.alpha = 0.85
            bSprite.zPosition = -8
            addChild(bSprite)
        }
    }

    private func setupTopHUD() {
        let bannerTex = TextureHelper.loadTexture(named: "controlbar_back.png", fallbackColor: SKColor(white: 0.1, alpha: 0.9), size: CGSize(width: size.width, height: 54))
        let banner = SKSpriteNode(texture: bannerTex, size: CGSize(width: size.width, height: 54))
        banner.position = CGPoint(x: size.width / 2, y: size.height - 27)
        banner.zPosition = 20
        addChild(banner)

        let title = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        title.text = "GLOBAL CAMPAIGN THEATER"
        title.fontSize = 17
        title.fontColor = .white
        title.position = CGPoint(x: 20, y: size.height - 34)
        title.horizontalAlignmentMode = .left
        title.zPosition = 21
        addChild(title)

        // Warbux currency with authentic icon
        let warbuxIconTex = TextureHelper.loadTexture(named: "warbux_icon.png", fallbackColor: .yellow, size: CGSize(width: 20, height: 20))
        let warbuxIcon = SKSpriteNode(texture: warbuxIconTex, size: CGSize(width: 20, height: 20))
        warbuxIcon.position = CGPoint(x: size.width - 240, y: size.height - 27)
        warbuxIcon.zPosition = 21
        addChild(warbuxIcon)

        let warbuxLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxLabel.text = "\(GameState.shared.warbux)"
        warbuxLabel.fontSize = 16
        warbuxLabel.fontColor = SKColor(red: 1.0, green: 0.88, blue: 0.2, alpha: 1.0)
        warbuxLabel.position = CGPoint(x: size.width - 224, y: size.height - 33)
        warbuxLabel.horizontalAlignmentMode = .left
        warbuxLabel.zPosition = 21
        addChild(warbuxLabel)

        // Armory button with weapon_normal_btn.png
        let armoryTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: SKColor(red: 0.85, green: 0.45, blue: 0.1, alpha: 1.0), size: CGSize(width: 100, height: 34))
        let armoryBtn = SKSpriteNode(texture: armoryTex, size: CGSize(width: 100, height: 34))
        armoryBtn.name = "armory_btn"
        armoryBtn.position = CGPoint(x: size.width - 65, y: size.height - 27)
        armoryBtn.zPosition = 21
        addChild(armoryBtn)

        let armoryLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        armoryLabel.name = "armory_btn"
        armoryLabel.text = "ARMORY"
        armoryLabel.fontSize = 12
        armoryLabel.fontColor = .white
        armoryLabel.verticalAlignmentMode = .center
        armoryLabel.position = armoryBtn.position
        armoryLabel.zPosition = 22
        addChild(armoryLabel)
    }

    private func setupCampaignSectors() {
        struct SectorConfig {
            let level: Int
            let name: String
            let pos: CGPoint
            let landTexture: String
            let flairTexture: String
            let size: CGSize
        }

        let sectors: [SectorConfig] = [
            SectorConfig(level: 1, name: "Sector Alpha (Desert)", pos: CGPoint(x: size.width * 0.18, y: size.height * 0.45), landTexture: "campaignThemetansand.png", flairTexture: "mapterrain_desert.png", size: CGSize(width: 150, height: 95)),
            SectorConfig(level: 2, name: "Citadel Ridge (Hills)", pos: CGPoint(x: size.width * 0.36, y: size.height * 0.65), landTexture: "campaignThemegreen.png", flairTexture: "mapterrain_hills.png", size: CGSize(width: 160, height: 100)),
            SectorConfig(level: 3, name: "Frozen Tundra (Snow)", pos: CGPoint(x: size.width * 0.55, y: size.height * 0.40), landTexture: "campaignThemesnow.png", flairTexture: "mapterrain_snow.png", size: CGSize(width: 160, height: 100)),
            SectorConfig(level: 4, name: "Highland Bastion (Jungle)", pos: CGPoint(x: size.width * 0.72, y: size.height * 0.68), landTexture: "campaignThemedarkgreen.png", flairTexture: "mapterrain_jungle.png", size: CGSize(width: 165, height: 105)),
            SectorConfig(level: 5, name: "Volcano Fortress", pos: CGPoint(x: size.width * 0.84, y: size.height * 0.38), landTexture: "campaignThemered.png", flairTexture: "mapterrain_volcano.png", size: CGSize(width: 155, height: 100))
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

            let landTex = TextureHelper.loadTexture(named: sector.landTexture, fallbackColor: SKColor(white: 0.3, alpha: 0.8), size: sector.size)
            let landSprite = SKSpriteNode(texture: landTex, size: sector.size)
            landSprite.name = "level_\(sector.level)"
            landSprite.alpha = isUnlocked ? 1.0 : 0.45
            sectorGroup.addChild(landSprite)

            let flairTex = TextureHelper.loadTexture(named: sector.flairTexture, fallbackColor: .clear, size: CGSize(width: 52, height: 36))
            let flairSprite = SKSpriteNode(texture: flairTex, size: CGSize(width: 52, height: 36))
            flairSprite.name = "level_\(sector.level)"
            flairSprite.position = CGPoint(x: 22, y: -8)
            flairSprite.alpha = isUnlocked ? 0.95 : 0.35
            sectorGroup.addChild(flairSprite)

            let hubTextureName = isCompleted ? "factorysmokeless.png" : (isActive ? "factory.png" : "brokenfactory.png")
            let hubTex = TextureHelper.loadTexture(named: hubTextureName, fallbackColor: .gray, size: CGSize(width: 40, height: 34))
            let hubSprite = SKSpriteNode(texture: hubTex, size: CGSize(width: 40, height: 34))
            hubSprite.name = "level_\(sector.level)"
            hubSprite.position = CGPoint(x: -20, y: 8)
            sectorGroup.addChild(hubSprite)

            let lbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
            lbl.name = "level_\(sector.level)"
            lbl.text = isCompleted ? "★ Sector \(sector.level)" : (isActive ? "▶ Mission \(sector.level)" : "Locked")
            lbl.fontSize = 11
            lbl.fontColor = isActive ? SKColor(red: 1.0, green: 0.85, blue: 0.2, alpha: 1.0) : (isCompleted ? .white : SKColor(white: 0.6, alpha: 1.0))
            lbl.position = CGPoint(x: 0, y: -sector.size.height / 2 - 8)
            sectorGroup.addChild(lbl)

            levelNodes.append(sectorGroup)
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let hitNodes = nodes(at: location)

        for node in hitNodes {
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
                        SoundManager.shared.playSound("button1.mp3")
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
        battleScene.scaleMode = scaleMode
        let transition = SKTransition.doorway(withDuration: 0.6)
        view?.presentScene(battleScene, transition: transition)
    }
}
