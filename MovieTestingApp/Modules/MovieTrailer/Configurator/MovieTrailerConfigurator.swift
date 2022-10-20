//
//  MovieTrailerConfigurator.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

protocol MovieTrailerConfiguratorProtocol: AnyObject {
    func configureMovieTrailerView(viewController: MovieTrailerViewController)
}

class MovieTrailerConfigurator: MovieTrailerConfiguratorProtocol {
    func configureMovieTrailerView(viewController: MovieTrailerViewController) {
        let router = MovieTrailerRouter()
        let presenter = MovieTrailerPresenter(andRouter: router)
        presenter.router = router
        viewController.presenter = presenter
    }
}
