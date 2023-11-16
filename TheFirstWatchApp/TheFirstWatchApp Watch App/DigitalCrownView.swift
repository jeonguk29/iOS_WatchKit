//
//  ContentView.swift
//  TheFirstWatchApp Watch App
//
//  Created by 정정욱 on 11/16/23.


// HIG에 따르면 WatchOS는 기본적으로 검은색 배경을 사용해달라고 함

import SwiftUI



struct DigitalCrownView: View {
    @State var welcomeMessage: String = "Hi I'm Woogie"
    @State var count: Float = 0
    
    var body: some View {
        VStack {
            Image("git")
                .resizable()
                .scaledToFit()
            Text(welcomeMessage)
                .onTapGesture {
                    welcomeMessage = "안녕하세요 우기 입니다!"
                }
            
            Text("\(count, specifier: "%.1f")")
                .focusable()
                .digitalCrownRotation($count, from: 0.0, through: 25.0, sensitivity: .low, isContinuous: true,
                    isHapticFeedbackEnabled: true)
            
            /*
            specifier: "%.1f"
            이 부분은 count라는 변수 값을 소수점 한 자리까지 표시하는 텍스트를 생성합니다.
            예를 들어, count 값이 3.14라면 텍스트로 "3.1"이 표시됩니다.
            .focusable()
            Text 뷰에 대한 포커스를 가능하게 만듭니다.
            이를 통해 사용자가 디지털 크라운을 사용하여 값을 조절할 수 있습니다.
            .digitalCrownRotation(...)
            Text 뷰에 디지털 크라운을 연결하여 값을 조절하는 기능을 추가합니다.
            $count는 count 변수에 값을 바인딩합니다. 디지털 크라운으로 조절한 값은 count 변수에 저장됩니다.
            from 매개변수는 디지털 크라운으로 조절할 수 있는 값의 최소 범위를 지정합니다. 여기서는 0.0으로 설정되어 있습니다.
            through 매개변수는 디지털 크라운으로 조절할 수 있는 값의 최대 범위를 지정합니다. 여기서는 25.0으로 설정되어 있습니다.
            sensitivity 매개변수는 디지털 크라운의 감도를 설정합니다. .low, .medium, .high 중 하나를 선택할 수 있습니다.
            isContinuous 매개변수는 디지털 크라운을 계속해서 회전할 수 있는지 여부를 설정합니다. true로 설정하면 계속 회전할 수 있습니다.
            isHapticFeedbackEnabled 매개변수는 디지털 크라운을 회전할 때 햅틱 피드백을 활성화할지 여부를 설정합니다. true로 설정하면 활성화됩니다.
            */
            
            
        }
        .padding()
    }
}

#Preview {
    DigitalCrownView()
}
