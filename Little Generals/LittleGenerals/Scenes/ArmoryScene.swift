import SpriteKit

public class ArmoryScene: SKScene {
    private var currentIndex: Int = 0
    private var tankDisplayNode: SKNode?
    private var nameLabel: SKLabelNode!
    private var statsLabel: SKLabelNode!
    private var actionButton: SKSpriteNode!
    private var actionLabel: SKLabelNode!
    private var warbuxLabel: SKLabelNode!

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.12, green: 0.14, blue: 0.18, alpha: 1.0)

        let currentId = GameState.shared.selectedTankId
        if let idx = GameState.shared.availableTanks.firstIndex(where: { $0.id == currentId }) {
            currentIndex = idx
        }

        setupHeader()
        setupTankDisplayFrame()
        setupNavigationControls()
        updateCard()
    }

    private func setupHeader() {
        // Metallic banner back
        let barTex = TextureHelper.loadTexture(named: "controlbar_back.png", fallbackColor: SKColor(white: 0.15, alpha: 0.95), size: CGSize(width: size.width, height: 56))
        let bar = SKSpriteNode(texture: barTex, size: CGSize(width: size.width, height: 56))
        bar.position = CGPoint(x: size.width / 2, y: size.height - 28)
        bar.zPosition = 10
        addChild(bar)

        let title = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        title.text = "TANK GARAGE & ARMORY"
        title.fontSize = 20
        title.fontColor = .white
        title.position = CGPoint(x: size.width / 2, y: size.height - 35)
        title.zPosition = 11
        addChild(title)

        // Warbux with icon
        let warbuxIconTex = TextureHelper.loadTexture(named: "warbux_icon.png", fallbackColor: .yellow, size: CGSize(width: 20, height: 20))
        let warbuxIcon = SKSpriteNode(texture: warbuxIconTex, size: CGSize(width: 20, height: 20))
        warbuxIcon.position = CGPoint(x: size.width - 150, y: size.height - 28)
        warbuxIcon.zPosition = 11
        addChild(warbuxIcon)

        warbuxLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxLabel.fontSize = 16
        warbuxLabel.fontColor = SKColor(red: 1.0, green: 0.85, blue: 0.2, alpha: 1.0)
        warbuxLabel.position = CGPoint(x: size.width - 132, y: size.height - 34)
        warbuxLabel.horizontalAlignmentMode = .left
        warbuxLabel.zPosition = 11
        addChild(warbuxLabel)

        // Back button with weapon_normal_btn.png
        let backTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: SKColor(white: 0.25, alpha: 1.0), size: CGSize(width: 90, height: 34))
        let backBtn = SKSpriteNode(texture: backTex, size: CGSize(width: 90, height: 34))
        backBtn.name = "back_btn"
        backBtn.position = CGPoint(x: 65, y: size.height - 28)
        backBtn.zPosition = 11
        addChild(backBtn)

        let backLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        backLabel.name = "back_btn"
        backLabel.text = "◀ BACK"
        backLabel.fontSize = 13
        backLabel.fontColor = .white
        backLabel.verticalAlignmentMode = .center
        backLabel.position = backBtn.position
        backLabel.zPosition = 12
        addChild(backLabel)
    }

    private func setupTankDisplayFrame() {
        // Pedestal / frame backing
        let frame = SKShapeNode(rectOf: CGSize(width: 480, height: 280), cornerRadius: 16)
        frame.fillColor = SKColor(red: 0.16, green: 0.18, blue: 0.24, alpha: 0.95)
        frame.strokeColor = SKColor(red: 0.35, green: 0.4, blue: 0.5, alpha: 1.0)
        frame.lineWidth = 2.0
        frame.position = CGPoint(x: size.width / 2, y: size.height * 0.52)
        frame.zPosition = 5
        addChild(frame)

        // Garage floor platform
        let platform = SKShapeNode(ellipseOf: CGSize(width: 320, height: 60))
        platform.fillColor = SKColor(red: 0.1, green: 0.12, blue: 0.16, alpha: 1.0)
        platform.strokeColor = SKColor(red: 0.3, green: 0.6, blue: 0.8, alpha: 0.4)
        platform.lineWidth = 2.0
        platform.position = CGPoint(x: size.width / 2, y: size.height * 0.44)
        platform.zPosition = 6
        addChild(platform)

        nameLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        nameLabel.fontSize = 24
        nameLabel.fontColor = SKColor(red: 1.0, green: 0.9, blue: 0.3, alpha: 1.0)
        nameLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.68)
        nameLabel.zPosition = 10
        addChild(nameLabel)

        statsLabel = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        statsLabel.fontSize = 15
        statsLabel.fontColor = .white
        statsLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.36)
        statsLabel.zPosition = 10
        addChild(statsLabel)

        // Action button with fire_normal_btn.png or weapon_normal_btn.png
        let actionTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: SKColor(red: 0.2, green: 0.65, blue: 0.25, alpha: 1.0), size: CGSize(width: 220, height: 46))
        actionButton = SKSpriteNode(texture: actionTex, size: CGSize(width: 220, height: 46))
        actionButton.name = "action_btn"
        actionButton.position = CGPoint(x: size.width / 2, y: size.height * 0.15)
        actionButton.zPosition = 10
        addChild(actionButton)

        actionLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        actionLabel.name = "action_btn"
        actionLabel.fontSize = 17
        actionLabel.fontColor = .white
        actionLabel.verticalAlignmentMode = .center
        actionLabel.position = actionButton.position
        actionLabel.zPosition = 11
        addChild(actionLabel)
    }

    private func setupNavigationControls() {
        createNavButton(name: "prev_tank", label: "◀", pos: CGPoint(x: size.width / 2 - 270, y: size.height * 0.52))
        createNavButton(name: "next_tank", label: "▶", pos: CGPoint(x: size.width / 2 + 270, y: size.height * 0.52))
    }

    private func createNavButton(name: String, label: String, pos: CGPoint) {
        let btn = SKShapeNode(circleOfRadius: 26)
        btn.name = name
        btn.fillColor = SKColor(white: 0.25, alpha: 1.0)
        btn.strokeColor = .white
        btn.lineWidth = 1.5
        btn.position = pos
        btn.zPosition = 10
        addChild(btn)

        let text = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        text.name = name
        text.text = label
        text.fontSize = 22
        text.fontColor = .white
        text.verticalAlignmentMode = .center
        text.position = pos
        text.zPosition = 11
        addChild(text)
    }

    private func updateCard() {
        warbuxLabel.text = "\(GameState.shared.warbux)"
        let tank = GameState.shared.availableTanks[currentIndex]
        nameLabel.text = tank.name.uppercased()
        statsLabel.text = "ARMOR: \(tank.armor) HP   |   FIREPOWER: +\(tank.firepower) DMG"

        tankDisplayNode?.removeFromParent()
        let container = SKNode()
        container.position = CGPoint(x: size.width / 2, y: size.height * 0.50)
        container.zPosition = 8

        // Authentic Tank Sprite scaled for preview
        let tex = TextureHelper.loadTexture(named: tank.textureName, fallbackColor: SKColor(red: 0.25, green: 0.55, blue: 0.3, alpha: 1.0), size: CGSize(width: 140, height: 75))
        let tankSprite = SKSpriteNode(texture: tex, size: CGSize(width: 145, height: 75))
        container.addChild(tankSprite)

        // Subtle hover float animation
        let hover = SKAction.sequence([
            SKAction.moveBy(x: 0, y: 5, duration: 1.0),
            SKAction.moveBy(x: 0, y: -5, duration: 1.0)
        ])
        tankSprite.run(SKAction.repeatForever(hover))

        addChild(container)
        self.tankDisplayNode = container

        // Button state
        let isUnlocked = GameState.shared.unlockedTankIds.contains(tank.id)
        let isSelected = GameState.shared.selectedTankId == tank.id

        if isSelected {
            actionLabel.text = "EQUIPPED"
            actionButton.color = SKColor(red: 0.2, green: 0.55, blue: 0.2, alpha: 1.0)
            actionButton.colorBlendFactor = 0.5
        } else if isUnlocked {
            actionLabel.text = "SELECT TANK"
            actionButton.color = SKColor(red: 0.15, green: 0.45, blue: 0.8, alpha: 1.0)
            actionButton.colorBlendFactor = 0.5
        } else {
            actionLabel.text = "UNLOCK (\(tank.cost) WARBUX)"
            let canAfford = GameState.shared.warbux >= tank.cost
            actionButton.color = canAfford ? SKColor(red: 0.85, green: 0.5, blue: 0.1, alpha: 1.0) : SKColor(white: 0.3, alpha: 1.0)
            actionButton.colorBlendFactor = 0.5
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            if node.name == "back_btn" {
                SoundManager.shared.playSound("weapon_select.mp3")
                let map = CampaignMapScene(size: size)
                map.scaleMode = scaleMode
                view?.presentScene(map, transition: SKTransition.push(with: .right, duration: 0.3))
                return
            }

            if node.name == "prev_tank" {
                SoundManager.shared.playSound("bleep.mp3")
                currentIndex = (currentIndex - 1 + GameState.shared.availableTanks.count) % GameState.shared.availableTanks.count
                updateCard()
                return
            }

            if node.name == "next_tank" {
                SoundManager.shared.playSound("bleep.mp3")
                currentIndex = (currentIndex + 1) % GameState.shared.availableTanks.count
                updateCard()
                return
            }

            if node.name == "action_btn" {
                let tank = GameState.shared.availableTanks[currentIndex]
                let isUnlocked = GameState.shared.unlockedTankIds.contains(tank.id)

                if isUnlocked {
                    GameState.shared.selectedTankId = tank.id
                    SoundManager.shared.playSound("kaching.mp3")
                    updateCard()
                } else if GameState.shared.warbux >= tank.cost {
                    if GameState.shared.unlockTank(id: tank.id) {
                        SoundManager.shared.playSound("kaching.mp3")
                        updateCard()
                    }
                } else {
                    SoundManager.shared.playSound("carNoStart.mp3")
                }
                return
            }
        }
    }
}
