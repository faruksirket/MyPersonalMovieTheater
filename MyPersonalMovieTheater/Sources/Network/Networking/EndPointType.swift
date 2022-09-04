//
//  EndPointType.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//
import Foundation

protocol EndPointType {
  var baseURL: String { get }
  var path: String { get }
  var url: URL? { get }
}
