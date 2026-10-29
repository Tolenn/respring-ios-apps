import UIKit
import SpriteKit

public class GameViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = SKView(frame: view.bounds)
        skView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        skView.ignoresSiblingOrder = true
        view.addSubview(skView)
        
        // Present initial 480x320 landscape canvas with aspectFit letterboxing
        let scene = MenuScene(size: CGSize(width: 480, height: 320))
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
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

