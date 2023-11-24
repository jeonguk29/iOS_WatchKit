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


/*
 ContentView 구조체에서 ContentViewModel을 생성하는 이유는 Watch 앱에서도 데이터를 관리하고 WatchConnectivity 기능을 사용하기 위해서입니다. Watch 앱과 iOS 앱은 서로 다른 프로세스로 동작하며, 각각의 앱은 독립적으로 데이터를 관리하고 WatchConnectivity를 사용하여 통신합니다.

 Watch 앱에서도 데이터를 업데이트하고 뷰에 반영하기 위해, Watch 앱의 ContentView에서도 ContentViewModel을 생성하여 사용합니다. 이렇게 함으로써 Watch 앱에서도 ContentViewModel의 속성인 message 값을 읽을 수 있으며, WatchConnectivity를 통해 iOS 앱에서 전송한 메시지를 수신하여 message 값을 업데이트할 수 있습니다.

 따라서, ContentViewModel은 iOS 앱과 Watch 앱 간의 데이터 공유와 WatchConnectivity 기능을 사용하기 위해 iOS 앱과 Watch 앱 모두에서 생성되고 사용됩니다. 이를 통해 두 앱이 동기화된 데이터를 공유하고 상호작용할 수 있게 됩니다.
 
 그러면 프로세스는 달라서 각각 클래스를 각각의 프로젝트의 구현하는데 WCSession은 공유하는거네


 빨간양말테레사
 GPT-3.5
 네, 맞습니다. iOS 앱과 Watch 앱은 각각 독립된 프로세스로 동작하며, 서로 다른 프로젝트에서 구현됩니다.

 WatchConnectivity 프레임워크를 사용하여 iOS 앱과 Watch 앱 간의 통신을 위해 WCSession 객체를 사용합니다. 이 WCSession 객체는 iOS 앱과 Watch 앱 간에 데이터를 주고받을 수 있는 통로 역할을 합니다.

 WCSession 객체는 Watch 앱과 iOS 앱 간의 통신을 위해 Watch 앱과 iOS 앱 모두에서 생성되고 사용됩니다. 따라서, iOS 앱과 Watch 앱은 각각 독립적인 프로세스이지만 WCSession 객체를 공유하여 데이터를 주고받을 수 있습니다.

 iOS 앱에서 WCSession 객체를 생성하고 Watch 앱에서도 동일한 WCSession 객체를 사용하여 데이터를 주고받을 수 있습니다. 이를 통해 iOS 앱과 Watch 앱은 동기화된 데이터를 공유하고 WatchConnectivity 기능을 사용할 수 있습니다.
 */
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

/* 데이터 전송 받는 과정 정리
 Watch 앱에서의 코드:

 func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
     DispatchQueue.main.async {
         self.message = message["message"] as? String ?? ""
     }
 }
 
 session(_:didReceiveMessage:) 메서드: WatchConnectivity 세션에서 메시지를 수신할 때 호출되는 메서드입니다.
 첫 번째 매개변수 session: WatchConnectivity 세션 객체입니다.
 두 번째 매개변수 message: 수신한 메시지를 [String: Any] 타입의 딕셔너리로 전달받습니다. 이 예시에서는 "message"라는 키를 사용하여 메시지를 전달받습니다.
 DispatchQueue.main.async를 사용하여 메인 큐에서 비동기적으로 실행합니다. Watch 앱의 UI 업데이트를 위해 메인 스레드에서 실행해야 합니다.
 전달받은 메시지 딕셔너리에서 "message" 키에 해당하는 값을 self.message에 저장합니다. 만약 "message" 키가 없거나 값이 String 타입이 아니라면 빈 문자열("")을 대입합니다.
 Watch 앱에서는 WatchConnectivity를 통해 iOS 앱으로 메시지를 보낼 필요가 없기 때문에 해당 코드에서는 iOS 앱으로 메시지를 전송하는 부분은 없습니다.

 
 iOS 앱에서의 코드:

 viewModel.session.sendMessage(["message" : viewModel.message], replyHandler: nil)
 
 viewModel.session: ContentViewModel 클래스에서 선언한 WatchConnectivity 세션 객체입니다.
 sendMessage(_:replyHandler:) 메서드: WatchConnectivity 세션을 통해 메시지를 iOS 앱으로 전송하는 메서드입니다.
 첫 번째 매개변수 ["message" : viewModel.message]: 전송할 메시지를 [String: Any] 타입의 딕셔너리로 지정합니다. 이 경우 "message"라는 키에 viewModel.message의 값인 문자열을 지정하고 있습니다. 이 딕셔너리는 Watch 앱에서 수신할 때 사용됩니다.
 두 번째 매개변수 replyHandler: nil: Watch 앱이 응답을 보내는 경우 처리할 응답 핸들러입니다. 이 예시에서는 응답을 처리하지 않으므로 nil을 전달하고 있습니다.
 iOS 앱에서는 Watch 앱으로 메시지를 전송하기 위해 sendMessage(_:replyHandler:) 메서드를 사용합니다. 여기서는 "message" 키에 viewModel.message의 값을 담아 Watch 앱으로 전송합니다. Watch 앱에서는 위에서 설명한 session(_:didReceiveMessage:) 메서드를 통해 이 메시지를 수신하고 처리할 수 있습니다.
 */
