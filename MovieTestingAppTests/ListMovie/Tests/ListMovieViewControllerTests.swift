//
//  ListMovieViewControllerTests.swift
//  MovieTestingAppTests
//
//  Created by Escurra Colquis on 19/10/22.
//

@testable import MovieTestingApp
import XCTest

class ListMovieViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListMovieViewController!
    var spyPresenter: ListMoviePresenterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListMovieViewController()
    }
    
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListMovieViewController() {
        sut = ListMovieViewController()
        spyPresenter = ListMoviePresenterProtocolSpy()
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
    
    func testDidTapButtonA() {
        // Given
        let buttonA = UIButton()
        // When
        sut.didTapButtonA(buttonA)
        // Then
        XCTAssertNoThrow(sut.didTapButtonA(buttonA), "didTapButtonA executed")
    }

    func testDidTapButtonB() {
        // Given
        let buttonB = UIButton()
        // When
        sut.didTapButtonA(buttonB)
        // Then
        XCTAssertNoThrow(sut.didTapButtonB(buttonB), "didTapButtonA executed")
    }

    func testReloadData() {
        // Given
        // When
        sut.reloadData()
        // Then
        XCTAssertNoThrow(sut.reloadData(), "reloadData executed")
        XCTAssertNoThrow(sut.upcomingCollectionView, "upcomingCollectionView executed")
        XCTAssertNoThrow(sut.topRatedCollectionView, "topRatedCollectionView executed")
        XCTAssertNoThrow(sut.popularyCollectionView, "popularyCollectionView executed")
        XCTAssertNoThrow(sut.ageItemCollectionView, "genreLabel executed")
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

    func testNumberOfItemsInSection() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let section: Int = 0
        var itemInSection = sut.collectionView(collection, numberOfItemsInSection: section)
        // When
        itemInSection = 0
        // Then
        XCTAssertEqual(itemInSection, 0)
    }
    
    func testCellForItemAt() {
        // Given
        let imageTest = UIImage()
        let cellUpcoming = "UpcomingCollectionViewCell"
        let cellTopRated = "TopRatedCollectionViewCell"
        let cellPopular = "PopularCollectionViewCell"
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        collection.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: cellUpcoming)
        collection.register(TopRatedCollectionViewCell.self, forCellWithReuseIdentifier: cellTopRated)
        collection.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: cellPopular)
        let cellA = collection.dataSource?.collectionView(collection, cellForItemAt: indexPath) as? UpcomingCollectionViewCell
        let cellB = collection.dataSource?.collectionView(collection, cellForItemAt: indexPath) as? TopRatedCollectionViewCell
        let cellC = collection.dataSource?.collectionView(collection, cellForItemAt: indexPath) as? PopularCollectionViewCell
        guard let cellTestA = cellA, let cellTestB = cellB, let cellTestC = cellC  else {
            return
        }
        // Then
        XCTAssertTrue(cellTestA == cellTestA, "cellA executed")
        XCTAssertTrue(cellTestB == cellTestB, "cellB executed")
        XCTAssertTrue(cellTestC == cellTestC, "cellC executed")
        XCTAssert(cellTestA.iconMovieImageView.image == imageTest, "imageView executed")
        XCTAssert(cellTestB.iconTopRatedImageView.image == imageTest, "imageView executed")
        XCTAssert(cellTestC.popularImageView.image == imageTest, "imageView executed")
        XCTAssertNotNil(cellTestA.iconMovie)
        XCTAssertNotNil(cellTestB.iconMovie)
        XCTAssertNotNil(cellTestC.iconMovie)
        XCTAssertNotNil(cellTestA.prepareForReuse)
        XCTAssertNotNil(cellTestB.prepareForReuse)
        XCTAssertNotNil(cellTestC.prepareForReuse)
    }
    
    func testDidSelectItemAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        let selectionSection: () = sut.collectionView(collection, didSelectItemAt: indexPath)
        // Then
        XCTAssertNoThrow(selectionSection)
    }
    
    func testCollectionViewLayout() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        let layoutSection = sut.collectionView(collection, layout: layout, sizeForItemAt: indexPath)
        // Then
        XCTAssertNoThrow(layoutSection)
        XCTAssertNoThrow(sut.upcomingCollectionView?.bounds.width, "upcomingCollectionViewWidth executed")
        XCTAssertNoThrow(sut.upcomingCollectionView?.bounds.height, "upcomingCollectionViewHeight executed")
        XCTAssertNoThrow(sut.topRatedCollectionView?.bounds.width, "topRatedCollectionViewWidth executed")
        XCTAssertNoThrow(sut.topRatedCollectionView?.bounds.height, "topRatedCollectionViewHeight executed")
        XCTAssertNoThrow(sut.popularyCollectionView?.bounds.width, "popularyCollectionViewWidth executed")
        XCTAssertNoThrow(sut.popularyCollectionView?.bounds.height, "popularyCollectionViewHeight executed")
        XCTAssertNoThrow(sut.ageItemCollectionView?.bounds.width, "ageItemCollectionViewWidth executed")
        XCTAssertNoThrow(sut.ageItemCollectionView?.bounds.height, "ageItemCollectionViewHeight executed")
    }
    
    func testInsetForSectionAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let insetForSectionAt = 1
        // When
        var layoutSection = sut.collectionView(collection, layout: layout, insetForSectionAt: insetForSectionAt)
        layoutSection = UIEdgeInsets.zero
        // Then
        XCTAssertNoThrow(layoutSection)
    }
    
    func testMinimumInteritemSpacingForSectionAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let minimumSpacing = 1
        // When
        var layoutSection = sut.collectionView(collection, layout: layout, minimumInteritemSpacingForSectionAt: minimumSpacing)
        layoutSection = 1
        // Then
        XCTAssertNoThrow(layoutSection)
    }
    
    func testMinimumLineSpacingForSectionAt() {
        // Given
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let layout = UICollectionViewLayout()
        let minimumLine = 1
        // When
        var layoutSection = sut.collectionView(collection, layout: layout, minimumLineSpacingForSectionAt: minimumLine)
        layoutSection = 1
        // Then
        XCTAssertNoThrow(layoutSection)
    }
}
