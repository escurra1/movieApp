//
//  TopRatedCollectionViewCell.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import UIKit
import Kingfisher

class TopRatedCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var iconTopRatedImageView: UIImageView!
    
    // MARK: - Properties
    static let nibName = Constants.Cells.topRatedCell
    var iconMovie: MovieResponse? {
        didSet {
            if let icon = iconMovie?.posterPath, let url = URL(string: Constants.Urls.imageURL + icon) {
                iconTopRatedImageView?.kf.indicatorType = .activity
                iconTopRatedImageView?.kf.setImage(
                    with: url,
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage])
            }
            let borderColorViewA = UIColor(named: "borderWhite")
            iconTopRatedImageView.layer.borderColor = borderColorViewA?.cgColor
            iconTopRatedImageView.layer.borderWidth = 2.0
            iconTopRatedImageView.layer.cornerRadius = 20
            iconTopRatedImageView.layer.masksToBounds = true
        }
    }
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconTopRatedImageView.kf.cancelDownloadTask()
        iconTopRatedImageView.kf.setImage(with: URL(string: ""))
        iconTopRatedImageView.image = nil
    }
}
