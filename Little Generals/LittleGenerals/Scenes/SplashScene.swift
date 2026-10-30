import SpriteKit

public class SplashScene: SKScene {
    private var progressNode: SKShapeNode?
    private var progressFillNode: SKShapeNode?
    private var loadingTextNode: SKSpriteNode?
    private var playButtonNode: SKSpriteNode?
    private var missileNode: SKSpriteNode?
    private var isLoaded: Bool = false

    public override func didMove(to view: SKView) {
        backgroundColor = .black
        SoundManager.shared.playMusic("march1.mp3", loop: true)

        setupTitleBackground()
        setupLoadingSequence()
        simulateLoadProgress()
    }

    private func setupTitleBackground() {
        // High-definition widescreen title artwork (1136x640 right-side up)
        let bgTex = TextureHelper.loadTexture(named: "title_widescreen.png", fallbackColor: SKColor(red: 0.15, green: 0.25, blue: 0.35, alpha: 1.0), size: size)
        let bgSprite = SKSpriteNode(texture: bgTex)

        // Calculate aspect fill so artwork is crisp and unstretched on any device ratio
        let texSize = bgTex.size()
        let scaleX = size.width / texSize.width
        let scaleY = size.height / texSize.height
        let bestScale = max(scaleX, scaleY)
        bgSprite.size = CGSize(width: texSize.width * bestScale, height: texSize.height * bestScale)
        bgSprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bgSprite.zPosition = -10
        addChild(bgSprite)
    }

    private func setupLoadingSequence() {
        let centerX = size.width / 2
        let baseY: CGFloat = size.height * 0.16

        // 1. Loading Text Graphic (loading_text.png)
        let textTex = TextureHelper.loadTexture(named: "loading_text.png", fallbackColor: .clear, size: CGSize(width: 140, height: 38))
        let loadText = SKSpriteNode(texture: textTex, size: CGSize(width: 140, height: 38))
        loadText.position = CGPoint(x: centerX, y: baseY + 24)
        loadText.zPosition = 10
        addChild(loadText)
        self.loadingTextNode = loadText

        // 2. Progress Bar Outline
        let barWidth: CGFloat = 260
        let barHeight: CGFloat = 10
        let barOutline = SKShapeNode(rectOf: CGSize(width: barWidth, height: barHeight), cornerRadius: 4)
        barOutline.strokeColor = SKColor(white: 0.1, alpha: 0.8)
        barOutline.lineWidth = 2.0
        barOutline.fillColor = SKColor(white: 1.0, alpha: 0.4)
        barOutline.position = CGPoint(x: centerX, y: baseY - 4)
        barOutline.zPosition = 10
        addChild(barOutline)
        self.progressNode = barOutline

        // 3. Progress Fill
        let fill = SKShapeNode(rectOf: CGSize(width: barWidth - 4, height: barHeight - 4), cornerRadius: 2)
        fill.fillColor = SKColor(red: 0.2, green: 0.85, blue: 0.3, alpha: 1.0)
        fill.strokeColor = .clear
        fill.position = barOutline.position
        fill.xScale = 0.05
        fill.zPosition = 11
        addChild(fill)
        self.progressFillNode = fill

        // 4. Flying Missile Graphic (loading_missile.png)
        let missileTex = TextureHelper.loadTexture(named: "loading_missile.png", fallbackColor: .white, size: CGSize(width: 44, height: 16))
        let missile = SKSpriteNode(texture: missileTex, size: CGSize(width: 44, height: 16))
        missile.position = CGPoint(x: centerX - barWidth / 2, y: baseY + 8)
        missile.zPosition = 12
        addChild(missile)
        self.missileNode = missile

        // 5. Play Button (Initially Hidden, shown when loading completes)
        let playTex = TextureHelper.loadTexture(named: "play_normal_btn.png", fallbackColor: SKColor(red: 0.2, green: 0.7, blue: 0.25, alpha: 1.0), size: CGSize(width: 175, height: 56))
        let playBtn = SKSpriteNode(texture: playTex, size: CGSize(width: 175, height: 56))
        playBtn.name = "play_btn"
        playBtn.position = CGPoint(x: centerX, y: baseY + 10)
        playBtn.zPosition = 15
        playBtn.alpha = 0.0
        playBtn.setScale(0.8)
        addChild(playBtn)
        self.playButtonNode = playBtn
    }

    private func simulateLoadProgress() {
        let duration: TimeInterval = 1.6
        let steps = 40
        let stepTime = duration / Double(steps)

        var currentStep = 0
        let progressTimer = SKAction.repeat(SKAction.sequence([
            SKAction.wait(forDuration: stepTime),
            SKAction.run { [weak self] in
                guard let self = self else { return }
                currentStep += 1
                let progress = min(1.0, CGFloat(currentStep) / CGFloat(steps))
                self.progressFillNode?.xScale = max(0.05, progress)

                let barWidth: CGFloat = 260
                let startX = self.size.width / 2 - barWidth / 2
                self.missileNode?.position.x = startX + barWidth * progress

                if progress >= 1.0 {
                    self.finishLoading()
                }
            }
        ]), count: steps)

        run(progressTimer)
    }

    private func finishLoading() {
        isLoaded = true

        // Fade out loading bar and text
        loadingTextNode?.run(SKAction.fadeOut(withDuration: 0.25))
        progressNode?.run(SKAction.fadeOut(withDuration: 0.25))
        progressFillNode?.run(SKAction.fadeOut(withDuration: 0.25))
        missileNode?.run(SKAction.fadeOut(withDuration: 0.25))

        // Reveal big green Play Button with pulse
        if let playBtn = playButtonNode {
            playBtn.run(SKAction.sequence([
                SKAction.wait(forDuration: 0.2),
                SKAction.group([
                    SKAction.fadeIn(withDuration: 0.3),
                    SKAction.scale(to: 1.0, duration: 0.3)
                ]),
                SKAction.run {
                    let pulse = SKAction.sequence([
                        SKAction.scale(to: 1.06, duration: 0.55),
                        SKAction.scale(to: 1.0, duration: 0.55)
                    ])
                    playBtn.run(SKAction.repeatForever(pulse))
                }
            ]))
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let hitNodes = nodes(at: location)

        // If user taps anywhere while loaded, or taps the play button, launch map!
        if isLoaded || hitNodes.contains(where: { $0.name == "play_btn" }) {
            SoundManager.shared.playSound("button_metal.mp3")

            if let playBtn = playButtonNode {
                let selectTex = TextureHelper.loadTexture(named: "play_select_btn.png", fallbackColor: .green, size: playBtn.size)
                playBtn.texture = selectTex
            }

            run(SKAction.sequence([
                SKAction.wait(forDuration: 0.15),
                SKAction.run { [weak self] in
                    guard let self = self else { return }
                    let mapScene = CampaignMapScene(size: self.size)
                    mapScene.scaleMode = self.scaleMode
                    let transition = SKTransition.fade(withDuration: 0.4)
                    self.view?.presentScene(mapScene, transition: transition)
                }
            ]))
        }
    }
}
