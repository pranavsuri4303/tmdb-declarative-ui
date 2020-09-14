//
//  NetworkServices.swift
//  TMDB
//
//  Created by Pranav Suri on 24/07/20.
//

import Foundation
final class MovieNetworkService {
    private let urlSession = URLSession.shared
    
    func retrievePopularMovies(completion: Result<[Movie], Error>) {
        // Your URLSession implementation is here
    }
    func retrieveNowPlayingMovies(completion: Result<[Movie], Error>) {
        // Your URLSession implementation is here
    }
}
