//
//  ListMoviePresenterTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp
import XCTest

class ListMoviePresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListMoviePresenter!
    var spyView: ListMovieViewProtocolSpy!
    var spyInteractor: ListMovieInteractorProtocolSpy!
    var spyRouter: ListMovieRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListMoviePresenter()
    }
    
    override  func tearDown() {
        spyInteractor = nil
        spyView = nil
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListMoviePresenter() {
        spyInteractor = ListMovieInteractorProtocolSpy()
        spyView = ListMovieViewProtocolSpy()
        spyRouter = ListMovieRouterProtocolSpy()
        sut = ListMoviePresenter(withViewController: spyView, andRouter: spyRouter, useCase: spyInteractor)
        sut.interactor = spyInteractor
        sut.router = spyRouter
        sut.view = spyView
    }
    
    // MARK: - Tests
    func testGetListMovie() {
        // Given
        let type: TypeApi = .upcoming
        // When
        sut.getListMovie(type: type)
        // Then
        XCTAssertNoThrow(sut.getListMovie(type: type), "getListMovie executed")
        XCTAssertTrue(spyInteractor.didGetListMovie, "didGetListMovieCalled executed")
        XCTAssertFalse(spyView.didReloadData, "didReloadData executed")
        XCTAssertNoThrow(spyView.didShowProgressView, "didShowProgressView executed")
    }
    
    func testHideProgress() {
        // Given
        // When
        sut.hideProgress()
        // Then
        XCTAssertNoThrow(sut.hideProgress(), "hideProgress executed")
        XCTAssertTrue(spyView.didHideProgressView, "didHideProgressView executed")
    }
    
    func testGoToDetailMovie() {
        // Given
        // When
        sut.goToDetailMovie()
        // Then
        XCTAssertNoThrow(sut.goToDetailMovie(), "goToDetailMovie executed")
        XCTAssertTrue(spyRouter.didRouteToDetailMovie, "didRouteToDetailMovie executed")
    }
}
