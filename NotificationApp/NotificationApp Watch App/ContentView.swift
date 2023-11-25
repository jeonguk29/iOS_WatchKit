//
//  ContentView.swift
//  NotificationApp Watch App
//
//  Created by 정정욱 on 11/25/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear{
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound]){ granted, error in
                    
                    if granted {
                        
                        print("로컬 알림 권한이 허용되었습니다")
                    } else {
                        print("로컬 알림 권한이 허용되지 않았습니다")
                    }
                }
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
