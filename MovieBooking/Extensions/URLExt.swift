//
//  URLExt.swift
//  MovieBooking
//
//  Created by Antoni on 04/04/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

extension URL{
    static private let baseImageUrl = "https://image.tmdb.org/t/p/"
    static private let backdropSize = "w780"
    static private let posterSize = "w342"
    
    static private  let apiKey = "34b106da35243b6a9bd8264787d00694"
    static private  let baseUrl = "https://api.themoviedb.org/3/movie"
    
    static func movies(for section: HomeSection, page: Int) -> URL{
        URL(string: "\(baseUrl)/\(section.rawValue.replacingOccurrences(of: " ", with: "_").lowercased() )?api_key=\(apiKey)&language=en-US&page=\(page)")!
    }
    
    static var topRated: URL{
        get{
            
            URL(string: "\(baseUrl)/top_rated?api_key=\(apiKey)&language=en-US&page=1")!
        }
    }
    
    static var upcoming: URL{
        get{
            URL(string: "\(baseUrl)/upcoming?api_key=\(apiKey)&language=en-US&page=1")!
        }
    }
    
    static var popular: URL{
        get{
            return  URL(string: "\(baseUrl)/popular?api_key=\(apiKey)&language=en-US&page=1")!
        }
    }
    
    static var nowPlaying: URL{
        get{
            URL(string: "\(baseUrl)/now_playing?api_key=\(apiKey)&language=en-US&page=1")!
        }
    }
    
    static func movie(with id: Int) -> URL{
        return URL(string: "\(baseUrl)/\(id)?api_key=\(apiKey)&language=en-US&page=1")!
    }
    
}
