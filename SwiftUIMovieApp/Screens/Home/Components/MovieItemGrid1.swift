//
//  MovieItemGrid1.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 21/11/24.
//
import SwiftUI


struct MovieItemGrid1: View {
    
    let movieModel:MovieModel
    
    var body: some View {
        ZStack {
            HStack {
                MovieItemGrid1Image(imageUrl: movieModel.posterPath)
                
                VStack(alignment: .leading){
                    Text(movieModel.title)
                        .font(.title3)
                        .bold()
            
                    Text("Release Date: \(movieModel.releaseDate)")
                        .font(.subheadline)
                        .padding(.top,4)
                    
                    Text("Vote Average: \(movieModel.voteAverage.voteAverage())")
                        .font(.subheadline)
                        .padding(.top,4)
                    
                    Spacer()
                }
                .padding(.vertical)
                Spacer()
            }
            .foregroundColor(.white)
        }
        .frame(width: .infinity,height: 150)
        .background(Color.themeColors.backgoundColor)
       
            
    }
}



struct MovieItemGrid1Image: View {
    let imageUrl:String
    var body: some View {
        ZStack {
            AsyncImage(
                url: URL(string: "https://image.tmdb.org/t/p/w500/\(imageUrl)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .padding(4)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 105,height: 150)
            
        }
            
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MovieItemGrid1(movieModel: PreviewData.instance.movie)
}

#Preview(traits: .sizeThatFitsLayout) {
    MovieItemGrid1Image(imageUrl: PreviewData.instance.movie.posterPath)
}
