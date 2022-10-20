//
//  ListMovieInteractorProtocolSpy.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp
import SwiftyJSON

class ListMovieInteractorProtocolSpy: ListMovieInteractorProtocol {
    // MARK: - Properties
    var didGetListMovie = false
    var url: String? = ""
    var parameters: [String: Any]? = [String: Any]()
    var presenter: ListMoviePresenterProtocol?
    var responseResult: ()
    var result: ResponseResult = .success(result: JSON(rawValue: JSON.self) ?? JSON())
    
    // MARK: - Functions
    func getListMovie(with url: String, parameters: [String: Any]?, completion: @escaping (ResponseResult) -> ()) {
        self.didGetListMovie = true
        self.url = url
        self.parameters = parameters
        self.parameters = parameters
        self.responseResult = completion(result)
        return responseResult
    }
}
