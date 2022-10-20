//
//  PopularCollectionViewCell.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 17/10/22.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var popularImageView: UIImageView!
    
    // MARK: - Properties
    static let nibName = Constants.Cells.popularCell
    var iconMovie: MovieResponse? {
        didSet {
            if let icon = iconMovie?.posterPath, let url = URL(string: Constants.Urls.imageURL + icon) {
                popularImageView?.kf.indicatorType = .activity
                popularImageView?.kf.setImage(
                    with: url,
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage])
            }
            let borderColorViewA = UIColor(named: "borderWhite")
            popularImageView.layer.borderColor = borderColorViewA?.cgColor
            popularImageView.layer.borderWidth = 2.0
            popularImageView.layer.cornerRadius = 20
            popularImageView.layer.masksToBounds = true
        }
    }
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        popularImageView.kf.cancelDownloadTask()
        popularImageView.kf.setImage(with: URL(string: ""))
        popularImageView.image = nil
    }
}
