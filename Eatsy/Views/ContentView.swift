//
//  ContentView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TodayView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            ScheduleView()
                .tabItem{
                    Label("Schedule", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    ContentView()
}
