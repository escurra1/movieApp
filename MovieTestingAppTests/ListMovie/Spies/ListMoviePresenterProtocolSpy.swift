//
//  ListMoviePresenterProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp

class ListMoviePresenterProtocolSpy: ListMoviePresenterProtocol {
    // MARK: - Properties
    var didGetListMovie = false
    var didHideProgress = false
    var didGoToDetailMovie = false
    var arrayUncomingMovie: [MovieResponse]?
    var arrayTopRatedMovie: [MovieResponse]?
    var arrayPopularMovie: [MovieResponse]?
    var type: TypeApi = .popular
    
    // MARK: - Functions
    func getListMovie(type: TypeApi) {
        self.didGetListMovie = true
        self.type = type
    }
    
    func hideProgress() {
        self.didHideProgress = true
    }
    
    func goToDetailMovie() {
        self.didGoToDetailMovie = true
    }
}

