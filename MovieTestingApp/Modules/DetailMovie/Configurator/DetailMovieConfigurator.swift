//
//  DetailMovieConfigurator.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import Foundation

protocol DetailMovieConfiguratorProtocol: AnyObject {
    func configureDetailMovieView(viewController: DetailMovieViewController)
}

class DetailMovieConfigurator: DetailMovieConfiguratorProtocol {
    func configureDetailMovieView(viewController: DetailMovieViewController) {
        let router = DetailMovieRouter(evaluationView: viewController)
        let interactor = DetailMovieInteractor()
        let presenter = DetailMoviePresenter(withViewController: viewController, andRouter: router, useCase: interactor)
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        presenter.interactor?.presenter = presenter
        viewController.presenter = presenter
    }
}
