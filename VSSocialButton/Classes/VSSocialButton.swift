//
//  VSSocialButton.swift
//  VSSocialButton
//
//  Created by Vladyslav Semenchenko on 18/03/2017.
//  Copyright © 2017 Vladyslav Semenchenko. All rights reserved.
//

import UIKit

@IBDesignable class VSSocialButton: UIControl {
    
    // MARK: - Variables
    var view: UIView!
    var animateSocialNetworkImageOnPress: Bool = false
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
    
    @IBInspectable var buttonTitle: String? {
        get {
            return lblButtonTitle.text
        }
        set(text) {
            lblButtonTitle.text = text
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
    
    @IBInspectable var labelTextColor: UIColor? {
        get {
            return lblButtonTitle.textColor
        }
        set(color) {
            lblButtonTitle.textColor = color
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
    
    @IBInspectable var shouldAnimateSocialNetworkImageOnPress: Bool {
        get {
            return animateSocialNetworkImageOnPress
        }
        set(animate) {
            animateSocialNetworkImageOnPress = animate
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    // MARK: - Xib Helper
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "VSSocialButton", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: - User Interaction
    @IBAction func buttonTouchDown(_ sender: Any) {
        self.lblButtonTitle.alpha = 0.2
        
        if animateSocialNetworkImageOnPress {
            self.ivSocialNetworkIcon.alpha = 0.2;
        }
    }
    
    @IBAction func buttonTouchDownRepeat(_ sender: Any) {
        self.lblButtonTitle.alpha = 0.2
        
        if animateSocialNetworkImageOnPress {
            self.ivSocialNetworkIcon.alpha = 0.2;
        }
    }
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        self.sendActions(for: .touchUpInside)
        
        UIView.animate(withDuration: 0.25) {
            self.lblButtonTitle.alpha = 1.0
            
            if self.animateSocialNetworkImageOnPress {
                self.ivSocialNetworkIcon.alpha = 1.0;
            }
        }
    }
    
    @IBAction func buttonTouchCancel(_ sender: Any) {
        UIView.animate(withDuration: 0.25) {
            self.lblButtonTitle.alpha = 1.0
            
            if self.animateSocialNetworkImageOnPress {
                self.ivSocialNetworkIcon.alpha = 1.0;
            }
        }
    }
    
    @IBAction func buttonTouchUpOutside(_ sender: Any) {
        UIView.animate(withDuration: 0.25) {
            self.lblButtonTitle.alpha = 1.0
            
            if self.animateSocialNetworkImageOnPress {
                self.ivSocialNetworkIcon.alpha = 1.0;
            }
        }
    }
}
