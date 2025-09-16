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
    
    @StateObject private var user: UserViewModel
    @StateObject private var recommendation: RecommendationViewModel
    
    
    init() {
        let userViewModel = UserViewModel()
        let recommendationViewModel = RecommendationViewModel(userViewModel: userViewModel)
        
        _user = StateObject(wrappedValue: userViewModel)
        _recommendation = StateObject(wrappedValue: recommendationViewModel)
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                TodayView(showOnboarding: $showOnboarding, showButton: $showButton, enableButton: $enableButton, showRecommendation:$showRecommendation, mealType: .breakfast)
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
//            NavigationStack {
//                TomorrowView()
//            }
//            .tabItem {
//                Label("Tommorow", systemImage: "calendar")
//            }

        }
        .accentColor(.primaryGreen)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding, showButton: $showButton).environmentObject(user).environmentObject(recommendation)
        }
        
    }
}

#Preview {
    ContentView()
}
