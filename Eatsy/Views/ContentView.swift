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
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        
        // ✅ tambahkan garis tipis di atas tab bar
        appearance.shadowColor = UIColor.lightGray
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var viewModel = UserViewModel()
    
    var body: some View {
        TabView {
            NavigationStack {
                TodayView(showOnboarding: $showOnboarding, showButton: $showButton)
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationStack {
                ScheduleView()
            }
            .tabItem {
                Label("Schedule", systemImage: "calendar")
            }
        }
        .accentColor(.primaryGreen)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding, showButton: $showButton)
        }
    }
}

#Preview {
    ContentView()
}
