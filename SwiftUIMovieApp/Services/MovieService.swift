//
//  MovieService.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 22/11/24.
//

import Foundation
import Alamofire


class MovieService {
    
    @Published var movies:[MovieModel] = []
    
    @Published var hasMorePages: Bool = true
    
    private var currentPage: Int = 1
    
    init() {
        getPaginatedMovies()
    }
    
    func getPaginatedMovies() {
        
        guard hasMorePages else { return }
        
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=44f66b1676556437f4731985995f2dea&language=en-US&page=\(currentPage)"
        
        AF.request(url).responseDecodable(of: PagingResponse.self) { response in
            switch response.result {
            case .success(let data):
                self.movies.append(contentsOf: data.results)
                print("data is loaded \n\n\(data)")
                self.currentPage += 1
                self.hasMorePages = data.results.isEmpty
            case .failure(let error) :
                print("Error occured whilte loading data \(error.localizedDescription)")
            }
        }
        
    }
    
}
