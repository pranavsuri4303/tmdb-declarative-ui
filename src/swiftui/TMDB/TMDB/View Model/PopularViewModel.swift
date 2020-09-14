//
//  PopularViewModel.swift
//  TMDB
//
//  Created by Pranav Suri on 22/07/20.
//

import Foundation
class PopularViewModel: ObservableObject {
    @Published var state: ViewState = .loading
    @Published var popularMoviesList = [Movie]()
    
    init() {
        fetchData()
    }
    
    
    func fetchData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(URLConstants.apiKey)") else {
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
                            self.popularMoviesList = data.results
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
}
