import SpriteKit

public class ArmoryScene: SKScene {
    private var currentIndex: Int = 0
    private var tankDisplayNode: SKNode?
    private var nameLabel: SKLabelNode!
    private var statsLabel: SKLabelNode!
    private var actionButton: SKShapeNode!
    private var actionLabel: SKLabelNode!
    private var warbuxLabel: SKLabelNode!

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.12, green: 0.14, blue: 0.18, alpha: 1.0)

        // Find initial index matching selected tank
        let currentId = GameState.shared.selectedTankId
        if let idx = GameState.shared.availableTanks.firstIndex(where: { $0.id == currentId }) {
            currentIndex = idx
        }

        setupHeader()
        setupTankDisplay()
        setupNavigationControls()
        updateCard()
    }

    private func setupHeader() {
        let title = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        title.text = "TANK GARAGE & ARMORY"
        title.fontSize = 26
        title.fontColor = .white
        title.position = CGPoint(x: size.width / 2, y: size.height - 45)
        title.zPosition = 10
        addChild(title)

        warbuxLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxLabel.fontSize = 18
        warbuxLabel.fontColor = SKColor(red: 1.0, green: 0.85, blue: 0.2, alpha: 1.0)
        warbuxLabel.position = CGPoint(x: size.width - 120, y: size.height - 45)
        warbuxLabel.zPosition = 10
        addChild(warbuxLabel)

        let backBtn = SKShapeNode(rectOf: CGSize(width: 90, height: 36), cornerRadius: 8)
        backBtn.name = "back_btn"
        backBtn.fillColor = SKColor(white: 0.25, alpha: 1.0)
        backBtn.strokeColor = .white
        backBtn.lineWidth = 1.5
        backBtn.position = CGPoint(x: 65, y: size.height - 40)
        backBtn.zPosition = 10
        addChild(backBtn)

        let backLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        backLabel.name = "back_btn"
        backLabel.text = "◀ BACK"
        backLabel.fontSize = 14
        backLabel.fontColor = .white
        backLabel.verticalAlignmentMode = .center
        backLabel.position = backBtn.position
        backLabel.zPosition = 11
        addChild(backLabel)
    }

    private func setupTankDisplay() {
        let frame = SKShapeNode(rectOf: CGSize(width: 480, height: 320), cornerRadius: 16)
        frame.fillColor = SKColor(white: 0.18, alpha: 0.9)
        frame.strokeColor = SKColor(white: 0.4, alpha: 1.0)
        frame.lineWidth = 2.0
        frame.position = CGPoint(x: size.width / 2, y: size.height * 0.52)
        frame.zPosition = 5
        addChild(frame)

        nameLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        nameLabel.fontSize = 24
        nameLabel.fontColor = SKColor(red: 1.0, green: 0.9, blue: 0.3, alpha: 1.0)
        nameLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.70)
        nameLabel.zPosition = 10
        addChild(nameLabel)

        statsLabel = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        statsLabel.fontSize = 17
        statsLabel.fontColor = .white
        statsLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.36)
        statsLabel.zPosition = 10
        addChild(statsLabel)

        // Action button (EQUIP / BUY)
        actionButton = SKShapeNode(rectOf: CGSize(width: 220, height: 46), cornerRadius: 10)
        actionButton.name = "action_btn"
        actionButton.position = CGPoint(x: size.width / 2, y: size.height * 0.15)
        actionButton.zPosition = 10
        addChild(actionButton)

        actionLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        actionLabel.name = "action_btn"
        actionLabel.fontSize = 18
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
        let btn = SKShapeNode(circleOfRadius: 28)
        btn.name = name
        btn.fillColor = SKColor(white: 0.25, alpha: 1.0)
        btn.strokeColor = .white
        btn.lineWidth = 2.0
        btn.position = pos
        btn.zPosition = 10
        addChild(btn)

        let text = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        text.name = name
        text.text = label
        text.fontSize = 24
        text.fontColor = .white
        text.verticalAlignmentMode = .center
        text.position = pos
        text.zPosition = 11
        addChild(text)
    }

    private func updateCard() {
        warbuxLabel.text = "WARBUX: \(GameState.shared.warbux)"
        let tank = GameState.shared.availableTanks[currentIndex]
        nameLabel.text = tank.name
        statsLabel.text = "ARMOR: \(tank.armor) HP   |   FIREPOWER: +\(tank.firepower) DMG"

        tankDisplayNode?.removeFromParent()
        let container = SKNode()
        container.position = CGPoint(x: size.width / 2, y: size.height * 0.53)
        container.zPosition = 8

        // Visual tank silhouette / representation
        let hull = SKShapeNode(rectOf: CGSize(width: 140, height: 60), cornerRadius: 8)
        hull.fillColor = SKColor(red: 0.25, green: 0.55, blue: 0.3, alpha: 1.0)
        hull.strokeColor = .white
        hull.lineWidth = 2.0
        container.addChild(hull)

        let turret = SKShapeNode(circleOfRadius: 26)
        turret.fillColor = SKColor(white: 0.3, alpha: 1.0)
        turret.strokeColor = .white
        turret.position = CGPoint(x: 10, y: 15)
        container.addChild(turret)

        let cannon = SKShapeNode(rectOf: CGSize(width: 65, height: 12))
        cannon.fillColor = SKColor(white: 0.2, alpha: 1.0)
        cannon.strokeColor = .clear
        cannon.position = CGPoint(x: 45, y: 15)
        container.addChild(cannon)

        addChild(container)
        self.tankDisplayNode = container

        let isUnlocked = GameState.shared.unlockedTankIds.contains(tank.id)
        let isSelected = GameState.shared.selectedTankId == tank.id

        if isSelected {
            actionButton.fillColor = SKColor(red: 0.2, green: 0.6, blue: 0.25, alpha: 1.0)
            actionLabel.text = "✓ EQUIPPED"
        } else if isUnlocked {
            actionButton.fillColor = SKColor(red: 0.2, green: 0.45, blue: 0.75, alpha: 1.0)
            actionLabel.text = "EQUIP TANK"
        } else {
            actionButton.fillColor = SKColor(red: 0.85, green: 0.5, blue: 0.15, alpha: 1.0)
            actionLabel.text = "UNLOCK (\(tank.cost) WARBUX)"
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            if node.name == "back_btn" {
                SoundManager.shared.playSound("button1.mp3")
                let map = CampaignMapScene(size: size)
                map.scaleMode = scaleMode
                view?.presentScene(map, transition: SKTransition.push(with: .right, duration: 0.3))
                return
            } else if node.name == "prev_tank" {
                SoundManager.shared.playSound("bleep.mp3")
                currentIndex = (currentIndex - 1 + GameState.shared.availableTanks.count) % GameState.shared.availableTanks.count
                updateCard()
                return
            } else if node.name == "next_tank" {
                SoundManager.shared.playSound("bleep.mp3")
                currentIndex = (currentIndex + 1) % GameState.shared.availableTanks.count
                updateCard()
                return
            } else if node.name == "action_btn" {
                let tank = GameState.shared.availableTanks[currentIndex]
                let isUnlocked = GameState.shared.unlockedTankIds.contains(tank.id)

                if isUnlocked {
                    GameState.shared.selectedTankId = tank.id
                    SoundManager.shared.playSound("button_metal.mp3")
                    updateCard()
                } else {
                    if GameState.shared.unlockTank(id: tank.id) {
                        SoundManager.shared.playSound("kaching.mp3")
                        updateCard()
                    } else {
                        SoundManager.shared.playSound("bleep.mp3")
                    }
                }
                return
            }
        }
    }
}
