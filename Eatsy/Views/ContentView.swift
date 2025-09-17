//
//  ContentView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    @State var showOnboarding: Bool = false
    @State var showButton: Bool = false
    @State var enableButton: Bool = false
    @State var showRecommendation: Bool = false
    @State private var showProfile = false  // State untuk profile navigation
    @State private var selectedTab = 0      // Track tab yang aktif
    
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
            
            // Set navigation back button color to primaryGreen
            UINavigationBar.appearance().tintColor = UIColor(named: "PrimaryGreen")
            
            // More specific navigation appearance
            let navAppearance = UINavigationBarAppearance()
            navAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = navAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Custom Toolbar
                HStack {
                    Text(selectedTab == 0 ? "Today's Meal Plan" : "Schedule")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        showProfile = true
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.black)
                            .padding(6)
                            .background(Color("defaultBackground"))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 8)
                .background(Color("defaultBackground"))
                
                // Tab Content
                TabView(selection: $selectedTab) {
                    TodayView(
                        showOnboarding: $showOnboarding,
                        showButton: $showButton,
                        enableButton: $enableButton,
                        showRecommendation: $showRecommendation,
                    )
                    .environmentObject(user)
                    .environmentObject(recommendation)
                    .tag(0)
                    .tabItem {
                        Label("Today", systemImage: "house.fill")
                    }
                    
                    ScheduleView()
                        .tag(1)
                        .tabItem {
                            Label("Schedule", systemImage: "calendar")
                        }
                }
                .accentColor(.primaryGreen)
            }
            .background(Color("defaultBackground"))
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showOnboarding) {
                OnboardingView(showOnboarding: $showOnboarding, showButton: $showButton)
                    .environmentObject(user)
                    .environmentObject(recommendation)
            }
            .navigationDestination(isPresented: $showProfile) {
                ProfileView()
                    .environmentObject(user)
            }
        }
        .tint(Color("PrimaryGreen"))
    }
}

#Preview {
    ContentView()
}
