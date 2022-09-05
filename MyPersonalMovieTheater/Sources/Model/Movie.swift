//
//  Movie.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import Foundation
//MARK: what is the difference between Codable VS Decodable?
//codable = enclodable + decodable

struct Movie: Codable {
    let id: Int
    let posterPath: String
    var videoPath: String?
    let backdrop: String
    let title: String
    var releaseDate: String
    var rating: Double
    let overview: String
    
    
    private enum CodingKeys: String, CodingKey {
        case id,
             posterPath = "poster_path",
             videoPath,
             backdrop = "backdrop_path",
             title,
             releaseDate = "release_date",
             rating = "vote_average",
             overview
    }
    
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self.releaseDate)
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let result = dateFormatter.string(from: date!)
        return result
    }
    
    
    
    
    
}
