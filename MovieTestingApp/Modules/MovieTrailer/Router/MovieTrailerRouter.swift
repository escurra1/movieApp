//
//  MovieTrailerRouter.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import Foundation

protocol MovieTrailerRouterProtocol: AnyObject {
    func routeToBack(viewMovie: MovieTrailerViewController)
}

class MovieTrailerRouter: MovieTrailerRouterProtocol {
    func routeToBack(viewMovie: MovieTrailerViewController) {
        viewMovie.dismiss(animated: true)
    }
}
