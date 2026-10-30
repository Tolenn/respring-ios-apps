import SpriteKit

public class CampaignMapScene: SKScene {
    private var levelNodes: [SKNode] = []
    private var activeFactoryNode: SKSpriteNode?

    public override func didMove(to view: SKView) {
        // Authentic vibrant cyan ocean matching Corona source (RGB: 7, 180, 226)
        backgroundColor = SKColor(red: 7.0 / 255.0, green: 180.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupOceanAndContinent()
        setupOuterIslands()
        setupTopHUD()
        setupCampaignSectors()
    }

    private func setupOceanAndContinent() {
        // Master continent assembled from 6 beach boundary tiles (1536x874)
        let continentTex = TextureHelper.loadTexture(named: "campaign_continent.png", fallbackColor: SKColor(red: 0.88, green: 0.78, blue: 0.55, alpha: 1.0), size: CGSize(width: size.width * 0.92, height: size.height * 0.76))

        let continentWidth = min(size.width * 0.94, size.height * 1.55)
        let continentHeight = continentWidth * (874.0 / 1536.0)

        let continent = SKSpriteNode(texture: continentTex, size: CGSize(width: continentWidth, height: continentHeight))
        continent.position = CGPoint(x: size.width / 2, y: size.height * 0.46)
        continent.zPosition = 1
        addChild(continent)
    }

    private func setupOuterIslands() {
        let islandConfigs: [(String, CGPoint, CGSize)] = [
            ("island1.png", CGPoint(x: size.width * 0.12, y: size.height * 0.78), CGSize(width: 86, height: 48)),
            ("island2.png", CGPoint(x: size.width * 0.88, y: size.height * 0.80), CGSize(width: 105, height: 54)),
            ("island3.png", CGPoint(x: size.width * 0.10, y: size.height * 0.22), CGSize(width: 90, height: 40)),
            ("island4.png", CGPoint(x: size.width * 0.90, y: size.height * 0.20), CGSize(width: 65, height: 38))
        ]

        for (name, pos, iSize) in islandConfigs {
            let tex = TextureHelper.loadTexture(named: name, fallbackColor: .clear, size: iSize)
            let sprite = SKSpriteNode(texture: tex, size: iSize)
            sprite.position = pos
            sprite.zPosition = 2
            addChild(sprite)

            // Gentle ocean bobbing animation
            let bob = SKAction.sequence([
                SKAction.moveBy(x: 0, y: 3, duration: 1.5),
                SKAction.moveBy(x: 0, y: -3, duration: 1.5)
            ])
            sprite.run(SKAction.repeatForever(bob))
        }
    }

    private func setupTopHUD() {
        let barHeight: CGFloat = 52
        let bannerTex = TextureHelper.loadTexture(named: "controlbar_back.png", fallbackColor: SKColor(white: 0.1, alpha: 0.9), size: CGSize(width: size.width, height: barHeight))
        let banner = SKSpriteNode(texture: bannerTex, size: CGSize(width: size.width, height: barHeight))
        banner.position = CGPoint(x: size.width / 2, y: size.height - barHeight / 2)
        banner.zPosition = 20
        addChild(banner)

        let title = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        title.text = "GLOBAL CAMPAIGN THEATER"
        title.fontSize = 17
        title.fontColor = .white
        title.position = CGPoint(x: 20, y: size.height - 33)
        title.horizontalAlignmentMode = .left
        title.zPosition = 21
        addChild(title)

        // Warbux Currency with authentic icon
        let warbuxIconTex = TextureHelper.loadTexture(named: "warbux_icon.png", fallbackColor: .yellow, size: CGSize(width: 22, height: 22))
        let warbuxIcon = SKSpriteNode(texture: warbuxIconTex, size: CGSize(width: 22, height: 22))
        warbuxIcon.position = CGPoint(x: size.width - 230, y: size.height - 26)
        warbuxIcon.zPosition = 21
        addChild(warbuxIcon)

        let warbuxLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxLabel.text = "\(GameState.shared.warbux)"
        warbuxLabel.fontSize = 16
        warbuxLabel.fontColor = SKColor(red: 1.0, green: 0.88, blue: 0.2, alpha: 1.0)
        warbuxLabel.position = CGPoint(x: size.width - 212, y: size.height - 32)
        warbuxLabel.horizontalAlignmentMode = .left
        warbuxLabel.zPosition = 21
        addChild(warbuxLabel)

        // Armory button with authentic weapon_normal_btn.png
        let armoryTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: SKColor(red: 0.85, green: 0.45, blue: 0.1, alpha: 1.0), size: CGSize(width: 105, height: 34))
        let armoryBtn = SKSpriteNode(texture: armoryTex, size: CGSize(width: 105, height: 34))
        armoryBtn.name = "armory_btn"
        armoryBtn.position = CGPoint(x: size.width - 65, y: size.height - 26)
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
            let posNorm: CGPoint
            let flairName: String
            let flairSize: CGSize
        }

