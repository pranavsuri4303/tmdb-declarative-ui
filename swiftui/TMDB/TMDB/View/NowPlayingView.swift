//
//  NowPlayingView.swift
//  TMDB
//
//  Created by Pranav Suri on 21/07/20.
//

import SwiftUI
import URLImage
struct NowPlayingView: View {
    @ObservedObject var nowPlayingVM = NowPlayingViewModel()
    var body: some View {
        if nowPlayingVM.state == .error{
            Text("Erorr")
        } else if nowPlayingVM.state == .loading{
            LoadingView()
        } else{
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(nowPlayingVM.nowPlayingMovieList){ movie in
                        NavigationLink(destination: MovieDetailsView(movie: movie)){
                            URLImage(movie.posterURL,
                                     processors: [ Resize(size: CGSize(width: 140.0, height: 210.0), scale: UIScreen.main.scale) ],
                                     placeholder: { _ in
                                        Image("placeholder")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 140)
                                     },
                                     content:  {
                                        $0.image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                            .cornerRadius(8)
                                     }).frame(width:140, height: 210)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }.listRowInsets(.init(top: 8, leading: 10, bottom: 8, trailing: 0))
        }
    }
}


struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
