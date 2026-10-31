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
        // In splashScene.lua:194 & 211: y = display.contentHeight/2 + 200 = 500 from top -> y = 100 from bottom in SpriteKit
        let loadY: CGFloat = 100

        // 1. Loading Text Graphic (loading_text.png: 198x63 native, 196x61 in splashScene.lua:192)
        let loadText = TextureHelper.nativeSprite(named: "loading_text.png", scale: 1.0, fallbackColor: .clear, fallbackSize: CGSize(width: 196, height: 61))
        loadText.position = CGPoint(x: centerX, y: loadY)
        loadText.zPosition = 10
        addChild(loadText)
        self.loadingTextNode = loadText

        // 2. Progress Bar Outline (matches splashScene.lua:130-156: width=300, height=10, directly below loading_text.png)
        let barWidth: CGFloat = 300
        let barHeight: CGFloat = 10
        let barY = loadY - loadText.size.height / 2 - barHeight / 2 - 5
        let brownDark = SKColor(red: 98.0 / 255.0, green: 65.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)
        let offWhite = SKColor(red: 238.0 / 255.0, green: 234.0 / 255.0, blue: 222.0 / 255.0, alpha: 1.0)

        let barOutline = SKShapeNode(rectOf: CGSize(width: barWidth, height: barHeight), cornerRadius: 3)
        barOutline.strokeColor = brownDark
        barOutline.lineWidth = 3.0
        barOutline.fillColor = offWhite
        barOutline.position = CGPoint(x: centerX, y: barY)
        barOutline.zPosition = 10
        addChild(barOutline)
        self.progressNode = barOutline

        // 3. Progress Fill
        let fill = SKShapeNode(rectOf: CGSize(width: barWidth - 4, height: barHeight - 4), cornerRadius: 2)
        fill.fillColor = brownDark
        fill.strokeColor = .clear
        fill.position = barOutline.position
        fill.xScale = 0.05
        fill.zPosition = 11
        addChild(fill)
        self.progressFillNode = fill

        // 4. Flying Missile Graphic (loading_missile.png: 86x58 native, scaled proportionally)
        let missile = TextureHelper.nativeSprite(named: "loading_missile.png", scale: 0.55, fallbackColor: .clear, fallbackSize: CGSize(width: 47, height: 32))
        missile.position = CGPoint(x: centerX - barWidth / 2, y: barY + 2)
        missile.zPosition = 12
        addChild(missile)
        self.missileNode = missile

        // 5. Play Button (matches splashScene.lua:72-74, 209-211: 192x93 native at (centerX, 100))
        let playBtn = TextureHelper.nativeSprite(named: "play_normal_btn.png", scale: 1.0, fallbackColor: SKColor(red: 0.2, green: 0.7, blue: 0.25, alpha: 1.0), fallbackSize: CGSize(width: 192, height: 93))
        playBtn.name = "play_btn"
        playBtn.position = CGPoint(x: centerX, y: loadY)
        playBtn.zPosition = 15
        playBtn.alpha = 0.0
        playBtn.setScale(0.8)
        addChild(playBtn)
        self.playButtonNode = playBtn

        // 6. Authentic Version Label ("v2.5.0" in SingleSleeve font size 25, splashScene.lua:240-245)
        let versionLabel = SKLabelNode(fontNamed: "SingleSleeve")
        versionLabel.text = "v2.5.0"
        versionLabel.fontSize = 25
        versionLabel.fontColor = brownDark
        versionLabel.alpha = 0.75
        versionLabel.horizontalAlignmentMode = .right
        versionLabel.verticalAlignmentMode = .bottom
        versionLabel.position = CGPoint(x: size.width - 15, y: 12)
        versionLabel.zPosition = 15
        addChild(versionLabel)
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

                let barWidth: CGFloat = 300
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
