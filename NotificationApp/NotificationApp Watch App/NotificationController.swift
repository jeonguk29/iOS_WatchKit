//
//  NotificationController.swift
//  NotificationApp Watch App
//
//  Created by 정정욱 on 11/25/23.
//

import UserNotifications
import WatchKit
import SwiftUI

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    var message: String = ""
    
    // 알림이 온다면 아래와 같은 화면을 그려줘
    override var body: NotificationView {
        return NotificationView()
    }
    
    override func didReceive(_ notification: UNNotification) {
        message = "woogie"
    }
}
