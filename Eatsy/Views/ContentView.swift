//
//  ContentView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    @State var showOnboarding:Bool = false // ortu
    @State var showButton:Bool = false
    @State var enableButton: Bool = false
    @State var showRecommendation: Bool = false
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor.systemBackground
//        appearance.shadowColor = UIColor.lightGray
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @StateObject var user = UserViewModel()
    
    var body: some View {
        TabView {
            NavigationStack {
                TodayView(showOnboarding: $showOnboarding, showButton: $showButton, enableButton: $enableButton, showRecommendation:$showRecommendation)
                    .environmentObject(user)
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
            
            NavigationStack {
                TomorrowView()
            }
            .tabItem {
                Label("Tommorow", systemImage: "calendar")
            }

        }
        .accentColor(.primaryGreen)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding, showButton: $showButton).environmentObject(user)
        }
        
    }
}

#Preview {
    ContentView()
}
