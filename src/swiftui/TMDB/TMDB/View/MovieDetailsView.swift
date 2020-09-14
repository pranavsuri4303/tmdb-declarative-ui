//
//  MovieDetailsView.swift
//  TMDB
//
//  Created by Pranav Suri on 21/07/20.
//

import SwiftUI
import URLImage
struct MovieDetailsView: View {
    let movie: Movie
    @ObservedObject var movieDetailsVM = MovieDetailsViewModel()
    
    var body: some View {
        
        ScrollView(.vertical){
          
            URLImage(movie.backdropURL,
                     placeholder: { _ in
                        Image("placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140, height: 210)
                     }){ proxy in
                proxy.image
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
            }.frame(maxWidth: .infinity)
            .aspectRatio(1.7777777778, contentMode: .fit)
            
            
            HStack(){
                Text(movie.yearText)
                Spacer()
                Text("2hr 3min")
            }.padding(.horizontal)
            Divider()
                        Text("\"The mission was survival.\"").italic()
                        Divider()
            VStack(){
                Text("Overview")
                    .fontWeight(.bold)
                Text("\(movie.overview)").multilineTextAlignment(.leading)
            }.padding(.horizontal)
            
            Divider()
            HStack{
                Text("Rating")
                    .fontWeight(.bold)
                Spacer()
                Text(movie.scoreText)
                ZStack(alignment: .leading){
                    Text("★★★★★★★★★★")
                        .foregroundColor(.blue)
                        .opacity(0.5)
                    if !movie.ratingText.isEmpty {
                        Text(movie.ratingText).foregroundColor(.yellow)
                    }
                }
                
            }.padding(.horizontal)
            Divider()
            VStack(alignment: .leading){
                Text("Clips and Trailers")
                    .fontWeight(.bold)
                ForEach(movieDetailsVM.movieClips){ clip in
                    Link(destination: URL(string: "\(URLConstants.youtubeBaseURL)\(clip.key)")!){
                        Text("\(clip.name!)")
                        Spacer()
                        Image(systemName: "arrow.up.right.circle")
                    }
                }
            }.padding(.horizontal)
        }.navigationBarTitle(Text(movie.title))
        .onAppear(){
            movieDetailsVM.fetchMovieClips(movieId: String(movie.id))
            
        }
    }
}


struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(id: 0, title: "", overview: "", voteAverage: 0, releaseDate: "", posterPath: "", backdropPath:"", tagline: "", runtime: 1)  )
    }
}
