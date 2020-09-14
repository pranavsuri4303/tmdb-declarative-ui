//
//  PopularView.swift
//  TMDB
//
//  Created by Pranav Suri on 22/07/20.
//

import SwiftUI
import URLImage
struct PopularView: View {
    @ObservedObject var popularVM = PopularViewModel()
    var body: some View {
        if popularVM.state == .error{
            Text("Erorr")
        } else if popularVM.state == .loading{
            LoadingView()
        } else{
            ForEach(popularVM.popularMoviesList){ movie in
                NavigationLink(destination: MovieDetailsView(movie: movie)){
                    HStack{
                        URLImage(movie.posterURL,
                                 processors: [ Resize(size: CGSize(width: 100.0, height: 150.0), scale: UIScreen.main.scale) ],
                                 placeholder: { _ in
                                    Image("placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100)
                                 },
                                 content:  {
                                    $0.image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                 }).frame(width:100,height:150)
                        Group{
                            VStack{
                                Text(movie.title)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                Text(movie.yearText)

                                Spacer()
                                HStack {
                                    ZStack(alignment: .leading){
                                        Text("★★★★★★★★★★")
                                            .foregroundColor(.blue)
                                            .opacity(0.5)
                                        if !movie.ratingText.isEmpty {
                                            Text(movie.ratingText).foregroundColor(.yellow)
                                        }
                                    }
                                    Spacer()
                                    Text(movie.scoreText)
                                }
                                
                            }.padding(.all)
                        }
                        
                        
                    }.navigationBarTitle("Movies")
                    
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            }
        }
        
    }
}


struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView()
    }
}
