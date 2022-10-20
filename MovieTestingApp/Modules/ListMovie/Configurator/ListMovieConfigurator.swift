//
//  ListMovieConfigurator.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import Foundation

protocol ListMovieConfiguratorProtocol: AnyObject {
    func configureListMovieView(viewController: ListMovieViewController)
}

class ListMovieConfigurator: ListMovieConfiguratorProtocol {
    func configureListMovieView(viewController: ListMovieViewController) {
        let router = ListMovieRouter(evaluationView: viewController)
        let interactor = ListMovieInteractor()
        let presenter = ListMoviePresenter(withViewController: viewController, andRouter: router, useCase: interactor)
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        presenter.interactor?.presenter = presenter
        viewController.presenter = presenter
    }
}
