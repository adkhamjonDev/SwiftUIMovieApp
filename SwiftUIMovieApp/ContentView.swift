//
//  ContentView.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 21/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            HomeScreen()
        }
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
