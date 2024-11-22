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

    @State private var showDetail:Bool = false
    @State private var selectedMovie:MovieModel?=nil
    
    var body: some View {
        
        ZStack {
            Color.themeColors.backgoundColor.ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: gridColumns1,spacing: 0){
                    ForEach(viewModel.movieList,id:\.id){ item in
                                        NavigationLink(
                                            destination: MovieDetailScreen(movieModel: item)
                                        ) {
                                            MovieItemGrid1(movieModel: item)
                                                .onAppear{
                                                    if item == viewModel.movieList.last {
                                                        viewModel.loadMoreMovies()
                                                    }
                                        }
                                }
                            }
                    }
                }
            }
            .accentColor(Color.themeColors.backgoundColor)
            .navigationTitle("Movies")
            
        }
//        .background(
//            NavigationLink(
//                destination: MovieDetailScreen(),
//                isActive: $showDetail,
//                label: { EmptyView() }
//            )
//        )
    
}

extension HomeScreen {
    func tapToMovie(movie:MovieModel){
        showDetail.toggle()
        selectedMovie = movie
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
            .environmentObject(HomeViewModel())
    }

}
