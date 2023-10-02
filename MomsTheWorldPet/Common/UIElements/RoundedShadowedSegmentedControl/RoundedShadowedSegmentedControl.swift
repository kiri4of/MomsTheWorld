//
//  RoundedShadowedSegmentedControl.swift
//  Mum’s the word
//
//  Created by Kiri4of on 18.05.2023.
//

import UIKit

class RoundedShadowedSegmentedControl: UIControl {
    private let cornerRadius: CGFloat
    private let selectedCornerRadius: CGFloat
    private let shadowColor: UIColor
    private let backgroundColorNormal: UIColor
    private let backgroundColorSelected: UIColor
    
    private let bgView: UIView = UIView()
    private let selectedSegmentView: UIView = UIView()
    
    private var buttons: [UIButton] = []
    private var selectedButtonIndex: Int = 0
    
    override var isEnabled: Bool {
        didSet {
            updateButtonStates()
        }
    }
    
    var selectedSegmentIndex: Int {
        get {
            return selectedButtonIndex
        }
        set {
            if newValue >= 0 && newValue < buttons.count {
                selectedButtonIndex = newValue
                updateButtonStates()
                animateSelection()
                sendActions(for: .valueChanged)
            }
        }
    }
    
    var items: [String]? {
        didSet {
            configureButtons()
            updateButtonAppearance()
            updateButtonStates()
        }
    }
    
    init(cornerRadius: CGFloat = 8.0,
         selectedCornerRadius: CGFloat = 8.0,
         shadowColor: UIColor = .gray,
         backgroundColorNormal: UIColor = AppColor.paleWhite,
         backgroundColorSelected: UIColor = .white) {
        self.cornerRadius = cornerRadius
        self.selectedCornerRadius = selectedCornerRadius
        self.shadowColor = shadowColor
        self.backgroundColorNormal = backgroundColorNormal
        self.backgroundColorSelected = backgroundColorSelected
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        layer.cornerRadius = cornerRadius
        
        bgView.backgroundColor = backgroundColorNormal
        bgView.layer.cornerRadius = cornerRadius
        addSubview(bgView)
        
        selectedSegmentView.backgroundColor = backgroundColorSelected
        selectedSegmentView.layer.cornerRadius = selectedCornerRadius
        selectedSegmentView.layer.shadowColor = shadowColor.cgColor
        selectedSegmentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        selectedSegmentView.layer.shadowOpacity = 0.5
        selectedSegmentView.layer.shadowRadius = 4.0
        addSubview(selectedSegmentView)
        
        updateButtonAppearance()
        updateButtonStates()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgView.frame = bounds
        
        let segmentWidth = bounds.width / CGFloat(buttons.count)
        let segmentHeight = bounds.height
        
        for (index, button) in buttons.enumerated() {
            button.frame = CGRect(x: CGFloat(index) * segmentWidth, y: 0, width: segmentWidth, height: segmentHeight)
        }
        
        selectedSegmentView.frame = buttons[selectedButtonIndex].frame.insetBy(dx: 2, dy: 2)
    }
    
    private func configureButtons() {
        buttons.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        
        guard let items = items else {
            return
        }
        
        for (index, title) in items.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            button.tag = index
            button.addTarget(self, action: #selector(segmentButtonTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            addSubview(button)
        }
    }
   
        private func updateButtonAppearance() {
            buttons.enumerated().forEach { index, button in
                let isButtonSelected = index == selectedButtonIndex
                button.layer.cornerRadius = isButtonSelected ? selectedCornerRadius : cornerRadius
                button.backgroundColor = .clear
                button.setTitleColor(.black, for: .normal)
            }
        }
        
        private func updateButtonStates() {
            buttons.enumerated().forEach { index, button in
                button.isEnabled = isEnabled
                button.isSelected = index == selectedButtonIndex
            }
        }
        
        @objc private func segmentButtonTapped(_ sender: UIButton) {
            selectedSegmentIndex = sender.tag
        }
        
        private func animateSelection() {
            let selectedButton = buttons[selectedButtonIndex]
            
            UIView.animate(withDuration: 0.1) {
                self.selectedSegmentView.frame = selectedButton.frame.insetBy(dx: 2, dy: 2)
            }
        }
    }
