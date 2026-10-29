import SpriteKit

public class SplashScene: SKScene {
    private var missileNode: SKSpriteNode?

    public override func didMove(to view: SKView) {
        backgroundColor = .black
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupBackground()
        setupLoadingMissile()
        setupPlayButton()
    }

    private func setupBackground() {
        // Authentic High-Resolution Landscape Splash / Title Artwork (Default-Landscape@2x.png)
        let splashTex = TextureHelper.loadTexture(named: "Default-Landscape@2x.png", fallbackColor: SKColor(red: 0.15, green: 0.25, blue: 0.35, alpha: 1.0), size: size)
        let splash = SKSpriteNode(texture: splashTex, size: size)
        splash.position = CGPoint(x: size.width / 2, y: size.height / 2)
        splash.zPosition = -10
        addChild(splash)
    }

    private func setupLoadingMissile() {
        // Authentic Loading Text graphic (loading_text.png)
        let loadTextTex = TextureHelper.loadTexture(named: "loading_text.png", fallbackColor: .clear, size: CGSize(width: 130, height: 26))
        let loadText = SKSpriteNode(texture: loadTextTex, size: CGSize(width: 130, height: 26))
        loadText.position = CGPoint(x: size.width / 2, y: 85)
        loadText.zPosition = 5
        addChild(loadText)

        // Authentic Flying Missile (loading_missile.png)
        let missileTex = TextureHelper.loadTexture(named: "loading_missile.png", fallbackColor: .white, size: CGSize(width: 46, height: 16))
        let missile = SKSpriteNode(texture: missileTex, size: CGSize(width: 46, height: 16))
        missile.position = CGPoint(x: size.width * 0.25, y: 55)
        missile.zPosition = 6
        addChild(missile)
        self.missileNode = missile

        let fly = SKAction.sequence([
            SKAction.moveTo(x: size.width * 0.75, duration: 1.6),
            SKAction.moveTo(x: size.width * 0.25, duration: 0.01)
        ])
        missile.run(SKAction.repeatForever(fly))
    }

    private func setupPlayButton() {
        // Authentic Play Button (play_normal_btn.png)
        let playTex = TextureHelper.loadTexture(named: "play_normal_btn.png", fallbackColor: SKColor(red: 0.2, green: 0.7, blue: 0.25, alpha: 1.0), size: CGSize(width: 170, height: 52))
        let playBtn = SKSpriteNode(texture: playTex, size: CGSize(width: 170, height: 52))
        playBtn.name = "play_btn"
        playBtn.position = CGPoint(x: size.width / 2, y: 36)
        playBtn.zPosition = 10
        addChild(playBtn)

        let pulse = SKAction.sequence([
            SKAction.scale(to: 1.05, duration: 0.5),
            SKAction.scale(to: 1.0, duration: 0.5)
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
