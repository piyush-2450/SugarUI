//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = BaseViewController()
		window?.makeKeyAndVisible()

        return true
    }
}

#elseif canImport(AppKit)

import AppKit

@main
final class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentRect: NSRect(x: 0,
                                              y: 0,
                                              width: 1920,
                                              height: 1080),
                          styleMask: [
                            .miniaturizable,
                            .closable,
                            .resizable,
                            .titled
                          ],
                          backing: .buffered,
                          defer: false)
        window.center()
        window.title = "SugarUI Demo"
        window.contentViewController = BaseViewController()
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

#endif
