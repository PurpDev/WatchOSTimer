//
//  WatchOSTimerApp.swift
//  WatchOSTimer WatchKit Extension
//
//  Created by Augustin Diabira on 01/07/2022.
//

import SwiftUI

@main
struct WatchOSTimerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
