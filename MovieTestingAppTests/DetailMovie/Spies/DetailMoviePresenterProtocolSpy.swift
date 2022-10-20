//
//  DetailMoviePresenterProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp
import SwiftyJSON

class DetailMoviePresenterProtocolSpy: DetailMoviePresenterProtocol {
    // MARK: - Functions
    var didGetDetailMovie = false
    var didShowMovieTrailer = false
    var didGoToMovieTrailer = false
    var didHideProgress = false
    var didGoToBack = false
    var movieId: String = ""
    var viewDetail: DetailMovieViewController? = nil
    var trailer: TrailerResponse = TrailerResponse(fromJson: JSON(rawValue: JSON.self) ?? JSON())
    
    // MARK: - Functions
    func getDetailMovie(movieId: String) {
        self.didGetDetailMovie = true
        self.movieId = movieId
    }
    
    func showMovieTrailer(movieId: String, viewDetail: DetailMovieViewController) {
        self.didShowMovieTrailer = true
        self.movieId = movieId
        self.viewDetail = viewDetail
    }
    
    func goToMovieTrailer(trailer: TrailerResponse, viewDetail: DetailMovieViewController) {
        self.didGoToMovieTrailer = true
        self.trailer = trailer
    }
    
    func hideProgress() {
        self.didHideProgress = true
    }
    
    func goToBack() {
        self.didGoToBack = true
    }
}
