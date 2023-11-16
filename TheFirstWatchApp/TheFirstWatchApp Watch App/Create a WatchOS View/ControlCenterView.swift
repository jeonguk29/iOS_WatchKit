//
//  ControlCenterView.swift
//  TheFirstWatchApp Watch App
//
//  Created by 정정욱 on 11/16/23.
//


import SwiftUI



struct ControlCenterView: View {
    // Hashable 프로토콜을 채택한 구조체는 id: \.self 형식의 식별자를 사용할 수 있음
    struct CellInfo: Hashable {
        let imageName : String
        let backgroundColor : Color
    }
    
    var items = [CellInfo(imageName: "wifi", backgroundColor: .blue),
                CellInfo(imageName: "iphone.gen2.radiowaves.left.and.right", backgroundColor: .red),
                CellInfo(imageName: "100%", backgroundColor: .brown),
                CellInfo(imageName: "bell.fill", backgroundColor: .yellow),
                CellInfo(imageName: "theatermasks.fill", backgroundColor: .blue),
                CellInfo(imageName: "person.fill", backgroundColor: .red),
    
    ]
    
    var colums: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
//            HStack{
//                MenuButton(buttonBackgroundColor: .blue, buttonImage: "wifi")
//                MenuButton(buttonBackgroundColor: .red, buttonImage: "iphone.gen2.radiowaves.left.and.right")
//            }
//            
//            HStack{
//                MenuButton(buttonBackgroundColor: .brown)
//                MenuButton(buttonBackgroundColor: .yellow, buttonImage: "bell.fill")
//            }
//            
//            HStack{
//                MenuButton(buttonBackgroundColor: .blue, buttonImage: "theatermasks.fill")
//                MenuButton(buttonBackgroundColor: .red, buttonImage: "person.fill")
//            }
           
            LazyVGrid(columns: colums) {
                ForEach(items, id: \.self) { item in
                    MenuButton(buttonBackgroundColor: item.backgroundColor, buttonImage: item.imageName)
                }
            }
          
        }
    }
}

struct MenuButton: View {
    @State var isButtonTapped: Bool = false
    @State var buttonBackgroundColor: Color = .black
    @State var buttonImage: String = "100%"
    
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .frame(height: 60)
                    .cornerRadius(30)
                    .foregroundColor( isButtonTapped ? buttonBackgroundColor : .gray)
                    .onTapGesture {
                        isButtonTapped.toggle()
                    }
                    .overlay {
                        if buttonImage == "100%" {
                            Text(buttonImage)
                                .bold()
                                .font(.title2)
                        }
                        Image(systemName: buttonImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .foregroundColor( isButtonTapped ? .white : .secondary)
                    }
            }
            
        }
    }
    
    
}

#Preview {
    ControlCenterView()
}


/*
 코드 설명
 CellInfo 구조체가 Hashable 프로토콜을 채택한 이유는 CellInfo 인스턴스들을 비교하고 식별하기 위해서입니다. CellInfo 구조체는 이미지 이름(imageName)과 배경색(backgroundColor)을 속성으로 가지고 있으며, 이를 통해 각 CellInfo 인스턴스를 고유하게 식별할 수 있습니다.

 CellInfo 구조체는 배열 items에 사용되고 있으며, 배열의 요소들을 ForEach 뷰에서 식별하기 위해 id: \.self 식별자를 사용하고 있습니다. 이때 CellInfo 구조체가 Hashable 프로토콜을 채택하면 \.self 식별자를 사용할 수 있습니다.

 또한, var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) 코드는 columns 변수를 선언하고, GridItem 타입의 배열을 생성하는 코드입니다. GridItem은 SwiftUI에서 그리드 레이아웃을 구성하는 데 사용되는 아이템을 나타내는 타입입니다. 이 코드에서는 .flexible() 스타일의 GridItem을 2개로 구성한 배열을 생성하여 columns 변수에 할당하고 있습니다. 이를 통해 뷰의 그리드 레이아웃을 설정할 수 있습니다.
 */
