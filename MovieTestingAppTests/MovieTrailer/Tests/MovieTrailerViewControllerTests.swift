//
//  MovieTrailerViewControllerTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp
import XCTest
import YouTubePlayer

class MovieTrailerViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: MovieTrailerViewController!
    var spyPresenter: MovieTrailerPresenterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupMovieTrailerViewController()
    }
    
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMovieTrailerViewController() {
        sut = MovieTrailerViewController()
        spyPresenter = MovieTrailerPresenterProtocolSpy()
        sut.trailerPlayerView = YouTubePlayerView()
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
    
    func testPlayerReady() {
        // Given
        let videoPlayer: YouTubePlayerView = YouTubePlayerView()
        // When
        sut.playerReady(videoPlayer)
        // Then
        XCTAssertNoThrow(sut.playerReady(videoPlayer), "playerReady executed")
    }
    
    func testPlayerStateChanged() {
        // Given
        let playerChanged: String = "PlayerChanged"
        // When
        var videoPlayer: YouTubePlayerView = YouTubePlayerView()
        let playerState: YouTubePlayerState? = YouTubePlayerState(rawValue: playerChanged)
        guard let player = playerState else { return }
        sut.playerStateChanged(videoPlayer, playerState: player)
        // Then
        XCTAssertNoThrow(sut.playerStateChanged(videoPlayer, playerState: player), "playerStateChanged executed")
        XCTAssertTrue(spyPresenter.didGoToBack, "didGoToBack executed")
    }
}
