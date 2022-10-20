//
//  Constants.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import Foundation

struct Constants {
    struct Api {
        static let apiKey = "ea7c8c264009eb8757ae4108234a70b9"
    }
    
    struct Urls {
        static let baseUrl = "https://api.themoviedb.org/3/movie"
        static let upcoming = "/upcoming?api_key=\(Constants.Api.apiKey)"
        static let topRated = "/top_rated?api_key=\(Constants.Api.apiKey)"
        static let popular = "/popular?api_key=\(Constants.Api.apiKey)"
        static let detail = "/{movie_id}?api_key=\(Constants.Api.apiKey)"
        static let trailer = "/{movie_id}/videos?api_key=\(Constants.Api.apiKey)"
        static let imageURL = "https://image.tmdb.org/t/p/w500"
        static let imageOrignalURL = "https://image.tmdb.org/t/p/original"
    }
    
    struct ViewControllers {
        static let listMovieViewController = "ListMovieViewController"
        static let detailMovieViewController = "DetailMovieViewController"
        static let movieTrailerViewController = "MovieTrailerViewController"
    }
    
    struct Storyboards {
        static let moviesStoryboard = "Movies"
    }
    
    struct Cells {
        static let upcomingCell = "UpcomingCollectionViewCell"
        static let topRatedCell = "TopRatedCollectionViewCell"
        static let popularCell = "PopularCollectionViewCell"
    }
}
