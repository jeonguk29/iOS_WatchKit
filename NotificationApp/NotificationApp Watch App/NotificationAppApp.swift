//
//  NotificationAppApp.swift
//  NotificationApp Watch App
//
//  Created by 정정욱 on 11/25/23.
//

import SwiftUI

@main
struct NotificationApp_Watch_AppApp: App {
    
    private let localNotification = LocalNotifications()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WKNotificationScene(controller: NotificationController.self, category: "myNotification")
    }
}
