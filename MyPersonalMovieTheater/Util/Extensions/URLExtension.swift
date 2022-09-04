//
//  URLExtension.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import Foundation

extension URL {
    init?(image path: String) {
        let baseUrl = "https://image.tmdb.org/t/p/w300/"
        self.init(string: "\(baseUrl)\(path)")
    }
}
