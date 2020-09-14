//
//  MovieVideos.swift
//  TMDB
//
//  Created by Pranav Suri on 21/07/20.
//

import Foundation
struct MovieClips: Decodable {
    let id: Int?
    let results: [MovieVideo]
}
struct MovieVideo: Decodable, Identifiable {
    let id: String?
    let key: String
    let name: String?
    let site: String?
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
