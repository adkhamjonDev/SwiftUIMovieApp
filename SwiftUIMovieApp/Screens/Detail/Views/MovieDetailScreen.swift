//
//  MovieDetailScreen.swift
//  SwiftUIMovieApp
//
//  Created by Adkhamjon Rakhimov on 22/11/24.
//

import SwiftUI

struct MovieDetailScreen: View {
    let movieModel:MovieModel
    var body: some View {
        ZStack {
            Color.themeColors.backgoundColor
            
            ScrollView(showsIndicators: false) {
                AsyncImage(
                    url: URL(string: "https://image.tmdb.org/t/p/w500/\(movieModel.backdropPath ?? "")")) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: UIScreen.main.bounds.height / 2 )
                    .clipped()
                    
                
                VStack{
                    Text(movieModel.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    
                    Text(movieModel.overview)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom,4)
                    
                 
                        HStack{
                            Text("Release Date: ")
                                .font(.headline)
                            Text(movieModel.releaseDate)
                                
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.bottom,4)
                        HStack{
                            Text("Average Count: ")
                                .font(.headline)
                            Text("\(movieModel.voteAverage.voteAverage())")
                                
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.bottom,4)
                    
                    
                }
                .padding()
                .frame(alignment: .leading)
            }
        }
        .ignoresSafeArea()
    }
}
extension MovieDetailScreen{
    
    private var backButton:some View {
        Button {
            
        } label: {
            Circle()
                .frame(width: 50,height: 50)
                .overlay {
                    
                }
        }

    }
}

#Preview {
    MovieDetailScreen(movieModel: PreviewData.instance.movie)
}
