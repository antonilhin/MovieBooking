//
//  MovieBundle.swift
//  MovieBooking
//
//  Created by Antoni on 26/03/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

import SwiftUI

struct MovieBundle: Codable, Hashable {
    let trending: [Trending]
    let popular: [Popular]
    let actors: [Actor]
    let upcoming: [Upcoming]
}

protocol Movie: Codable, Hashable {
    var id: Int { get }
    var title: String { get }
    var releaseDate: String { get }
    var description: String { get }
    var image: String { get }
    var rating: Double { get }
    var genres: [String] { get }
    var runtime: String { get }
    var studio: String? { get }
}


// MARK: - Trending
struct Trending: Movie {
    let id: Int
    let title, releaseDate, description, image: String
    let rating: Double
    let genres: [String]
    let runtime: String
    var studio: String? = ""
    
    static var `default`: Trending{
        .init(id: 0, title: "", releaseDate: "", description: "", image: "", rating: 0, genres: [], runtime: "", studio: "")
    }
}


// MARK: - Actor
struct Actor: Codable, Hashable {
    let id: Int
    let name, bio, image: String
    
    static var `default`: Actor{
        .init(id: 0, name: "", bio: "", image: "")
    }

}

// MARK: - Popular
struct Popular: Movie {
    let id: Int
    let title, releaseDate, description, image: String
    let rating: Double
    let genres: [String]
    let runtime: String
    var studio: String? = ""
    
    static var `default`: Popular{
        .init(id: 0, title: "", releaseDate: "", description: "", image: "", rating: 0, genres: [], runtime: "", studio: "")
    }

}

// MARK: - Upcoming
struct Upcoming: Movie {
    let id: Int
    let title, releaseDate, description, image: String
    let rating: Double
    let genres: [String]
    let runtime: String
    var studio: String? = ""
    
    static var `default`: Upcoming{
        .init(id: 0, title: "", releaseDate: "", description: "", image: "", rating: 0, genres: [], runtime: "", studio: "")
    }
}
