//
//  DetailMoviePresenterTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp
import XCTest
import SwiftyJSON

class DetailMoviePresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailMoviePresenter!
    var spyView: DetailMovieViewProtocolSpy!
    var spyInteractor: DetailMovieInteractorProtocolSpy!
    var spyRouter: DetailMovieRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupDetailMoviePresenter()
    }
    
    override  func tearDown() {
        spyInteractor = nil
        spyView = nil
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupDetailMoviePresenter() {
        spyInteractor = DetailMovieInteractorProtocolSpy()
        spyView = DetailMovieViewProtocolSpy()
        spyRouter = DetailMovieRouterProtocolSpy()
        sut = DetailMoviePresenter(withViewController: spyView, andRouter: spyRouter, useCase: spyInteractor)
        sut.interactor = spyInteractor
        sut.router = spyRouter
        sut.view = spyView
    }
    
    // MARK: - Tests
    func testGetDetailMovie() {
        // Given
        let movieId: String? = "1"
        guard let id = movieId else { return }
        // When
        sut.getDetailMovie(movieId: id)
        // Then
        XCTAssertNoThrow(sut.getDetailMovie(movieId: id), "getDetailMovie executed")
        XCTAssertTrue(spyInteractor.didGetDetailMovie, "didGetDetailMovieCalled executed")
        XCTAssertFalse(spyView.didReloadData, "didReloadData executed")
        XCTAssertNoThrow(spyView.didShowProgressView, "didShowProgressView executed")
    }
    
    func testShowMovieTrailer() {
        // Given
        let movieId: String? = "1"
        let viewDetail: DetailMovieViewController? = nil
        guard let id = movieId, let view = viewDetail else { return }
        // When
        sut.showMovieTrailer(movieId: id, viewDetail: view)
        // Then
        XCTAssertNoThrow(sut.showMovieTrailer(movieId: id, viewDetail: view), "showMovieTrailer executed")
        XCTAssertTrue(spyInteractor.didGetDetailMovie, "didGetDetailMovie executed")
        XCTAssertTrue(spyView.didShowProgressView, "didShowProgressView executed")
    }
    
    func testGoToMovieTrailer() {
        // Given
        let viewDetail: DetailMovieViewController? = nil
        let trailer: TrailerResponse = TrailerResponse(fromJson: JSON(rawValue: JSON.self) ?? JSON())
        guard let view = viewDetail else { return }
        // When
        sut.goToMovieTrailer(trailer: trailer, viewDetail: view)
        // Then
        XCTAssertNoThrow(sut.goToMovieTrailer(trailer: trailer, viewDetail: view), "goToMovieTrailer executed")
        XCTAssertTrue(spyRouter.didRouteToMovieTrailer, "didRouteToMovieTrailer executed")
    }
    
    func testHideProgress() {
        // Given
        // When
        sut.hideProgress()
        // Then
        XCTAssertNoThrow(sut.hideProgress(), "hideProgress executed")
        XCTAssertTrue(spyView.didHideProgressView, "didHideProgressView executed")
    }
    
    func testGoToBack() {
        // Given
        // When
        sut.goToBack()
        // Then
        XCTAssertNoThrow(sut.goToBack(), "goToBack executed")
        XCTAssertTrue(spyRouter.didRouteToBack, "didRouteToBack executed")
    }
}
