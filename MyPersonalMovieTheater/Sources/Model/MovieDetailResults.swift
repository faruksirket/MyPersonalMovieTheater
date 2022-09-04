//
//  MovieDetail.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import Foundation

struct MovieDetailResults: Codable {
    let genres : [Genres]
}

struct Genres: Codable {
    let id: Int
    let name: String
}
