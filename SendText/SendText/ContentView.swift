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
                /*
                 sendMessage(_:replyHandler:) 메서드: WatchConnectivity 세션을 통해 메시지를 보내는 메서드입니다.
                 첫 번째 매개변수 ["message" : viewModel.message]: 전송할 메시지를 [String: Any] 타입의 딕셔너리로 지정합니다. 이 경우 "message"라는 키에 viewModel.message의 값인 문자열을 지정하고 있습니다. 이 딕셔너리는 Watch 앱에서 수신할 때 사용됩니다.
                 */
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
    // WCSessionDelegate 프로토콜을 채택한 클래스로, WatchConnectivity 프레임워크를 사용하여 애플 워치와의 연동을 관리합니다.
    // ObservableObject 프로토콜을 채택하여 데이터의 변경을 감지하고 뷰에 업데이트를 알립니다.
    
        
    var session: WCSession //  WatchConnectivity 세션 객체
    //@Published 속성 감시자를 사용하여 변경을 감지
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
