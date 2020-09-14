//
//  NowPlayingViewModel.swift
//  TMDB
//
//  Created by Pranav Suri on 22/07/20.
//

import Foundation
class NowPlayingViewModel: ObservableObject{
    @Published var state: ViewState = .loading
    @Published var nowPlayingMovieList = [Movie]()


    init() {
        fetchData()
    }


    func fetchData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(URLConstants.apiKey)") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(url)
            if error != nil{
                self.state = .error
            } else{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let safeData = data{
                    do {
                        let data = try decoder.decode(MovieList.self, from: safeData)
                        DispatchQueue.main.async {
                            print(data)
                            self.state = .success
                            self.nowPlayingMovieList = data.results
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }


}
//final class NowPlayingViewModel: ObservableObject {
//    private let networkService: MovieNetworkService
//    init(networkService: MovieNetworkService) {
//        self.networkService = networkService
//    }
//    func fetchData() {
//        networkService.retrieveNowPlayingMovies() { (result) in
//            // Handle result here
//        }
//    }
//}
