//
//  HomeViewM.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 21/11/24.
//
import Foundation
import Combine
import Observation
import Alamofire


class HomeViewModel:ObservableObject {
    
    @Published var movieList:[MovieModel] = []
    private let movieService = MovieService()

    init() {
        fetchMovies()
    }
    
    private func fetchMovies() {
        movieService.$movies
                   .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
                   .assign(to: &$movieList)
        
    }
    
    func loadMoreMovies(of movie:MovieModel) {
        if ( movieList.last?.id == movie.id ) {
            movieService.getPaginatedMovies()
        }
    }
    
}
