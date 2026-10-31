import UIKit
import SpriteKit

public class GameViewController: UIViewController {
    private var skView: SKView?
    private var hasPresentedInitialScene = false

    /// Computes Corona's logical letterbox resolution (`config.lua` + `main.lua:9-38`):
    /// Fixed logical height = 600, dynamic logical width = 600 * (deviceLandscapeWidth / deviceLandscapeHeight)
    /// (e.g., 800x600 on 4:3 iPad, 1066x600 on 16:9 iPhone, 1300x600 on 19.5:9 iPhone).
    public static func logicalSceneSize(for bounds: CGRect) -> CGSize {
        let w = max(bounds.width, bounds.height)
        let h = max(1.0, min(bounds.width, bounds.height))
        let aspect = w / h
        let logicalHeight: CGFloat = 600.0
        let logicalWidth = max(800.0, round(logicalHeight * aspect))
        return CGSize(width: logicalWidth, height: logicalHeight)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        let view = SKView(frame: self.view.bounds)
        view.backgroundColor = .black
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.ignoresSiblingOrder = true
        view.preferredFramesPerSecond = 60
        self.view.addSubview(view)
        self.skView = view

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleWillResignActive),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let skView = self.skView else { return }
        skView.frame = self.view.bounds
        let targetSize = Self.logicalSceneSize(for: self.view.bounds)

        if !hasPresentedInitialScene {
            hasPresentedInitialScene = true
            let scene = SplashScene(size: targetSize)
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        } else if let currentScene = skView.scene, abs(currentScene.size.width - targetSize.width) > 2.0 {
            // Re-present active scene at updated full-screen logical dimensions if view bounds changed
            if currentScene is SplashScene {
                let next = SplashScene(size: targetSize)
                next.scaleMode = .aspectFill
                skView.presentScene(next)
            } else if currentScene is CampaignMapScene {
                let next = CampaignMapScene(size: targetSize)
                next.scaleMode = .aspectFill
                skView.presentScene(next)
            } else if let battle = currentScene as? BattlefieldScene {
                let next = BattlefieldScene(size: targetSize)
                next.levelNumber = battle.levelNumber
                next.scaleMode = .aspectFill
                skView.presentScene(next)
            } else if currentScene is ArmoryScene {
                let next = ArmoryScene(size: targetSize)
                next.scaleMode = .aspectFill
                skView.presentScene(next)
            } else if currentScene is BattleOverScene {
                let next = BattleOverScene(size: targetSize)
                next.scaleMode = .aspectFill
                skView.presentScene(next)
            }
        }
    }

    @objc private func handleWillResignActive() {
        skView?.isPaused = true
    }

    @objc private func handleDidBecomeActive() {
        skView?.isPaused = false
    }

    public override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .all
    }

    public override var shouldAutorotate: Bool {
        return true
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    public override var prefersStatusBarHidden: Bool {
        return true
    }

    public override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}

