//
//  AppDelegate.swift
//  SnapShotSample
//
//  Created by Alexandre  Vassinievski on 05/10/19.
//  Copyright © 2019 Alexandre  Vassinievski. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   // var defaultContainer: DefaultContainer!
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        //setup firebase services if needed
        //setup crashlytics if needed

        // Start AppCoordinator
        let currentWindow = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: currentWindow)
        self.appCoordinator?.start()
        self.window = currentWindow
        self.window?.makeKeyAndVisible()

        return true
    }

}
