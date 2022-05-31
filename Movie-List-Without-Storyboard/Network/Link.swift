//
//  Link.swift
//  Movie-List-Without-Storyboard
//
//  Created by iOS on 1/6/22.
//

import Foundation

let baseURL = "https://api.themoviedb.org"

struct Api {
    
    static let movie = baseURL + "/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=marvel"
    static let thumbnail = "https://image.tmdb.org/t/p/w342/"
    
}
