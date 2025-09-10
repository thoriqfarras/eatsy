//
//  ContentView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    @State var showOnboarding = false // ortu
    
    var body: some View {
        TabView{
            TodayView(showOnboarding: $showOnboarding)
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
