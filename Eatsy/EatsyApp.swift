//
//  EatsyApp.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

@main
struct EatsyApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .onAppear {
                        // setelah 2 detik, animasi hilang
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}


