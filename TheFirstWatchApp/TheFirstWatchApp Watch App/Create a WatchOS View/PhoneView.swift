//
//  PhoneView.swift
//  TheFirstWatchApp Watch App
//
//  Created by 정정욱 on 11/16/23.
//


// HIG에 따르면 WatchOS는 기본적으로 검은색 배경을 사용해달라고 함

import SwiftUI



struct PhoneView: View {
    
    @State var inputData = ["test1", "test2", "test3"]
    
    var body: some View {
        
     
        
        NavigationStack {
            List{
                NavigationLink {
                    ListDetail(name: $inputData.first!)
                } label: {
                    Label(
                        title: { Text(inputData.first!) },
                        icon: {
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundColor(.green)
                        }
                    )
                }
                
                NavigationLink {
                    ListDetail(name: $inputData.first!)
                } label: {
                    Label(
                        title: { Text("Recents") },
                        icon: {
                            Image(systemName: "clock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundColor(.green)
                        }
                    )
                }
                NavigationLink {
                    ListDetail(name: $inputData.first!)
                } label: {
                    Label(
                        title: { Text("Contacts") },
                        icon: {
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundColor(.green)
                        }
                    )
                }
                
                
                
            }
            .navigationTitle("Phone")
        }
    }
}

struct ListDetail: View {
    @Binding var name: String
    
    var body: some View {
        Text(name)
        TextField("insert name", text: $name)
    }
}

#Preview {
    PhoneView()
}
