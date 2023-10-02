//
//  TapableLabel.swift
//  Mum’s the word
//
//  Created by Kiri4of on 01.05.2023.
//

import UIKit

enum TypeOfTypeWords {
    case white
    case yellow
    
    var attributes: [NSAttributedString.Key : Any] {
        switch self {
        case .white:
            return [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: UIColor.white,
                .foregroundColor: UIColor.white
            ]
        case .yellow:
            return [
                .foregroundColor: AppColor.primaryOrange,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: AppColor.primaryOrange
            ]
        }
    }
}

final class TapableLabel: UILabel {
    
    var rangeTapHandler: (() -> ())?
    private var currentAttr: TypeOfTypeWords?
    
    init(
        text: String,
        tapWord: String,
        attr: TypeOfTypeWords,
        rangeTapHandler: ( () -> Void)? = nil) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = .white
        self.rangeTapHandler = rangeTapHandler
        self.currentAttr = attr
        addTarget(tapWord: tapWord)
        addAttributes(tapWord: tapWord)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTarget(tapWord: String) {
        addRangeGesture(stringRange: tapWord) { [weak self] in
            self?.rangeTapHandler?()
        }
    }
        
    private func addAttributes(tapWord: String) {
        if
            let attr = currentAttr,
            let text = self.text
        {
            let attributes = attr.attributes
            let nsNutableString = NSMutableAttributedString(string: text)
            let range = (nsNutableString.string as NSString).range(of: tapWord)
            nsNutableString.addAttributes(attributes, range: range)
            self.attributedText = nsNutableString
        }
    }
}

final class RangeGestureRecognizer: UITapGestureRecognizer {
    typealias MethodHandler = () -> Void
    static var stringRange: String?
    static var function: MethodHandler?
    
    func didTapAttributedTextInLabel(
        label: UILabel,
        inRange targetRange: NSRange
    ) -> Bool {
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
