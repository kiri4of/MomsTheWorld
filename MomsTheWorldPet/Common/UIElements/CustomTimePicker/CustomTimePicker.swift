//
//  CustomTimePicker.swift
//  Mum’s the word
//
//  Created by Kiri4of on 17.05.2023.
//

import UIKit

final class CustomTimePicker: UIControl {
    private var button: UIButton!
    private var timePicker: TimePicker!
    private var popover: UIPopoverPresentationController?
    
    var selectedTime: String? {
        didSet {
            if let selectedTime = selectedTime {
                button.setTitle(selectedTime, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
        setupTimePicker()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = 8
        setupButton()
        setupTimePicker()
    }
    
    private func setupButton() {
        button?.removeFromSuperview()
        button = UIButton(type: .system)
        button.setTitle("9:00", for: .normal)
        button.addTarget(self, action: #selector(showPopover), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = AppFonts.inter20Regular
        button.frame = bounds
        backgroundColor = AppColor.paleWhite
        addSubview(button)
    }
    
    private func setupTimePicker() {
        timePicker?.removeFromSuperview()
        timePicker = TimePicker()
        timePicker.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        timePicker.addTarget(self, action: #selector(timePickerValueChanged), for: .valueChanged)
    }
    
    @objc private func showPopover() {
        let popoverContent = UIViewController()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 150, height: 100)
        popoverContent.view.addSubview(timePicker)
        popover = popoverContent.popoverPresentationController
        popover?.permittedArrowDirections = []
        popover?.sourceView = button
        popover?.delegate = self
        
        present(popoverContent, animated: true, completion: nil)
    }
    
    @objc private func timePickerValueChanged() {
        let hours = timePicker.selectedTime.hours
        let minutes = "\(timePicker.selectedTime.minutes)"
        selectedTime = "\(hours):\(minutes.count == 1 ? ("0" + minutes) : minutes )"
    }
    
    private func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        layoutIfNeeded()
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        
        if let popoverPresentationController = viewController.popoverPresentationController {
            popoverPresentationController.delegate = self
            popoverPresentationController.sourceView = button
            popoverPresentationController.sourceRect = CGRect(x: -bounds.width/2, y: 2.5 * bounds.maxY, width: bounds.width, height: bounds.height)
            popoverPresentationController.canOverlapSourceViewRect = true
            popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection(rawValue:0)

        }
        
        rootViewController.present(viewController, animated: animated, completion: completion)
    }
}

extension CustomTimePicker: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}


