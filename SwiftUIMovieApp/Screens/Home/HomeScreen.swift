//
//  HomeScreen.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 21/11/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        ZStack {
            Color.themeColors.backgoundColor.ignoresSafeArea()
            ScrollView(showsIndicators: false){
                
            }
        }
        .navigationTitle("Movies")
       
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}
