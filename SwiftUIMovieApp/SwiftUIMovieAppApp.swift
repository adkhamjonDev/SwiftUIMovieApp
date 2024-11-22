//
//  SwiftUIMovieAppApp.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 21/11/24.
//

import SwiftUI

@main
struct SwiftUIMovieAppApp: App {
    
    @StateObject private var homeViewModel:HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeScreen()
            }
            .environmentObject(homeViewModel)
        }
    }
}
