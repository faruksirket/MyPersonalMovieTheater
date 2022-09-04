//
//  APIResults.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import Foundation

struct APIResults: Codable {
    let page: Int
    let numResults: Int
    let numPages: Int
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page, numResults = "total_results", numPages = "total_pages", movies = "results"
    }
}
