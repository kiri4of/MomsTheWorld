//
//  HoursView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 16.05.2023.
//

import UIKit

final class HoursView: UIView {
    
    private lazy var workDays = WeekView(.workDay)
    
    private lazy var weekend = WeekView(.weekend)
    
    private lazy var startOfWorkDay = TimeView(.start)
    
    private lazy var endOfWorkDay = TimeView(.end)
    
    private lazy var startOfWeekDay = TimeView(.start)
    
    private lazy var endOfWeekDay = TimeView(.end)
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.addArrangedSubviews(
            workDays,startOfWorkDay,endOfWorkDay,weekend,startOfWeekDay,endOfWeekDay)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HoursView {
    private func setupUI() {
        addSubview(generalStackView)
        
        generalStackView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 16.Vadapted, left: 16, bottom: 42.Vadapted, right: 16))
        }
        
        [startOfWeekDay,endOfWeekDay,startOfWorkDay,endOfWorkDay].forEach { view in
            view.snp.makeConstraints { make in
                make.width.equalTo(generalStackView)
                make.height.equalTo(32)
            }
        }
        
        generalStackView.setCustomSpacing(40, after: startOfWorkDay)
        generalStackView.setCustomSpacing(46, after: endOfWorkDay)
        generalStackView.setCustomSpacing(40, after: startOfWeekDay)
        
        backgroundColor = .white
        layer.cornerRadius = 22
    }
}
