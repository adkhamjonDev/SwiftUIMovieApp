//
//  MovieModel.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 21/11/24.
//


import Foundation

struct PagingResponse: Codable {
    var page: Int
    var results: [MovieModel]
    var total_pages: Int
    var total_results: Int
}
