import SpriteKit

public class SplashScene: SKScene {
    private var missileNode: SKSpriteNode?

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.1, green: 0.12, blue: 0.15, alpha: 1.0)
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupBackground()
        setupLoadingMissile()
        setupPlayButton()
    }

    private func setupBackground() {
        // Authentic Little Generals Splash Artwork
        let splashTex = TextureHelper.loadTexture(named: "splashscreen.png", fallbackColor: SKColor(red: 0.15, green: 0.25, blue: 0.35, alpha: 1.0), size: size)
        let splash = SKSpriteNode(texture: splashTex, size: size)
        splash.position = CGPoint(x: size.width / 2, y: size.height / 2)
        splash.zPosition = -10
        addChild(splash)

        // Title and Subtitle Overlay
        let titleLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        titleLabel.text = "LITTLE GENERALS"
        titleLabel.fontSize = 44
        titleLabel.fontColor = SKColor(red: 1.0, green: 0.85, blue: 0.2, alpha: 1.0)
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.76)
        titleLabel.zPosition = 2
        addChild(titleLabel)

        let subtitleLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        subtitleLabel.text = "64-BIT iOS NATIVE RESTORATION"
        subtitleLabel.fontSize = 16
        subtitleLabel.fontColor = .white
        subtitleLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.70)
        subtitleLabel.zPosition = 2
        addChild(subtitleLabel)
    }

    private func setupLoadingMissile() {
        // Authentic Loading Text graphic (loading_text.png)
        let loadTextTex = TextureHelper.loadTexture(named: "loading_text.png", fallbackColor: .clear, size: CGSize(width: 140, height: 28))
        let loadText = SKSpriteNode(texture: loadTextTex, size: CGSize(width: 140, height: 28))
        loadText.position = CGPoint(x: size.width / 2, y: size.height * 0.28)
        loadText.zPosition = 5
        addChild(loadText)

        // Authentic Flying Missile (loading_missile.png) with flame tail
        let missileTex = TextureHelper.loadTexture(named: "loading_missile.png", fallbackColor: .white, size: CGSize(width: 48, height: 18))
        let missile = SKSpriteNode(texture: missileTex, size: CGSize(width: 48, height: 18))
        missile.position = CGPoint(x: size.width * 0.2, y: size.height * 0.22)
        missile.zPosition = 6
        addChild(missile)
        self.missileNode = missile

        // Animated flight across the bottom
        let fly = SKAction.sequence([
            SKAction.moveTo(x: size.width * 0.8, duration: 1.8),
            SKAction.moveTo(x: size.width * 0.2, duration: 0.01)
        ])
        missile.run(SKAction.repeatForever(fly))
    }

    private func setupPlayButton() {
        // Authentic Play Button (play_normal_btn.png)
        let playTex = TextureHelper.loadTexture(named: "play_normal_btn.png", fallbackColor: SKColor(red: 0.2, green: 0.7, blue: 0.25, alpha: 1.0), size: CGSize(width: 180, height: 50))
        let playBtn = SKSpriteNode(texture: playTex, size: CGSize(width: 180, height: 50))
        playBtn.name = "play_btn"
        playBtn.position = CGPoint(x: size.width / 2, y: size.height * 0.12)
        playBtn.zPosition = 10
        addChild(playBtn)

        let pulse = SKAction.sequence([
            SKAction.scale(to: 1.06, duration: 0.6),
            SKAction.scale(to: 1.0, duration: 0.6)
        ])
        playBtn.run(SKAction.repeatForever(pulse))
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SoundManager.shared.playSound("button1.mp3")
        let mapScene = CampaignMapScene(size: size)
        mapScene.scaleMode = scaleMode
        let transition = SKTransition.fade(withDuration: 0.4)
        view?.presentScene(mapScene, transition: transition)
    }
}
