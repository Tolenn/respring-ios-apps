import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = GameViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .landscape
    }

    func applicationWillResignActive(_ application: UIApplication) {
        SoundManager.shared.pauseMusic()
        GameState.shared.save()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        SoundManager.shared.pauseMusic()
        GameState.shared.save()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        SoundManager.shared.resumeMusic()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        GameState.shared.save()
    }
}

