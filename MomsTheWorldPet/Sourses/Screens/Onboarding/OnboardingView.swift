// 
//  OnboardingView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 24.04.2023.
//

import UIKit
import Hero

enum Spacing {
    static let defaultSpacing = 16.Hadapted
    static let height = 43.Vadapted
    static let buttonWidth = 280.Hadapted
    static let buttonHeight = 51.Vadapted
    static let textFieldheight = 48.Vadapted
}

protocol OnboardingViewProtocol: AnyObject {
    func lastPage()
}

final class OnboardingView: UIView, OnboardingPageControlDelegate {    
    
    
    private let navigationView = NavigationOnboadingView()
    
    private lazy var pageControl = OnboardingPageControl(
        numberOfPages: defaultOnboardingModel.count,
        pageShowTime: 15
    )
    
    private let purpleButton = PurpleButton()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: bounds, collectionViewLayout: layout)
        OnboardingCell.registerWithoutNib(for: collection)
        collection.delegate = self
        collection.isPagingEnabled = true
        collection.contentInsetAdjustmentBehavior = .never
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        return collection
    }()
    
    lazy var swipeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = AppStrings.swipeToLearnMore
        label.textAlignment = .center
        label.font = AppFonts.inter14Bold
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    
    weak var delegate: OnboardingViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collection.frame = self.bounds
    }
    
    func currentPageDidFinishProgress() {
        lastPage()
        nextPageAuto(type: .auto)
       
    }
    
    private func lastPage() {
        if pageControl.currentPage == defaultOnboardingModel.count - 1 {
            delegate?.lastPage()
        }
    }
    
    private func nextPageAuto(type: OnboardingPageControl.State) {
        if pageControl.currentPage < defaultOnboardingModel.count - 1 {
            self.pageControl.currentState = type
            pageControl.currentPage += 1
        }
        collection.scrollToItem(at: [0,pageControl.currentPage], at: [], animated: true)
    }
}

extension OnboardingView {
    private func setViews() {
        addSubview(collection)
        addSubview(navigationView)
        addSubview(purpleButton)
        addSubview(swipeLabel)
        addSubview(pageControl)
        pageControl.delegate = self
        setupUI()
        configureUI()
    }
    
    private func setupUI() {
        navigationView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(layoutMargins).inset(Spacing.defaultSpacing)
            make.height.greaterThanOrEqualTo(Spacing.height)
            make.top.equalTo(safeAreaLayoutGuide).offset(layoutMargins.top)
        }
        
        purpleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualTo(safeAreaLayoutGuide).inset(Spacing.height)
            make.width.greaterThanOrEqualTo(Spacing.buttonWidth)
            make.height.greaterThanOrEqualTo(Spacing.buttonHeight)
        }
        
        swipeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(purpleButton.snp.top).offset(-23.Vadapted)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(swipeLabel.snp.top).offset(-8.Vadapted)
        }
    }
    
    private func configureUI() {
        pageControl.currentPage = 0
        purpleButton.setTitle(AppStrings.nextButton, for: .normal)
        purpleButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        navigationView.handler = { [weak self] in self?.delegate?.lastPage() }
        purpleButton.hero.id = "purpleButton"
    }
    
    @objc
    private func nextTap() {
        lastPage()
        nextPageAuto(type: .manual)
    }
}

extension OnboardingView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        defaultOnboardingModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = OnboardingCell.dequeue(collection, for: indexPath)
        var model = defaultOnboardingModel[indexPath.row]
        model.getColots()
        cell.update(model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.bounds.width, height: collection.bounds.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.collection.contentOffset, size: self.collection.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.collection.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentState = .manual
            self.pageControl.currentPage = visibleIndexPath.row
        }
        manualToAuto()
    }
    
    private func manualToAuto() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.pageControl.currentState = .auto
        }
    }
}
