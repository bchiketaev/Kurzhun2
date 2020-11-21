//
//  File.swift
//  Kurzhun2
//
//  Created by abc on 16/11/2020.
//

import Foundation

struct Brands: Codable {
    
    var count: Int
    var results: [MyResult]
}

struct MyResult: Codable {
    var id: Int
    var username: String?
    var logo: String?
    var slogan: String?
    var category: Category?
}

