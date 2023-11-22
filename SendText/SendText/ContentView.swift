//
//  ContentView.swift
//  SendText
//
//  Created by 정정욱 on 11/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.level.description)
            Text(viewModel.session.isReachable ? "Reachable" : "UnReachable")
            TextField("insert name", text: $viewModel.message)
            Button {
                viewModel.level += 1
                viewModel.session.sendMessage(["message" :  viewModel.message], replyHandler: nil) // 애플워치로 메세지 보내기 
            } label: {
                Text("UP")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


import WatchConnectivity // 와치앱과 연동시 필수임

final class ContentViewModel: NSObject, WCSessionDelegate, ObservableObject{
  
    
        
    var session: WCSession
    @Published var level: Int = 0
    @Published var message: String = ""
    
    init(session: WCSession = .default) {
   
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
   
}
