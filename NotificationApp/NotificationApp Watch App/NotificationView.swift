//
//  NotificationController.swift
//  NotificationApp Watch App
//
//  Created by 정정욱 on 11/25/23.
//

import SwiftUI


struct NotificationView: View {
    var name: String = "Woogie"
    var imageNmae: String = "logo"
    var body: some View {
        Image(imageNmae)
            .resizable()
            .scaledToFit()
        Text("Hello, \(name)")
    }
}

#Preview {
    NotificationView()
}
