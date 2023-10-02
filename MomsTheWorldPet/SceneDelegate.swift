//
//  SceneDelegate.swift
//  Mum’s the word
//
//  Created by Kiri4of on 23.04.2023.
//

import UIKit
import Hero

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?
    
    private var rootController: UINavigationController {
        let navigationController = UINavigationController()
        navigationController.hero.isEnabled = true
        window?.rootViewController = navigationController
        return window?.rootViewController as! UINavigationController
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        Hero.shared.containerColor = UIColor.white
        window = UIWindow(windowScene: windowScene)
        appRouter = createRouter()
        appRouter?.showSplash(scene: (scene as? UIWindowScene)!) { [weak self] in
            guard let self else { return }
            if isFirstLaunch() {
                self.appRouter?.showOnboarding()
                UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBefore")
            } else {
                self.appRouter?.showStart()
            }
            self.window?.overrideUserInterfaceStyle = .light
            self.window?.makeKeyAndVisible()
        }
    }
}

private extension SceneDelegate {
    func createRouter() -> AppRouter {
        let navigationRouter = NavigationRouter(navigationController: rootController)
        let appRouter = AppRouter(navigationRouter: navigationRouter)
        return appRouter
    }
    
    func isFirstLaunch() -> Bool{
        let key = "hasBeenLaunchedBefore"
        let hasBeenLaunchedBefore = UserDefaults.standard.bool(forKey: key)
        return !hasBeenLaunchedBefore
    }
}
