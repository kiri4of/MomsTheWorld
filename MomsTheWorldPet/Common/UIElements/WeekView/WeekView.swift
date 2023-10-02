//
//  WeekView.swift
//  Mum’s the word
//
//  Created by Kiri4of on 18.05.2023.
//

import UIKit

final class WeekView: UIStackView {
    
    enum TypeOfDays {
        case workDay
        case weekend
        
        var days: [String] {
            switch self {
            case .weekend: return ["SA", "SU"]
            case .workDay:  return ["MO", "TU", "WE", "TH", "FR"]
            }
        }
    }
    
    private let currentType: TypeOfDays
    
    private let week = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
    
    init(_ currentType: TypeOfDays) {
        self.currentType = currentType
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeekView {
    private func setupUI() {
        axis = .horizontal
        distribution = .fill
        alignment = .center
        spacing = 6.Hadapted
        
        week.forEach { nameOfDay in
            let day = WeekDayView(day: nameOfDay)
            addArrangedSubview(day)
            if currentType.days.contains(nameOfDay) {
                day.isChoosen = true
            } else {
                day.isUserInteractionEnabled = false
            }
        }
    }
}

final class WeekDayView: UIButton {
    var isChoosen: Bool = false {
        didSet {
            changeAppearance(isChoosen)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        sizeToFit()
        let constant = 12.Hadapted
        contentEdgeInsets = UIEdgeInsets(
            top: constant, left: constant,
            bottom: constant, right: constant
        )
    }
    
    init(day: String) {
        super.init(frame: .zero)
        setTitle(day, for: .normal)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setTitleColor(AppColor.fieldColor, for: .normal)
        titleLabel?.font = AppFonts.inter10SemiBold
        layer.cornerRadius = 16
        backgroundColor = .clear
        addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    private func changeAppearance(_ isChossen: Bool) {
        let bgColor: UIColor = isChossen ? AppColor.purplePrimary : UIColor.clear
        let titleColor =  isChossen ? AppColor.lightBlue : AppColor.fieldColor
        backgroundColor = bgColor
        setTitleColor(titleColor, for: .normal)
    }
}

extension WeekDayView {
    @objc
    private func tap() {
        isChoosen.toggle()
        changeAppearance(isChoosen)
    }
}

final class TimeView: UIView {
    
    enum TypeOfView {
        case end
        case start
    }
    
    private var currentType: TypeOfView!
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.purplePrimary
        label.font = AppFonts.inter16Bold
        label.text = currentType == .start ?
        AppStrings.startTime : AppStrings.endTime
        return label
    }()
    
    private lazy var datePicker = CustomTimePicker()
    
    let segmentedControl = RoundedShadowedSegmentedControl()
    
    init(_ currentType: TypeOfView) {
        super.init(frame: .zero)
        self.currentType = currentType
        setupUI()
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 13
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TimeView {
    private func setupUI() {
        segmentedControl.items = ["AM","PM"]
        segmentedControl.selectedSegmentIndex = 0
        addSubview(titleLabel)
        addSubview(stackView)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        stackView.addArrangedSubviews(datePicker,segmentedControl)
        
        segmentedControl.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 96, height: 32))
        }
        
        datePicker.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 72, height: 32))
        }
    }
}

