//
//  MovieDetailsViewModel.swift
//  TMDB
//
//  Created by Pranav Suri on 23/07/20.
//

import Foundation
class MovieDetailsViewModel: ObservableObject {
    @Published var detailsState: ViewState = .loading
    @Published var clipsState: ViewState = .loading
    @Published var movieClips = [MovieVideo]()

    func fetchMovieClips(movieId: String) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=\(URLConstants.apiKey)") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(url)
            if error != nil{
                self.clipsState = .error
            } else{
                if let safeData = data{
                    do {
                        let data = try Utils.jsonDecoder.decode(MovieClips.self, from: safeData)
                        DispatchQueue.main.async {
                            print(data)
                            self.clipsState = .success
                            self.movieClips = data.results
                            
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }

    

}
