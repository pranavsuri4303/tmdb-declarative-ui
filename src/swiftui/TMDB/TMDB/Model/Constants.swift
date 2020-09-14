//
//  Constants.swift
//  TMDB
//
//  Created by Pranav Suri on 22/07/20.
//

import Foundation
struct URLConstants{
    static let apiKey = "4a01a777bc601f84dc9c862d70bea3fb"
    static let posterBaseURL = "https://image.tmdb.org/t/p/w500"
    static let backdropBaseURL = "https://image.tmdb.org/t/p/w1280"
    static let youtubeBaseURL = "https://www.youtube.com/watch?v="
}
enum ViewState {
    case error
    case loading
    case success
}
