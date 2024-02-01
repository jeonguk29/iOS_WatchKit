//
//  LocalNotifications.swift
//  NotificationApp Watch App
//
//  Created by 정정욱 on 2/1/24.
//

import Foundation
import UserNotifications

final class LocalNotifications: NSObject {
    
    private let categoryIdentifier = "custom"
    private let actionIdentifier = "notiAction"
    
    override init() {
        super.init()
        
        Task {
            do {
                try await register() // 등록
                try await schedule() // 시간 설정하고 알람 실행
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
    
    private func register() async throws {
        let current = UNUserNotificationCenter.current()
        try await current.requestAuthorization(options: [.alert, .sound])
        
        current.removeAllDeliveredNotifications()
        
        let action = UNNotificationAction(identifier: actionIdentifier, title: "Come in!", options: .foreground)
        
        let category = UNNotificationCategory(identifier: categoryIdentifier, actions: [action], intentIdentifiers: [])
        
        current.setNotificationCategories([category])
        current.delegate = self
        
    }
    
    // 등록했으면 스케쥴 만들어줘야함 언제 알림을 보여줄지
    func schedule() async throws {
        let current = UNUserNotificationCenter.current()
        let settings = await current.notificationSettings()
        
        guard settings.alertSetting == .enabled else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "Woogie is comming!"
        content.subtitle = "now...behind you"
        content.body = "Run and run"
        content.categoryIdentifier = categoryIdentifier
        
        let components = DateComponents(second: 3)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let requset = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        try await current.add(requset)
        
    }
}


extension LocalNotifications: UNUserNotificationCenterDelegate {
    
    // 나타날때 소리와 리스트 함께 나타나게 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.list, .sound]
    }
}

