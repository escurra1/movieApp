//
//  ListMoviePresenter.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import Foundation

protocol ListMoviePresenterProtocol: AnyObject {
    func getListMovie(type: TypeApi)
    func hideProgress()
    func goToDetailMovie()
    var arrayUncomingMovie: [MovieResponse]? { get set }
    var arrayTopRatedMovie: [MovieResponse]? { get set }
    var arrayPopularMovie: [MovieResponse]? { get set }
}

class ListMoviePresenter: ListMoviePresenterProtocol {
    weak var view: ListMovieViewProtocol?
    var router: ListMovieRouterProtocol?
    var interactor: ListMovieInteractorProtocol?
    var arrayUncomingMovie: [MovieResponse]? = []
    var arrayTopRatedMovie: [MovieResponse]? = []
    var arrayPopularMovie: [MovieResponse]? = []
    var apiUrl = ""
    
    init(withViewController view: ListMovieViewProtocol?, andRouter router: ListMovieRouterProtocol?, useCase interactor: ListMovieInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getListMovie(type: TypeApi) {
        view?.showProgressView()
        let params:[String:Any] = ["api_key": Constants.Api.apiKey]
        switch type {
        case .upcoming:
            apiUrl = Constants.Urls.upcoming
        case .topRated:
            apiUrl = Constants.Urls.topRated
        case .popular:
            apiUrl = Constants.Urls.popular
        }
        interactor?.getListMovie(with:  Constants.Urls.baseUrl + apiUrl, parameters: params, completion:{ [weak self]
            response in
            guard let welf = self else { return }
            switch(response) {
            case .success(let responseJson):
                let response = WelcomeMovieResponse(fromJson: responseJson)
                guard let resultsResponse = response.results else { return }
                switch type {
                case .upcoming:
                    welf.arrayUncomingMovie?.append(contentsOf: resultsResponse)
                case .topRated:
                    welf.arrayTopRatedMovie?.append(contentsOf: resultsResponse)
                case .popular:
                    welf.arrayPopularMovie?.append(contentsOf: resultsResponse)
                }
                DispatchQueue.main.async {
                    welf.view?.reloadData()
                }
            case .failure(let error):
                print(error)
                Utils.showMessageTop(true, textBody: NSLocalizedString("errorService", comment: "errorService"))
            }
        })
    }
    
    func hideProgress() {
        view?.hideProgressView()
    }
    
    func goToDetailMovie() {
        router?.routeToDetailMovie()
    }
}
