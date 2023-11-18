//
//  TipsVIew.swift
//  TheFirstWatchApp Watch App
//
//  Created by 정정욱 on 11/17/23.
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                  Text("DetailView")
                } label: {
                    VStack {
                        HStack{
                            Spacer()
                            Image(systemName: "applewatch.watchface")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .padding(.vertical, 20)
                        }
                        
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Welcome to")
                                    .bold()
                                Text("Apple watch")
                                    .bold()
                                Text("9 tips")
                                    .font(.caption2)
                                    .opacity(0.7)
                                
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                   
                }
             
                
                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "sparkles")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .padding(.vertical, 20)
                    }
                    
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Welcome to")
                                .bold()
                            Text("Apple watch")
                                .bold()
                            Text("9 tips")
                                .font(.caption2)
                                .opacity(0.7)
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
               
                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "paintpalette")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .padding(.vertical, 20)
                    }
                    
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Welcome to")
                                .bold()
                            Text("Apple watch")
                                .bold()
                            Text("9 tips")
                                .font(.caption2)
                                .opacity(0.7)
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
        
            }
            .listStyle(.carousel)
            .navigationTitle("Tips")
 
        }
    }
}


#Preview {
    TipsView()
}
