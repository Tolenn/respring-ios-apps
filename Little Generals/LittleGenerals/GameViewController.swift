import UIKit
import SpriteKit

public class GameViewController: UIViewController {
    private var skView: SKView?

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = SKView(frame: self.view.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.ignoresSiblingOrder = true
        view.preferredFramesPerSecond = 60
        self.view.addSubview(view)
        self.skView = view

        // Native 800x600 resolution as defined in Corona config.lu
        let scene = SplashScene(size: CGSize(width: 800, height: 600))
        scene.scaleMode = .aspectFit
        view.presentScene(scene)
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

