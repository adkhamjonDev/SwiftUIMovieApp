//
//  HomeScreen.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 21/11/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject private var viewModel:HomeViewModel
    
    private let gridColumns1: [GridItem] = [
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        
        ZStack {
            Color.themeColors.backgoundColor.ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: gridColumns1,spacing: 0){
                    ForEach(viewModel.movieList,id:\.id){ item in
                        MovieItemGrid1(movieModel: item)
                            .task {
                                await viewModel.loadMoreMovies(of: item)
                            }
                            
                    }
                }
            }
            .accentColor(Color.themeColors.backgoundColor)
            .navigationTitle("Movies")
            
        }
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
            .environmentObject(HomeViewModel())
    }

}
