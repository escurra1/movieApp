//
//  ListMovieViewProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp

class ListMovieViewProtocolSpy: ListMovieViewProtocol {
    // MARK: - Properties
    var didShowProgressView = false
    var didHideProgressView = false
    var didReloadData = false
    
    // MARK: - Functions
    func showProgressView() {
        self.didShowProgressView = true
    }
    
    func hideProgressView() {
        self.didHideProgressView = true
    }
    
    func reloadData() {
        self.didReloadData = true
    }
}
