//
//  PreviewData.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 22/11/24.
//

class PreviewData {
    
    static let instance = PreviewData()
    
    init(){
        
    }
    
    let movie = MovieModel(
        adult: false,
        backdropPath: "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
        genreIds: [ 878,28,12],
        id: 912649,
        originalLanguage: "en",
        originalTitle: "Venom: The Last Dance",
        overview: "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
        popularity: 3047.508,
        posterPath: "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
        releaseDate: "2024-10-22",
        title: "Venom: The Last Dance",
        video: false,
        voteAverage: 6.5,
        voteCount: 796
    )
    
    
}
