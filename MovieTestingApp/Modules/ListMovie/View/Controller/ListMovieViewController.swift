//
//  ListMovieViewController.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import UIKit

// MARK: - ListUserViewProtocol
protocol ListMovieViewProtocol: AnyObject {
    func showProgressView()
    func hideProgressView()
    func reloadData()
}

class ListMovieViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var upcomingCollectionView: UICollectionView?
    @IBOutlet weak var topRatedCollectionView: UICollectionView?
    @IBOutlet weak var popularyCollectionView: UICollectionView?
    @IBOutlet weak var ageItemCollectionView: UICollectionView?
    @IBOutlet weak var popularyLabel: UILabel?
    @IBOutlet weak var ageItemLabel: UILabel?
    @IBOutlet weak var contentViewA: UIView?
    @IBOutlet weak var contentViewB: UIView?
    @IBOutlet weak var upcomingView: UIView?
    @IBOutlet weak var topRatedView: UIView?
    @IBOutlet weak var popularyView: UIView?
    @IBOutlet weak var ageItemView: UIView?
    
    // MARK: - Properties
    var presenter: ListMoviePresenterProtocol?
    var listMovieConfigurator: ListMovieConfiguratorProtocol?
    var listMovieSelect: MovieResponse?
    var isValidItemPopulary = false
    var isValidItemAge = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureListMovie()
        callService()
        setupCollectionView()
        configureView()
    }
    
    //MARK: - Functions
    private func configureListMovie() {
        listMovieConfigurator = ListMovieConfigurator()
        listMovieConfigurator?.configureListMovieView(viewController: self)
    }
    
    private func callService() {
        presenter?.getListMovie(type: .upcoming)
        presenter?.getListMovie(type: .topRated)
        presenter?.getListMovie(type: .popular)
    }
    
    private func setupCollectionView() {
        upcomingCollectionView?.register(UINib(nibName: UpcomingCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: UpcomingCollectionViewCell.nibName)
        upcomingCollectionView?.layer.cornerRadius = 10
        upcomingCollectionView?.delegate = self
        upcomingCollectionView?.dataSource = self
        let layoutUpcoming = UICollectionViewFlowLayout()
        layoutUpcoming.scrollDirection = .horizontal
        upcomingCollectionView?.collectionViewLayout = layoutUpcoming
        upcomingCollectionView?.showsHorizontalScrollIndicator = false
        upcomingCollectionView?.bounces = false
        upcomingCollectionView?.layer.masksToBounds = true
        
        topRatedCollectionView?.register(UINib(nibName: TopRatedCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: TopRatedCollectionViewCell.nibName)
        topRatedCollectionView?.layer.cornerRadius = 10
        topRatedCollectionView?.delegate = self
        topRatedCollectionView?.dataSource = self
        let layoutTopRated = UICollectionViewFlowLayout()
        layoutTopRated.scrollDirection = .horizontal
        topRatedCollectionView?.collectionViewLayout = layoutTopRated
        topRatedCollectionView?.showsHorizontalScrollIndicator = false
        topRatedCollectionView?.bounces = false
        topRatedCollectionView?.layer.masksToBounds = true
        
        popularyCollectionView?.register(UINib(nibName: PopularCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.nibName)
        popularyCollectionView?.layer.cornerRadius = 10
        popularyCollectionView?.delegate = self
        popularyCollectionView?.dataSource = self
        let layoutPopulary = UICollectionViewFlowLayout()
        layoutPopulary.scrollDirection = .vertical
        popularyCollectionView?.collectionViewLayout = layoutPopulary
        popularyCollectionView?.showsHorizontalScrollIndicator = false
        popularyCollectionView?.bounces = false
        popularyCollectionView?.layer.masksToBounds = true
        
        ageItemCollectionView?.register(UINib(nibName: PopularCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.nibName)
        ageItemCollectionView?.layer.cornerRadius = 10
        ageItemCollectionView?.delegate = self
        ageItemCollectionView?.dataSource = self
        let layoutAgeItem = UICollectionViewFlowLayout()
        layoutAgeItem.scrollDirection = .vertical
        ageItemCollectionView?.collectionViewLayout = layoutAgeItem
        ageItemCollectionView?.showsHorizontalScrollIndicator = false
        ageItemCollectionView?.bounces = false
        ageItemCollectionView?.layer.masksToBounds = true
    }
    
    private func configureView() {
        contentViewA?.backgroundColor = .white
        let borderColorViewA = UIColor(named: "borderWhite")
        contentViewA?.layer.borderColor = borderColorViewA?.cgColor
        contentViewA?.layer.borderWidth = 2.0
        contentViewA?.layer.cornerRadius = 17
        isValidItemPopulary = true
        popularyView?.isHidden = false
        
        contentViewB?.backgroundColor = .clear
        let borderColorViewB = UIColor(named: "borderWhite")
        contentViewB?.layer.borderColor = borderColorViewB?.cgColor
        contentViewB?.layer.borderWidth = 2.0
        contentViewB?.layer.cornerRadius = 17
        ageItemLabel?.textColor = .white
        isValidItemAge = false
        ageItemView?.isHidden = true
        
        upcomingView?.backgroundColor = .clear
        topRatedView?.backgroundColor = .clear
        popularyView?.backgroundColor = .clear
        ageItemView?.backgroundColor = .clear
    }
    
    // MARK: - IBActions
    @IBAction func didTapButtonA(_ sender: UIButton) {
        isValidItemPopulary = true
        if isValidItemPopulary {
            isValidItemAge = false
            contentViewA?.backgroundColor = .white
            popularyLabel?.text = NSLocalizedString("popularies", comment: "popularies")
            popularyLabel?.textColor = .black
            let borderColorViewA = UIColor(named: "borderWhite")
            contentViewA?.layer.borderColor = borderColorViewA?.cgColor
            contentViewA?.layer.borderWidth = 2.0
            contentViewA?.layer.cornerRadius = 17
            popularyView?.isHidden = false
            
            contentViewB?.backgroundColor = .black
            ageItemLabel?.text = NSLocalizedString("releases", comment: "releases")
            ageItemLabel?.textColor = .white
            let borderColorViewB = UIColor(named: "borderWhite")
            contentViewB?.layer.borderColor = borderColorViewB?.cgColor
            contentViewB?.layer.borderWidth = 2.0
            contentViewB?.layer.cornerRadius = 17
            ageItemView?.isHidden = true
        }
    }
    
    @IBAction func didTapButtonB(_ sender: UIButton) {
        isValidItemAge = true
        if isValidItemAge {
            isValidItemPopulary = false
            contentViewA?.backgroundColor = .black
            popularyLabel?.text = NSLocalizedString("popularies", comment: "popularies")
            popularyLabel?.textColor = .white
            let borderColorViewA = UIColor(named: "borderWhite")
            contentViewA?.layer.borderColor = borderColorViewA?.cgColor
            contentViewA?.layer.borderWidth = 2.0
            contentViewA?.layer.cornerRadius = 17
            popularyView?.isHidden = true
            
            contentViewB?.backgroundColor = .white
            ageItemLabel?.text = NSLocalizedString("releases", comment: "releases")
            ageItemLabel?.textColor = .black
            let borderColorViewB = UIColor(named: "borderWhite")
            contentViewB?.layer.borderColor = borderColorViewB?.cgColor
            contentViewB?.layer.borderWidth = 2.0
            contentViewB?.layer.cornerRadius = 17
            ageItemView?.isHidden = false
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - UICollectionViewDelegate - UICollectionViewDataSource  UICollectionViewDelegateFlowLayout
extension ListMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.upcomingCollectionView:
            return presenter?.arrayUncomingMovie?.count ?? 0
        case self.topRatedCollectionView:
            return presenter?.arrayTopRatedMovie?.count ?? 0
        default:
            return presenter?.arrayPopularMovie?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.upcomingCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.nibName, for: indexPath) as? UpcomingCollectionViewCell
            cell?.accessibilityIdentifier = UpcomingCollectionViewCell.nibName + "_\(indexPath.row)"
            cell?.iconMovie = presenter?.arrayUncomingMovie?[indexPath.row]
            return cell ?? UICollectionViewCell()
        case self.topRatedCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRatedCollectionViewCell.nibName, for: indexPath) as? TopRatedCollectionViewCell
            cell?.accessibilityIdentifier = TopRatedCollectionViewCell.nibName + "_\(indexPath.row)"
            cell?.iconMovie = presenter?.arrayTopRatedMovie?[indexPath.row]
            return cell ?? UICollectionViewCell()
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.nibName, for: indexPath) as? PopularCollectionViewCell
            cell?.accessibilityIdentifier = PopularCollectionViewCell.nibName + "_\(indexPath.row)"
            cell?.iconMovie = presenter?.arrayPopularMovie?[indexPath.row]
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case self.upcomingCollectionView:
            listMovieSelect = presenter?.arrayUncomingMovie?[indexPath.row]
        case self.topRatedCollectionView:
            listMovieSelect = presenter?.arrayTopRatedMovie?[indexPath.row]
        default:
            listMovieSelect = presenter?.arrayPopularMovie?[indexPath.row]
        }
        presenter?.goToDetailMovie()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.upcomingCollectionView, self.topRatedCollectionView:
            return CGSize(width: 90, height: 130)
        case self.popularyCollectionView:
            switch indexPath.row {
            case 0,1,2,3,4,5:
                let size = collectionView.frame.width/2-1
                return CGSize(width: size, height: size)
            default:
                return CGSize(width: 0, height: 0)
            }
        default:
            switch indexPath.row {
            case 9,10,11,12,13,15:
                let size = collectionView.frame.width/2-1
                return CGSize(width: size, height: size)
            default:
                return CGSize(width: 0, height: 0)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

// MARK: - ListUserViewProtocol
extension ListMovieViewController: ListMovieViewProtocol {
    func reloadData() {
        upcomingCollectionView?.reloadData()
        topRatedCollectionView?.reloadData()
        popularyCollectionView?.reloadData()
        ageItemCollectionView?.reloadData()
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
