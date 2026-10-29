import SpriteKit

public class BattleOverScene: SKScene {
    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.1, green: 0.12, blue: 0.16, alpha: 1.0)
        let won = GameState.shared.lastBattleWon

        if won {
            SoundManager.shared.playSound("kaching.mp3")
        } else {
            SoundManager.shared.playSound("battleover_lose.mp3")
        }

        setupResults(won: won)
        setupButtons(won: won)
    }

    private func setupResults(won: Bool) {
        let bannerTex = TextureHelper.loadTexture(named: won ? "win.png" : "lose.png", fallbackColor: won ? .yellow : .red, size: CGSize(width: 180, height: 60))
        let banner = SKSpriteNode(texture: bannerTex)
        banner.position = CGPoint(x: size.width / 2, y: size.height * 0.80)
        banner.zPosition = 10
        addChild(banner)

        let title = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        title.text = won ? "VICTORY ACHIEVED!" : "TACTICAL DEFEAT"
        title.fontSize = 32
        title.fontColor = won ? SKColor(red: 1.0, green: 0.85, blue: 0.2, alpha: 1.0) : SKColor(red: 0.9, green: 0.25, blue: 0.25, alpha: 1.0)
        title.position = CGPoint(x: size.width / 2, y: size.height * 0.68)
        title.zPosition = 10
        addChild(title)

        let subtitle = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        subtitle.text = won ? TrashTalkManager.shared.randomWin() : TrashTalkManager.shared.randomLose()
        subtitle.fontSize = 18
        subtitle.fontColor = .white
        subtitle.position = CGPoint(x: size.width / 2, y: size.height * 0.63)
        subtitle.zPosition = 10
        addChild(subtitle)

        let warbuxLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        warbuxLabel.text = won ? "AWARD: +150 WARBUX (TOTAL: \(GameState.shared.warbux))" : "TOTAL WARBUX: \(GameState.shared.warbux)"
        warbuxLabel.fontSize = 20
        warbuxLabel.fontColor = SKColor(red: 0.4, green: 0.9, blue: 0.4, alpha: 1.0)
        warbuxLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.52)
        warbuxLabel.zPosition = 10
        addChild(warbuxLabel)
    }

    private func setupButtons(won: Bool) {
        // Primary action (Next Mission or Retry)
        let primaryBtn = SKShapeNode(rectOf: CGSize(width: 220, height: 50), cornerRadius: 10)
        primaryBtn.name = "primary_btn"
        primaryBtn.fillColor = won ? SKColor(red: 0.2, green: 0.65, blue: 0.25, alpha: 1.0) : SKColor(red: 0.8, green: 0.35, blue: 0.15, alpha: 1.0)
        primaryBtn.strokeColor = .white
        primaryBtn.lineWidth = 2.0
        primaryBtn.position = CGPoint(x: size.width / 2, y: size.height * 0.36)
        primaryBtn.zPosition = 10
        addChild(primaryBtn)

        let primaryLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        primaryLabel.name = "primary_btn"
        primaryLabel.text = won ? "NEXT MISSION" : "RETRY BATTLE"
        primaryLabel.fontSize = 18
        primaryLabel.fontColor = .white
        primaryLabel.verticalAlignmentMode = .center
        primaryLabel.position = primaryBtn.position
        primaryLabel.zPosition = 11
        addChild(primaryLabel)

        // Map button
        let mapBtn = SKShapeNode(rectOf: CGSize(width: 180, height: 44), cornerRadius: 8)
        mapBtn.name = "map_btn"
        mapBtn.fillColor = SKColor(white: 0.25, alpha: 1.0)
        mapBtn.strokeColor = .white
        mapBtn.lineWidth = 1.5
        mapBtn.position = CGPoint(x: size.width / 2 - 110, y: size.height * 0.22)
        mapBtn.zPosition = 10
        addChild(mapBtn)

        let mapLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        mapLabel.name = "map_btn"
        mapLabel.text = "MAP THEATER"
        mapLabel.fontSize = 15
        mapLabel.fontColor = .white
        mapLabel.verticalAlignmentMode = .center
        mapLabel.position = mapBtn.position
        mapLabel.zPosition = 11
        addChild(mapLabel)

        // Armory button
        let armoryBtn = SKShapeNode(rectOf: CGSize(width: 180, height: 44), cornerRadius: 8)
        armoryBtn.name = "armory_btn"
        armoryBtn.fillColor = SKColor(red: 0.8, green: 0.45, blue: 0.1, alpha: 1.0)
        armoryBtn.strokeColor = .white
        armoryBtn.lineWidth = 1.5
        armoryBtn.position = CGPoint(x: size.width / 2 + 110, y: size.height * 0.22)
        armoryBtn.zPosition = 10
        addChild(armoryBtn)

        let armoryLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        armoryLabel.name = "armory_btn"
        armoryLabel.text = "ARMORY"
        armoryLabel.fontSize = 15
        armoryLabel.fontColor = .white
        armoryLabel.verticalAlignmentMode = .center
        armoryLabel.position = armoryBtn.position
        armoryLabel.zPosition = 11
        addChild(armoryLabel)
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            if node.name == "primary_btn" {
                SoundManager.shared.playSound("button_metal.mp3")
                let battle = BattlefieldScene(size: size)
                battle.levelNumber = GameState.shared.currentLevel
                battle.scaleMode = scaleMode
                view?.presentScene(battle, transition: SKTransition.doorsOpenHorizontal(withDuration: 0.4))
                return
            } else if node.name == "map_btn" {
                SoundManager.shared.playSound("button1.mp3")
                let map = CampaignMapScene(size: size)
                map.scaleMode = scaleMode
                view?.presentScene(map, transition: SKTransition.fade(withDuration: 0.4))
                return
            } else if node.name == "armory_btn" {
                SoundManager.shared.playSound("button1.mp3")
                let armory = ArmoryScene(size: size)
                armory.scaleMode = scaleMode
                view?.presentScene(armory, transition: SKTransition.push(with: .left, duration: 0.3))
                return
            }
        }
    }
}

