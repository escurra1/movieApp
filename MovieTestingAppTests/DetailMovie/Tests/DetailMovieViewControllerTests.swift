//
//  DetailMovieViewControllerTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp
import XCTest
import SwiftyJSON

class DetailMovieViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: DetailMovieViewController!
    var spyPresenter: DetailMoviePresenterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupDetailMovieViewController()
    }
    
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupDetailMovieViewController() {
        sut = DetailMovieViewController()
        spyPresenter = DetailMoviePresenterProtocolSpy()
        sut.movieImageView =  UIImageView()
        sut.languageView = UIView()
        sut.voteView = UIView()
        sut.genreLabel = UILabel()
        sut.trailerView = UIView()
        sut.titleMovieLabel = UILabel()
        sut.descriptionMovieTextView = UITextView()
        sut.languageLabel = UILabel()
        sut.voteLabel = UILabel()
        sut.presenter = spyPresenter
    }
    
    // MARK: Tests
    func testViewDidLoad() {
        // Given
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertNoThrow(sut.viewDidLoad())
        XCTAssertNotNil(sut, "sut should be instantiated")
    }
    
    func testDidTapBack() {
        // Given
        let buttonAction = UIButton()
        // When
        sut.didTapBack(buttonAction)
        // Then
        XCTAssertTrue(spyPresenter.didGoToBack)
        XCTAssertNoThrow(sut.didTapBack(buttonAction), "didTapBack executed")
    }
    
    func testDidTapTrailer() {
        // Given
        let buttonTrailer = UIButton()
        // When
        sut.didTapTrailer(buttonTrailer)
        // Then
        XCTAssertFalse(spyPresenter.didShowMovieTrailer)
        XCTAssertNoThrow(sut.didTapTrailer(buttonTrailer), "didTapTrailer executed")
    }
    
    func testReloadData() {
        // Given
        let response: DetailMovieResponse = DetailMovieResponse(fromJson: JSON(rawValue: JSON.self) ?? JSON())
        // When
        sut.reloadData(response: response)
        // Then
        XCTAssertNoThrow(sut.reloadData(response: response), "reloadData executed")
        XCTAssertNoThrow(sut.movieImageView, "movieImageView executed")
        XCTAssertNoThrow(sut.languageView, "languageView executed")
        XCTAssertNoThrow(sut.voteView, "voteView executed")
        XCTAssertNoThrow(sut.genreLabel, "genreLabel executed")
        XCTAssertNoThrow(sut.trailerView, "trailerView executed")
        XCTAssertNoThrow(sut.titleMovieLabel, "titleMovieLabel executed")
        XCTAssertNoThrow(sut.descriptionMovieTextView, "descriptionMovieTextView executed")
        XCTAssertNoThrow(sut.languageLabel, "languageLabel executed")
        XCTAssertNoThrow(sut.voteLabel, "voteLabel executed")
    }
    
    func testShowProgressView() {
        // Given
        // When
        sut.showProgressView()
        // Then
        XCTAssertNoThrow(sut.showProgressView(), "showProgressView executed")
    }
    
    func testHideProgressView() {
        // Given
        // When
        sut.hideProgressView()
        // Then
        XCTAssertNoThrow(sut.hideProgressView(), "hideProgressView executed")
    }
}
