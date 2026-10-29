import SpriteKit

public class MedalsScene: SKScene {
    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.1, green: 0.2, blue: 0.45, alpha: 1.0)
        
        setupCelebration()
        setupResults()
        setupButtons()
        
        SoundManager.shared.playSound(named: "Crowd_cheer.caf")
    }
    
    private func setupCelebration() {
        let charType = GameState.shared.selectedCharacter.rawValue
        let atlasName = "\(charType)Festeja"
        let textures = AtlasLoader.shared.getAnimationSequence(atlasName: atlasName, prefix: "\(charType)Festeja")
        
        let athlete = SKSpriteNode(texture: textures.first ?? SKTexture())
        athlete.size = CGSize(width: 90, height: 90)
        athlete.position = CGPoint(x: 100, y: 150)
        addChild(athlete)
        
        if !textures.isEmpty {
            athlete.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1)))
        }
    }
    
    private func setupResults() {
        let disc = GameState.shared.currentDiscipline
        
        let titleLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        titleLabel.text = disc.title.uppercased()
        titleLabel.fontSize = 22
        titleLabel.fontColor = .yellow
        titleLabel.position = CGPoint(x: 240, y: 280)
        addChild(titleLabel)
        
        let isTimed = (disc == .dash100m || disc == .dash400m || disc == .hurdles)
        let scoreStr = isTimed ? String(format: "TIME: %.2f seconds", GameState.shared.lastScore) : String(format: "DISTANCE: %.2f meters", GameState.shared.lastScore)
        
        let scoreLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        scoreLabel.text = scoreStr
        scoreLabel.fontSize = 18
        scoreLabel.fontColor = .white
        scoreLabel.position = CGPoint(x: 290, y: 235)
        addChild(scoreLabel)
        
        if GameState.shared.isNewRecord {
            let recordBanner = SKLabelNode(fontNamed: "Helvetica-Bold")
            recordBanner.text = "★ NEW RECORD! ★"
            recordBanner.fontSize = 16
            recordBanner.fontColor = .green
            recordBanner.position = CGPoint(x: 290, y: 210)
            addChild(recordBanner)
        }
        
        // High Scores from SQLite DB
        let recordsTitle = SKLabelNode(fontNamed: "Helvetica-Bold")
        recordsTitle.text = "HALL OF FAME (foDB14.sqlite):"
        recordsTitle.fontSize = 13
        recordsTitle.fontColor = .lightGray
        recordsTitle.position = CGPoint(x: 290, y: 175)
        addChild(recordsTitle)
        
        let records = DatabaseManager.shared.getRecords(forDiscipline: disc.rawValue).prefix(3)
        var yOffset: CGFloat = 150
        for (i, r) in records.enumerated() {
            let entry = SKLabelNode(fontNamed: "Helvetica")
            let unit = isTimed ? "s" : "m"
            entry.text = "\(i + 1). \(r.name) - \(String(format: "%.2f", r.score))\(unit)"
            entry.fontSize = 13
            entry.fontColor = .white
            entry.position = CGPoint(x: 290, y: yOffset)
            addChild(entry)
            yOffset -= 22
        }
    }
    
    private func setupButtons() {
        let menuBtn = SKShapeNode(rectOf: CGSize(width: 140, height: 40), cornerRadius: 8)
        menuBtn.position = CGPoint(x: 240, y: 45)
        menuBtn.fillColor = SKColor(red: 0.2, green: 0.6, blue: 0.9, alpha: 1.0)
        menuBtn.strokeColor = .white
        menuBtn.name = "btnMenu"
        addChild(menuBtn)
        
        let menuLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        menuLabel.text = "MAIN MENU"
        menuLabel.fontSize = 14
        menuLabel.fontColor = .white
        menuLabel.position = CGPoint(x: 240, y: 39)
        menuLabel.name = "btnMenu"
        addChild(menuLabel)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            if node.name == "btnMenu" {
                SoundManager.shared.playSound(named: "Click.caf")
                let scene = MenuScene(size: CGSize(width: 480, height: 320))
                scene.scaleMode = .aspectFit
                view?.presentScene(scene, transition: SKTransition.fade(withDuration: 0.4))
            }
        }
    }
}

