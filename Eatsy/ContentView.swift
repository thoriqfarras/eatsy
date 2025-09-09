//
//  ContentView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Tian")
            Text("Korneel")
            Text("Ini Baru Tian")
            Text("Ini Baru Kornel")
            Text("Ini Thoriq")
        }
        .padding(10).background(Color.green)
        HStack {
            Text("Ini text ada di HStack")
            Text("Ini text juga ada di HStack")
        }.padding().background(Color.blue)
    }
}

#Preview {
    ContentView()
}
