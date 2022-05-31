//
//  MovieViewModel.swift
//  Movie-List-Without-Storyboard
//
//  Created by iOS on 1/6/22.
//

import UIKit

struct MovieViewModel {
    var title: String
    var overView: String
    var posterImage: String ///thumbnail key.
    
    init(result: Result) {
        title = result.title
        overView = result.overview
        posterImage = result.posterPath
    }
   
}
