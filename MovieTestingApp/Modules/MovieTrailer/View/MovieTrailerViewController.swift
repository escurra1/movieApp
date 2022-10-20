//
//  MovieTrailerViewController.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import UIKit
import YouTubePlayer

class MovieTrailerViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var trailerPlayerView: YouTubePlayerView!
    
    // MARK: - Properties
    var presenter: MovieTrailerPresenterProtocol?
    var movieTrailerConfigurator: MovieTrailerConfiguratorProtocol?
    var trailer: TrailerResponse?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMovieTrailer()
        showTrailerMovie()
    }
    
    // MARK: - Functions
    private func configureMovieTrailer() {
        movieTrailerConfigurator = MovieTrailerConfigurator()
        movieTrailerConfigurator?.configureMovieTrailerView(viewController: self)
    }
    
    private func showTrailerMovie() {
        guard Utils.checkInternetConnection() else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.presenter?.goToBack(viewMovie: self)
            }
            return
        }
        trailerPlayerView.playerVars = ["playsinline": "1",
                                        "controls": "1",
                                        "showinfo": "0",
                                        "fs":"0",
                                        "disablekb":"0",
                                        "iv_load_policy":"3",
                                        "modestbranding":"0",
                                        "autohide":"1",
                                        "rel":"1"]   as YouTubePlayerView.YouTubePlayerParameters
        trailerPlayerView.delegate = self
        guard let key = trailer?.key else {
            return
        }
        trailerPlayerView.loadVideoID(key)
    }
    
    // MARK: - IBActions
    @IBAction func didTapBack(_ sender: UIButton) {
        presenter?.goToBack(viewMovie: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - YouTubePlayerDelegate
extension MovieTrailerViewController: YouTubePlayerDelegate {
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        trailerPlayerView.play()
    }
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        if playerState == .Ended {
            presenter?.goToBack(viewMovie: self)
        }
    }
}
