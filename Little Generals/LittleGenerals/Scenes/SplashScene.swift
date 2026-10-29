import SpriteKit

public class SplashScene: SKScene {
    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.1, green: 0.12, blue: 0.15, alpha: 1.0)
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupBackground()
        setupTitle()
        setupPrompt()
    }

    private func setupBackground() {
        // Attempt to load splash texture
        let splashTextureCandidates = [
            SKTexture(imageNamed: "splashscreen.png"),
            SKTexture(imageNamed: "res/splash/splashscreen.png"),
            SKTexture(imageNamed: "Default-Landscape.png")
        ]

        let splashTexture = splashTextureCandidates.first(where: { $0.size().width > 0 }) ?? SKTexture(imageNamed: "Default-Landscape.png")
        let splash = SKSpriteNode(texture: splashTexture)
        splash.position = CGPoint(x: size.width / 2, y: size.height / 2)
        splash.size = CGSize(width: size.width, height: size.height)
        splash.zPosition = -10
        addChild(splash)
    }

    private func setupTitle() {
        let titleShadow = SKLabelNode(fontNamed: "SingleSleeve")
        titleShadow.text = "LITTLE GENERALS"
        titleShadow.fontSize = 54
        titleShadow.fontColor = .black
        titleShadow.position = CGPoint(x: size.width / 2 + 3, y: size.height * 0.72 - 3)
        titleShadow.zPosition = 1
        addChild(titleShadow)

        let titleLabel = SKLabelNode(fontNamed: "SingleSleeve")
        titleLabel.text = "LITTLE GENERALS"
        titleLabel.fontSize = 54
        titleLabel.fontColor = SKColor(red: 1.0, green: 0.85, blue: 0.2, alpha: 1.0)
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.72)
        titleLabel.zPosition = 2
        addChild(titleLabel)

        let subtitleLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        subtitleLabel.text = "64-BIT iOS RESTORATION"
        subtitleLabel.fontSize = 20
        subtitleLabel.fontColor = .white
        subtitleLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.64)
        subtitleLabel.zPosition = 2
        addChild(subtitleLabel)
    }

    private func setupPrompt() {
        let prompt = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        prompt.text = "TAP SCREEN TO COMMENCE OPERATION"
        prompt.fontSize = 22
        prompt.fontColor = SKColor(red: 0.9, green: 0.95, blue: 1.0, alpha: 1.0)
        prompt.position = CGPoint(x: size.width / 2, y: size.height * 0.20)
        prompt.zPosition = 5
        addChild(prompt)

        let pulse = SKAction.sequence([
            SKAction.fadeAlpha(to: 0.25, duration: 0.7),
            SKAction.fadeAlpha(to: 1.0, duration: 0.7)
        ])
        prompt.run(SKAction.repeatForever(pulse))
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SoundManager.shared.playSound("button1.mp3")
        let mapScene = CampaignMapScene(size: size)
        mapScene.scaleMode = scaleMode
        let transition = SKTransition.fade(withDuration: 0.5)
        view?.presentScene(mapScene, transition: transition)
    }
}
