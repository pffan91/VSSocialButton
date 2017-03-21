//
//  VSSocialButton.swift
//  VSSocialButton
//
//  Created by Vladyslav Semenchenko on 18/03/2017.
//  Copyright © 2017 Vladyslav Semenchenko. All rights reserved.
//

import UIKit

@IBDesignable
class VSSocialButton: UIButton {
    
    // MARK: - Variables
    final var view: UIView!
    @IBOutlet weak var ivSocialNetworkIcon: UIImageView!
    @IBOutlet weak var lblButtonTitle: UILabel!

    // MARK: - Inspectables
    @IBInspectable var socialNetworkImage: UIImage? {
        get {
            return ivSocialNetworkIcon.image
        }
        set(image) {
            ivSocialNetworkIcon.image = image
        }
    }
    
    @IBInspectable var buttonBackgroundColor: UIColor? {
        get {
            return view.backgroundColor
        }
        set(color) {
            view.backgroundColor = color
        }
    }
    
    @IBInspectable var buttonCornerRadius: CGFloat {
        get {
            return view.layer.cornerRadius
        }
        set(cornerRadius) {
            view.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var buttonTitle: String? {
        get {
            return lblButtonTitle.text
        }
        set(text) {
            lblButtonTitle.text = text
        }
    }
    
    @IBInspectable var buttonTitleColor: UIColor? {
        get {
            return lblButtonTitle.textColor
        }
        set(color) {
            lblButtonTitle.textColor = color
        }
        
    }
    
    @IBInspectable var buttonTitleFontSize: CGFloat {
        get {
            return lblButtonTitle.font.pointSize
        }
        set(fontSize) {
            lblButtonTitle.font = UIFont.init(name: lblButtonTitle.font.fontName, size: fontSize)
        }
    }
    
    @IBInspectable var buttonTitleFontName: String {
        get {
            return lblButtonTitle.font.fontName
        }
        set(fontName) {
            lblButtonTitle.font = UIFont.init(name: fontName, size: lblButtonTitle.font.pointSize)
        }
    }
    
    @IBInspectable var animationButtonPressDelay: Int = 0
    
    @IBInspectable var shouldAnimateSocialNetworkImageOnPress: Bool = false
    
    @IBInspectable var shouldSlideAnimateButtonPress: Bool = false
    
    // MARK: - View Life Circle
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    // MARK: - Xib Helper
    final func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    final func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "VSSocialButton", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: - User Interaction
    @IBAction func buttonTouchDown(_ sender: Any) {
        animateDown()
    }
    
    @IBAction func buttonTouchDownRepeat(_ sender: Any) {
        animateDown()
    }
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        if shouldSlideAnimateButtonPress {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(animationButtonPressDelay)) {
                self.sendActions(for: .touchUpInside)
            }
        } else {
            self.sendActions(for: .touchUpInside)
        }

        animateUp()
        
        if shouldSlideAnimateButtonPress {
            let originalXPos: CGFloat = self.frame.origin.x
            UIView.animate(withDuration: 1.0, animations: {
                self.frame = CGRect(x: self.frame.origin.x - 1000, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
            }) { (finished) in
                self.frame = CGRect(x: originalXPos, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
            }
        }
    }
    
    @IBAction func buttonTouchCancel(_ sender: Any) {
        animateUp()
    }
    
    @IBAction func buttonTouchUpOutside(_ sender: Any) {
        animateUp()
    }
    
    // MARK: - Private
    func animateDown() {
        self.lblButtonTitle.alpha = 0.2
        
        if shouldAnimateSocialNetworkImageOnPress {
            self.ivSocialNetworkIcon.alpha = 0.2;
        }
    }
    
    func animateUp() {
        UIView.animate(withDuration: 0.25) {
            self.lblButtonTitle.alpha = 1.0
            if self.shouldAnimateSocialNetworkImageOnPress {
                self.ivSocialNetworkIcon.alpha = 1.0;
            }
        }
    }
}
