//
//  ContentView.swift
//  SendText Watch App
//
//  Created by 정정욱 on 11/17/23.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.message)
        }
        .padding()
    }
}

import WatchConnectivity
final class ContentViewModel: NSObject,WCSessionDelegate,ObservableObject {
  
    
    
    var session: WCSession
    @Published var level: Int = 0 // 값을 받기위해
    @Published var message: String = "" // 값을 받기위해
    init(session: WCSession = .default) {
   
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.message = message["message"] as? String ?? ""
        }
    }
    
  
}

#Preview {
    ContentView()
}
