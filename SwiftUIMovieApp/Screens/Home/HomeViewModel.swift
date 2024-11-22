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
    private var currentPage: Int = 1
    
    private var totalPages:Int = 0
    
    init() {
        fetchMovies()
    }
    
    private func fetchMovies() {
        movieService.$movies
                   .receive(on: DispatchQueue.main)
                   .assign(to: &$movieList)
        
    }
    
    func loadMoreMovies() {
        movieService.getPaginatedMovies()
    }
    
}
