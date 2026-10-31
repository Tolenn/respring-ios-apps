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

    private let brownDark = SKColor(red: 98.0 / 255.0, green: 65.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)

    private func setupResults(won: Bool) {
        // Authentic popup box container at native 623x402 aspect ratio (battleOverScene.lua:45)
        let popup = TextureHelper.nativeSprite(named: "winlose_popup_box.png", scale: 0.92, fallbackColor: SKColor(white: 0.16, alpha: 0.95), fallbackSize: CGSize(width: 573, height: 370))
        popup.position = CGPoint(x: size.width / 2, y: size.height * 0.56)
        popup.zPosition = 5
        addChild(popup)

        // Authentic General Avatar on left of popup (battleOverScene.lua:54-60)
        let avatarGroup = TextureHelper.buildGeneralAvatar(isPlayer: true, scale: 0.52)
        avatarGroup.position = CGPoint(x: size.width / 2 - 172, y: size.height * 0.62)
        avatarGroup.zPosition = 10
        addChild(avatarGroup)

        // Title in SingleSleeve font ("You win!" / "You lose!", battleOverScene.lua:195-232)
        let title = SKLabelNode(fontNamed: "SingleSleeve")
        title.text = won ? "You win!" : "You lose!"
        title.fontSize = 46
        title.fontColor = won ? SKColor(red: 0.18, green: 0.58, blue: 0.18, alpha: 1.0) : SKColor(red: 0.82, green: 0.22, blue: 0.18, alpha: 1.0)
        title.position = CGPoint(x: size.width / 2 + 52, y: size.height * 0.71)
        title.zPosition = 10
        addChild(title)

        let subtitle = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        subtitle.text = won ? "You earned \(GameState.shared.lastBattlePot) warbux!" : TrashTalkManager.shared.randomLose()
        subtitle.fontSize = 17
        subtitle.fontColor = brownDark
        subtitle.position = CGPoint(x: size.width / 2 + 52, y: size.height * 0.63)
        subtitle.zPosition = 10
        addChild(subtitle)

        // Total Warbux with authentic icon at native 73x60 aspect ratio (battleOverScene.lua:233-247)
        let wbIcon = TextureHelper.nativeSprite(named: "warbux_icon.png", scale: 0.55, fallbackColor: .yellow, fallbackSize: CGSize(width: 40, height: 33))
        wbIcon.position = CGPoint(x: size.width / 2 - 22, y: size.height * 0.54)
        wbIcon.zPosition = 10
        addChild(wbIcon)

        let warbuxLabel = SKLabelNode(fontNamed: "SingleSleeve")
        warbuxLabel.text = "\(GameState.shared.warbux)"
        warbuxLabel.fontSize = 32
        warbuxLabel.fontColor = brownDark
        warbuxLabel.horizontalAlignmentMode = .left
        warbuxLabel.verticalAlignmentMode = .center
        warbuxLabel.position = CGPoint(x: size.width / 2 + 6, y: size.height * 0.54)
        warbuxLabel.zPosition = 10
        addChild(warbuxLabel)

        // Wins & Kills Record (battleOverScene.lua:251-271)
        let statsLabel = SKLabelNode(fontNamed: "SingleSleeve")
        statsLabel.text = "WINS: \(GameState.shared.totalWins)     KILLS: \(GameState.shared.totalKills)"
        statsLabel.fontSize = 24
        statsLabel.fontColor = brownDark
        statsLabel.position = CGPoint(x: size.width / 2 + 52, y: size.height * 0.44)
        statsLabel.zPosition = 10
        addChild(statsLabel)
    }

    private func setupButtons(won: Bool) {
        // Authentic Accept / Map button at native 84x90 aspect ratio (accept_normal_btn.png, battleOverScene.lua:277)
        let acceptBtn = TextureHelper.nativeSprite(named: "accept_normal_btn.png", scale: 0.90, fallbackColor: SKColor(red: 0.2, green: 0.65, blue: 0.25, alpha: 1.0), fallbackSize: CGSize(width: 76, height: 81))
        acceptBtn.name = "map_btn"
        acceptBtn.position = CGPoint(x: size.width / 2 - 165, y: size.height * 0.20)
        acceptBtn.zPosition = 10
        addChild(acceptBtn)

        // Primary action (Next Mission or Retry)
        let primaryBtn = SKShapeNode(rectOf: CGSize(width: 175, height: 48), cornerRadius: 10)
        primaryBtn.name = "primary_btn"
        primaryBtn.fillColor = won ? SKColor(red: 0.2, green: 0.65, blue: 0.25, alpha: 1.0) : SKColor(red: 0.8, green: 0.35, blue: 0.15, alpha: 1.0)
        primaryBtn.strokeColor = .white
        primaryBtn.lineWidth = 2.0
        primaryBtn.position = CGPoint(x: size.width / 2 + 5, y: size.height * 0.20)
        primaryBtn.zPosition = 10
        addChild(primaryBtn)

        let primaryLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        primaryLabel.name = "primary_btn"
        primaryLabel.text = won ? "NEXT MISSION" : "RETRY BATTLE"
        primaryLabel.fontSize = 16
        primaryLabel.fontColor = .white
        primaryLabel.verticalAlignmentMode = .center
        primaryLabel.position = primaryBtn.position
        primaryLabel.zPosition = 11
        addChild(primaryLabel)

        // Armory button
        let armoryBtn = SKShapeNode(rectOf: CGSize(width: 145, height: 48), cornerRadius: 10)
        armoryBtn.name = "armory_btn"
        armoryBtn.fillColor = SKColor(red: 0.8, green: 0.45, blue: 0.1, alpha: 1.0)
        armoryBtn.strokeColor = .white
        armoryBtn.lineWidth = 1.5
        armoryBtn.position = CGPoint(x: size.width / 2 + 180, y: size.height * 0.20)
        armoryBtn.zPosition = 10
        addChild(armoryBtn)

        let armoryLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        armoryLabel.name = "armory_btn"
        armoryLabel.text = "ARMORY"
        armoryLabel.fontSize = 16
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

