//
//  MovieTrailerPresenterProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp

class MovieTrailerPresenterProtocolSpy: MovieTrailerPresenterProtocol {
    // MARK: - Properties
    var didGoToBack = false
    var viewMovie: MovieTrailerViewController? = nil
    
    // MARK: - Functions
    func goToBack(viewMovie: MovieTrailerViewController) {
        self.didGoToBack = true
        self.viewMovie = viewMovie
    }
}
