//
//  TodayView.swift
//  Eatsy
//
//  Created by Mac on 09/09/25.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Today's Meal Plan").bold()
                Spacer()
                Button(action:{}){
                    Image(systemName: "plus")
                }
            }.padding(12)
            
            Button(action:{}){
                Text("Get Meal Plan")
            }.foregroundStyle(.white)
                .padding(.horizontal, 100)
                .padding(.vertical, 10)
                .background(Color.green)
            
            HStack {
                Text("")
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
