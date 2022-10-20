//
//  ListMovieRouterProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp

class ListMovieRouterProtocolSpy: ListMovieRouterProtocol {
    // MARK: - Properties
    var didRouteToDetailMovie = false
    var currentViewController: ListMovieViewController? = nil
    
    // MARK: - Functions
    func routeToDetailMovie() {
        self.didRouteToDetailMovie = true
    }
}
