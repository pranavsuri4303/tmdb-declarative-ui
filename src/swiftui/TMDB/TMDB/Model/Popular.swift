//
//  Popular.swift
//  TMDB
//
//  Created by Pranav Suri on 21/07/20.
//

import Foundation
struct PopularMoviesList: Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [PopularMoviesList]
}
struct PopularMoviesList: Decodable {
    let id: Int
    let title: String
    let vote_average: Float
    let release_date: String
    let poster_path: String?
    let backdrop_path: String?
}
