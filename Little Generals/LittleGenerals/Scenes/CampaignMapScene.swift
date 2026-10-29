import SpriteKit

public class CampaignMapScene: SKScene {
    private var levelNodes: [SKNode] = []

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.12, green: 0.35, blue: 0.55, alpha: 1.0)
        setupMapBackground()
        setupHUD()
        setupCampaignIslands()
    }

    private func setupMapBackground() {
        // Decorative ocean grid / waves
        let grid = SKShapeNode()
        let path = CGMutablePath()
        for y in stride(from: 0, to: size.height, by: 40) {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: size.width, y: y))
        }
        for x in stride(from: 0, to: size.width, by: 40) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: size.height))
        }
        grid.path = path
        grid.strokeColor = SKColor(white: 1.0, alpha: 0.08)
        grid.lineWidth = 1.0
        grid.zPosition = -5
        addChild(grid)
    }

    private func setupHUD() {
        // Top banner
        let banner = SKShapeNode(rectOf: CGSize(width: size.width, height: 60))
        banner.fillColor = SKColor(white: 0.0, alpha: 0.65)
        banner.strokeColor = .clear
        banner.position = CGPoint(x: size.width / 2, y: size.height - 30)
        banner.zPosition = 10
        addChild(banner)

        let title = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        title.text = "GLOBAL CAMPAIGN THEATER"
        title.fontSize = 22
        title.fontColor = .white
        title.position = CGPoint(x: 180, y: size.height - 38)
        title.zPosition = 11
        addChild(title)

        // Warbux display
        let warbuxLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxLabel.text = "WARBUX: \(GameState.shared.warbux)"
        warbuxLabel.fontSize = 18
        warbuxLabel.fontColor = SKColor(red: 1.0, green: 0.85, blue: 0.2, alpha: 1.0)
        warbuxLabel.position = CGPoint(x: size.width - 240, y: size.height - 38)
        warbuxLabel.zPosition = 11
        addChild(warbuxLabel)

        // Armory button
        let armoryBtn = SKShapeNode(rectOf: CGSize(width: 130, height: 38), cornerRadius: 8)
        armoryBtn.name = "armory_btn"
        armoryBtn.fillColor = SKColor(red: 0.85, green: 0.45, blue: 0.1, alpha: 1.0)
        armoryBtn.strokeColor = .white
        armoryBtn.lineWidth = 1.5
        armoryBtn.position = CGPoint(x: size.width - 80, y: size.height - 30)
        armoryBtn.zPosition = 11
        addChild(armoryBtn)

        let armoryLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        armoryLabel.name = "armory_btn"
        armoryLabel.text = "ARMORY"
        armoryLabel.fontSize = 15
        armoryLabel.fontColor = .white
        armoryLabel.verticalAlignmentMode = .center
        armoryLabel.position = armoryBtn.position
        armoryLabel.zPosition = 12
        addChild(armoryLabel)
    }

    private func setupCampaignIslands() {
        let islandCoords: [(CGPoint, String, String)] = [
            (CGPoint(x: 160, y: 220), "Sector Alpha", "arizona"),
            (CGPoint(x: 320, y: 360), "Desert Citadel", "arizona"),
            (CGPoint(x: 500, y: 200), "Frozen Ridge", "snow"),
            (CGPoint(x: 660, y: 380), "Great Wall Base", "wall"),
            (CGPoint(x: 700, y: 160), "Volcano Fortress", "volcano")
        ]

        for (index, (pos, name, theme)) in islandCoords.enumerated() {
            let levelNum = index + 1
            let isUnlocked = levelNum <= GameState.shared.currentLevel

            // Island base land
            let island = SKShapeNode(ellipseOf: CGSize(width: 130, height: 85))
            island.name = "level_\(levelNum)"
            island.position = pos
            island.fillColor = isUnlocked ? SKColor(red: 0.28, green: 0.65, blue: 0.32, alpha: 1.0) : SKColor(white: 0.35, alpha: 0.8)
            island.strokeColor = isUnlocked ? SKColor(red: 0.8, green: 0.9, blue: 0.3, alpha: 1.0) : SKColor(white: 0.2, alpha: 1.0)
            island.lineWidth = 3.0
            island.zPosition = 1
            addChild(island)

            // Factory / base marker
            let marker = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
            marker.name = "level_\(levelNum)"
            marker.text = isUnlocked ? "★ \(levelNum)" : "🔒"
            marker.fontSize = 24
            marker.fontColor = .white
            marker.verticalAlignmentMode = .center
            marker.position = CGPoint(x: pos.x, y: pos.y + 6)
            marker.zPosition = 2
            addChild(marker)

            let label = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
            label.name = "level_\(levelNum)"
            label.text = name
            label.fontSize = 13
            label.fontColor = .white
            label.position = CGPoint(x: pos.x, y: pos.y - 24)
            label.zPosition = 2
            addChild(label)

            // Active level pulse animation
            if levelNum == GameState.shared.currentLevel {
                let pulse = SKAction.sequence([
                    SKAction.scale(to: 1.08, duration: 0.6),
                    SKAction.scale(to: 1.0, duration: 0.6)
                ])
                island.run(SKAction.repeatForever(pulse))
            }
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            if node.name == "armory_btn" {
                SoundManager.shared.playSound("button1.mp3")
                let armory = ArmoryScene(size: size)
                armory.scaleMode = scaleMode
                view?.presentScene(armory, transition: SKTransition.push(with: .left, duration: 0.3))
                return
            }

            if let name = node.name, name.starts(with: "level_") {
                let numStr = String(name.dropFirst("level_".count))
                if let levelNum = Int(numStr), levelNum <= GameState.shared.currentLevel {
                    SoundManager.shared.playSound("button_metal.mp3")
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

