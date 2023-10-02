//
//  OnboadringPageControll.swift
//  Mum’s the word
//
//  Created by Kiri4of on 26.04.2023.
//

import Foundation
import UIKit

protocol OnboardingPageControlDelegate: AnyObject {
    func currentPageDidFinishProgress()
}

final class OnboardingPageControl: UIControl {
    weak var delegate: OnboardingPageControlDelegate?
    
    var numberOfPages: Int = 0
    
    enum State {
        case manual
        case auto
    }
    
    var currentState: State = .auto
    
    var currentPage: Int = 0 {
        didSet {
            guard (0...numberOfPages).contains(currentPage) else {
                currentPage = oldValue
                return
            }
            
            updateIndicators()
        }
    }
    
    let indicatorWidth: CGFloat
    
    var currentPageIndicatorTintColor: UIColor = .white
    
    var pageIndicatorTintColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    
    var pageShowTime: TimeInterval
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: progressViews)
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var progressViews: [UIProgressView] = {
        guard numberOfPages > 0 else { return [] }
        
        let progerssViews = (0..<numberOfPages).map { _ in
            let progressView = UIProgressView()
            progressView.trackTintColor = pageIndicatorTintColor
            progressView.progressTintColor = currentPageIndicatorTintColor
            progressView.layer.cornerRadius = indicatorWidth / 2
            progressView.setProgress(1, animated: false)
            progressView.progress = 0
            progressView.clipsToBounds = true
            return progressView
        }
        
        return progerssViews
    }()
    
    private var animator: UIViewPropertyAnimator?
    
    init(numberOfPages: Int = 0,
         currentPageIndicatorTintColor: UIColor = .white,
         pageIndicatorTintColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5),
         pageShowTime: TimeInterval,
         indicatorWidth: CGFloat = 5
    ) {
        self.numberOfPages = numberOfPages
        self.indicatorWidth = indicatorWidth
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.pageShowTime = pageShowTime
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        for progressView in progressViews {
            progressView.snp.makeConstraints { make in
                make.size.equalTo(indicatorWidth)
            }
        }
    }
    
    func pauseCurrentPageProgress() {
        animator?.pauseAnimation()
    }
    
    func continueCurrentPageProgress() {
        animator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
    }
}

extension OnboardingPageControl {
    func updateIndicators() {
        let widthAnimationDuration = 0.25
        
        for (index,progressView) in progressViews.enumerated() where index < currentPage {
            UIView.animate(withDuration: widthAnimationDuration, delay: 0) {
                progressView.constraints.first { $0.firstAttribute == .width }?.constant = self.indicatorWidth
                progressView.progress = 1
                progressView.layoutIfNeeded()
            }
        }
        
        for (index,progressView) in progressViews.enumerated() where index == currentPage {
            UIView.animate(withDuration: widthAnimationDuration, delay: 0, animations: {
                progressView.constraints.first { $0.firstAttribute == .width }?.constant = 8 * self.indicatorWidth
                progressView.progress = 0
                
                progressView.layoutIfNeeded()
            }, completion: { [weak self] _ in
                guard let self else { return }
                self.animator?.stopAnimation(false)
                self.animator?.finishAnimation(at: .end)
                
                self.animator = UIViewPropertyAnimator(duration: self.pageShowTime, curve: .linear) {
                    progressView.setProgress(1, animated: true)
                }
                
                self.animator?.addCompletion { [weak self] position in
                    guard let self, case .end = position else { return }
                    if self.currentState == .auto {
                        self.delegate?.currentPageDidFinishProgress()
                    }
                }
                
                self.animator?.startAnimation()
            })
        }
        
        for (index, progressView) in progressViews.enumerated() where index > currentPage {
            UIView.animate(withDuration: widthAnimationDuration, delay: 0) {
                progressView.constraints.first { $0.firstAttribute == .width }?.constant = self.indicatorWidth
                progressView.progress = 0
                progressView.layoutIfNeeded()
            }
        }
    }
}
