//
//  DetailMovieViewController.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import UIKit
import Kingfisher

// MARK: - DetailMovieViewProtocol
protocol DetailMovieViewProtocol: AnyObject {
    func showProgressView()
    func hideProgressView()
    func reloadData(response: DetailMovieResponse)
}

class DetailMovieViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var languageView: UIView!
    @IBOutlet var voteView: UIView!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var trailerView: UIView!
    @IBOutlet var titleMovieLabel: UILabel!
    @IBOutlet var descriptionMovieTextView: UITextView!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var voteLabel: UILabel!
    
    // MARK: - Properties
    var presenter: DetailMoviePresenterProtocol?
    var detailMovieConfigurator: DetailMovieConfiguratorProtocol?
    var movieDetail: MovieResponse?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailMovie()
        showMovieDetail()
        setupView()
    }
    
    //MARK: - Functions
    private func configureDetailMovie() {
        detailMovieConfigurator = DetailMovieConfigurator()
        detailMovieConfigurator?.configureDetailMovieView(viewController: self)
    }
    
    private func setupView() {
        let borderColorViewA = UIColor(named: "borderWhite")
        trailerView.layer.borderColor = borderColorViewA?.cgColor
        trailerView.layer.borderWidth = 1.0
        trailerView.layer.cornerRadius = 17
        trailerView.backgroundColor = .clear
        voteView.layer.borderWidth = 1.0
        voteView.layer.cornerRadius = 14
        languageView.layer.borderWidth = 1.0
        languageView.layer.cornerRadius = 14
    }
    
    private func showMovieDetail() {
        if movieDetail != nil {
            descriptionMovieTextView.text = movieDetail?.overview
            genreLabel.text = movieDetail?.title
            titleMovieLabel.text = movieDetail?.originalTitle
            guard let voteCount = movieDetail?.voteCount, let idMovie = movieDetail?.id, let path = movieDetail?.backdropPath else { return }
            voteLabel.text = "\(voteCount)"
            languageLabel.text = ""
            if let url = URL(string: Constants.Urls.imageOrignalURL + path){
                movieImageView.kf.indicatorType = .activity
                movieImageView.kf.setImage(
                    with: url,
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage])
            }
            presenter?.getDetailMovie(movieId: "\(idMovie)")
        }
    }
    
    // MARK: - IBActions
    @IBAction func didTapBack(_ sender: UIButton) {
        presenter?.goToBack()
    }
    
    @IBAction func didTapTrailer(_ sender: UIButton) {
        guard let idMovie = movieDetail?.id else { return }
        presenter?.showMovieTrailer(movieId: "\(idMovie)", viewDetail: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - DetailMovieViewProtocol
extension DetailMovieViewController: DetailMovieViewProtocol {
    func reloadData(response: DetailMovieResponse) {
        descriptionMovieTextView.text = response.overview
        var genelist = ""
        guard let genresMovie = response.genres, let path = response.backdropPath else { return }
        for genere in genresMovie {
            guard let name = genere.name else { return }
            genelist = genelist + name + " • "
        }
        genreLabel.text = genelist
        titleMovieLabel.text = response.originalTitle
        if let url = URL(string: Constants.Urls.imageOrignalURL + path) {
            movieImageView.kf.indicatorType = .activity
            movieImageView.kf.setImage(
                with: url,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage])
        }
    }
    
    func showProgressView() {
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        progress.label.text = NSLocalizedString("loadData", comment: "loadData")
        progress.detailsLabel.text = NSLocalizedString("pleaseWait", comment: "pleaseWait")
        progress.isUserInteractionEnabled = false
    }
    
    func hideProgressView() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
}
