//
//  AppDelegate.swift
//  moviecatalogue
//
//  Created by João Gameiro on 05/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        takeMeHome()
        return true
    }

    func takeMeHome() {
        window?.overrideUserInterfaceStyle = .light

        let mainViewController = MainView.instantiateFromStoryboard(MAIN_STORYBOARD)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.isNavigationBarHidden = true

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
