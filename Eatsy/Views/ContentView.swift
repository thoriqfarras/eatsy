//
//  ContentView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    @State var showOnboarding:Bool = false // ortu
    @State var showButton:Bool = true
    
    var body: some View {
        TabView{
            TodayView(showOnboarding: $showOnboarding, showButton: $showButton)
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            ScheduleView()
                .tabItem{
                    Label("Schedule", systemImage: "calendar")
                }
        }
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding)
        }
    }
}

#Preview {
    ContentView()
}
