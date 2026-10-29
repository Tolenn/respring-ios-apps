import SpriteKit

public class MedalsScene: SKScene {
    public override func didMove(to view: SKView) {
        backgroundColor = .black
        setupScene()
        SoundManager.shared.playSound(named: "Crowd_cheer.caf")
    }
    
    private func setupScene() {
        // Fullscreen Olympic Podium Background (480x320)
        let bg = SKSpriteNode(imageNamed: "podium.png")
        bg.position = CGPoint(x: 240, y: 160)
        bg.size = CGSize(width: 480, height: 320)
        bg.zPosition = 0
        addChild(bg)
        
        // Celebrating athlete animation
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = "\(charType)Festeja"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: "\(charType)Festeja")
        
        let athlete = SKSpriteNode(texture: textures.first ?? SKTexture())
        athlete.size = CGSize(width: 90, height: 90)
        athlete.position = CGPoint(x: 240, y: 185)
        athlete.zPosition = 10
        addChild(athlete)
        
        if !textures.isEmpty {
            athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1)))
        }
        
        // Medal icon
        let medal = SKSpriteNode(imageNamed: "medalGold.png")
        medal.position = CGPoint(x: 240, y: 250)
        medal.size = CGSize(width: 45, height: 45)
        medal.zPosition = 12
        addChild(medal)
        
        // Score display banner
        let scoreBanner = SKShapeNode(rectOf: CGSize(width: 220, height: 36), cornerRadius: 6)
        scoreBanner.position = CGPoint(x: 240, y: 25)
        scoreBanner.fillColor = SKColor(white: 0.0, alpha: 0.6)
        scoreBanner.strokeColor = .yellow
        scoreBanner.zPosition = 15
        addChild(scoreBanner)
        
        let scoreLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        let disc = GameState.shared.currentDiscipline
        let isTrack = (disc == .dash100m || disc == .dash400m || disc == .hurdles)
        let unit = isTrack ? "s" : "m"
        scoreLabel.text = String(format: "RESULT: %04.2f%@", GameState.shared.lastScore, unit)
        scoreLabel.fontSize = 14
        scoreLabel.fontColor = .yellow
        scoreLabel.position = CGPoint(x: 240, y: 20)
        scoreLabel.zPosition = 16
        addChild(scoreLabel)
        
        // Navigation Buttons
        let homeBtn = SKSpriteNode(imageNamed: "btnHome.png")
        homeBtn.position = CGPoint(x: 50, y: 35)
        homeBtn.size = CGSize(width: 48, height: 48)
        homeBtn.name = "btnHome"
        homeBtn.zPosition = 20
        addChild(homeBtn)
        
        let retryBtn = SKSpriteNode(imageNamed: "btnRetry.png")
        retryBtn.position = CGPoint(x: 430, y: 35)
        retryBtn.size = CGSize(width: 48, height: 48)
        retryBtn.name = "btnRetry"
        retryBtn.zPosition = 20
        addChild(retryBtn)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            guard let name = node.name else { continue }
            SoundManager.shared.playSound(named: "Click.caf")
            
            if name == "btnHome" {
                let menu = MenuScene(size: CGSize(width: 480, height: 320))
                menu.scaleMode = .aspectFit
                view?.presentScene(menu, transition: SKTransition.fade(withDuration: 0.4))
                return
            } else if name == "btnRetry" {
                let disc = GameState.shared.currentDiscipline
                let transition = SKTransition.fade(withDuration: 0.4)
                switch disc {
                case .dash100m, .dash400m, .hurdles:
                    let scene = RunningScene(size: CGSize(width: 480, height: 320))
                    scene.scaleMode = .aspectFit
                    view?.presentScene(scene, transition: transition)
                case .longJump, .javelin:
                    let scene = FieldScene(size: CGSize(width: 480, height: 320))
                    scene.scaleMode = .aspectFit
                    view?.presentScene(scene, transition: transition)
                }
                return
            }
        }
    }
}
