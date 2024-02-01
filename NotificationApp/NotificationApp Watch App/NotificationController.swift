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
    
    var name: String = ""
    var imageName: String = ""
    
    // 알림이 온다면 아래와 같은 화면을 그려줘
    override var body: NotificationView {
        return NotificationView(name: name, imageNmae: imageName)
    }
    
    // 알람이 올때 해당 데이터에서 파싱할 값들을 정의 한다고 보면 됨
    override func didReceive(_ notification: UNNotification) {
        // 알람 데이터를 받아서 안에서 원하는 값을 사용하면 됩니다.
        let content = notification.request.content
        
        name = content.body
        imageName = "logo"
    }
}
