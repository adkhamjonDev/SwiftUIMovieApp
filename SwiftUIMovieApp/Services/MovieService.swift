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
    
    var currentPage: Int = 1
    
    var totalPages: Int = 0
    
    init() {
        getPaginatedMovies()
    }
    
    func getPaginatedMovies() {
        print("INITIAL CALL OF FUNCTION")
        guard hasMorePages else {
            print("GUARD ELSE STATEMENT")
            return
        }
        
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=44f66b1676556437f4731985995f2dea&language=en-US&page=\(currentPage)"
        
        AF.request(url).responseDecodable(of: PagingResponse.self) { response in
            switch response.result {
            case .success(let data):
                self.movies.append(contentsOf: data.results)
                print("data is loaded currentPage = \(self.currentPage)")
                self.currentPage += 1
                self.hasMorePages = !data.results.isEmpty
                self.totalPages = data.total_pages
            case .failure(let error) :
                print("Error occured whilte loading data \(error.localizedDescription)")
            }
        }
        
    }
    
}
