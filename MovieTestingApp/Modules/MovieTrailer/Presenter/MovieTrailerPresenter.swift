//
//  MovieTrailerPresenter.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import Foundation

protocol MovieTrailerPresenterProtocol: AnyObject {
    func goToBack(viewMovie: MovieTrailerViewController)
}

class MovieTrailerPresenter: MovieTrailerPresenterProtocol {
    var router: MovieTrailerRouterProtocol?
    
    init(andRouter router: MovieTrailerRouterProtocol?) {
        self.router = router
    }
    
    func goToBack(viewMovie: MovieTrailerViewController) {
        router?.routeToBack(viewMovie: viewMovie)
    }
}