        let sectors: [SectorConfig] = [
            SectorConfig(level: 1, name: "Sector Alpha (Desert)", posNorm: CGPoint(x: 0.26, y: 0.38), flairName: "cactus1.png", flairSize: CGSize(width: 22, height: 42)),
            SectorConfig(level: 2, name: "Citadel Ridge (Hills)", posNorm: CGPoint(x: 0.38, y: 0.58), flairName: "greenhill1.png", flairSize: CGSize(width: 48, height: 32)),
            SectorConfig(level: 3, name: "Frozen Tundra (Snow)", posNorm: CGPoint(x: 0.54, y: 0.48), flairName: "greenhill2.png", flairSize: CGSize(width: 48, height: 32)),
            SectorConfig(level: 4, name: "Highland Bastion (Jungle)", posNorm: CGPoint(x: 0.68, y: 0.56), flairName: "bigpalm.png", flairSize: CGSize(width: 36, height: 46)),
            SectorConfig(level: 5, name: "Volcano Fortress", posNorm: CGPoint(x: 0.78, y: 0.36), flairName: "bigvolcano.png", flairSize: CGSize(width: 50, height: 42))
        ]

        let currentLvl = GameState.shared.currentLevel

        // Headquarters City (citysmaller.png) placed at Citadel Ridge
        let cityTex = TextureHelper.loadTexture(named: "citysmaller.png", fallbackColor: .gray, size: CGSize(width: 42, height: 38))
        let city = SKSpriteNode(texture: cityTex, size: CGSize(width: 42, height: 38))
        city.position = CGPoint(x: size.width * 0.46, y: size.height * 0.64)
        city.zPosition = 8
        addChild(city)

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

            // 1. Terrain Flair (Cactus, Hills, Volcano, Palm Tree)
            let flairTex = TextureHelper.loadTexture(named: sector.flairName, fallbackColor: .clear, size: sector.flairSize)
            let flair = SKSpriteNode(texture: flairTex, size: sector.flairSize)
            flair.name = "level_\(sector.level)"
            flair.position = CGPoint(x: 18, y: 8)
            flair.alpha = isUnlocked ? 1.0 : 0.45
            sectorGroup.addChild(flair)

            // 2. Military Factory Hub (factory.png, factorysmokeless.png, brokenfactory.png)
            let hubName = isCompleted ? "factorysmokeless.png" : (isActive ? "factory.png" : "brokenfactory.png")
            let hubTex = TextureHelper.loadTexture(named: hubName, fallbackColor: .gray, size: CGSize(width: 42, height: 36))
            let hubSprite = SKSpriteNode(texture: hubTex, size: CGSize(width: 42, height: 36))
            hubSprite.name = "level_\(sector.level)"
            hubSprite.position = CGPoint(x: -18, y: -2)
            sectorGroup.addChild(hubSprite)

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
            badgeText.text = isCompleted ? "★ CLEAR" : (isActive ? "▶ MISSION \(sector.level)" : "LOCKED")
            badgeText.fontSize = 9.5
            badgeText.fontColor = .white
            badgeText.verticalAlignmentMode = .center
            badgeText.position = CGPoint(x: 0, y: -22)
            badgeText.zPosition = 11
            sectorGroup.addChild(badgeText)

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
        battleScene.levelNumber = level
        battleScene.scaleMode = scaleMode
        let transition = SKTransition.doorway(withDuration: 0.6)
        view?.presentScene(battleScene, transition: transition)
    }
}
