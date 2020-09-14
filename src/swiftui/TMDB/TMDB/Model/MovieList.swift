//
//  NowPlaying.swift
//  TMDB
//
//  Created by Pranav Suri on 21/07/20.
//

import Foundation
struct MovieList: Decodable{
    let results: [Movie]
}
struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let voteAverage: Float
    let releaseDate: String?
    let posterPath: String?
    let backdropPath: String?
    let tagline: String?
    let runtime: Int?
    

    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w1280\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    

    var ratingText: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    var yearText: String {
        return String(releaseDate?.prefix(4) ?? "n/a")
    }
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return "n/a"
        }
        return Utils.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
}
