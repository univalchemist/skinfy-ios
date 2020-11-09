//
//  TextFieldIconView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/15/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
final class TextFieldIconView: BaseCustomView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var txtText: UITextField!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var btnImgRight: UIButton!
    
    @IBInspectable var imageName: String = "" {
        willSet {
            imgIcon.image = UIImage(named: newValue)
        }
    }
    
    @IBInspectable var imageNameHighlighted: String = ""
    @IBInspectable var rightImageName: String = ""
    
    @IBInspectable var label: String = ""
    
    @IBInspectable var placeholder: String = "" {
        willSet {
            txtText.attributedPlaceholder = NSAttributedString(string: newValue, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: Constants.Colors.Empress)])
        }
    }
    @IBInspectable var textColor: String = Constants.Colors.CocoaBrown {
        willSet {
            txtText.textColor = UIColor(hexString: newValue)
        }
    }
    @IBInspectable var lineColor: String = "" {
        willSet {
            viewLine.backgroundColor = UIColor(hexString: newValue)
        }
    }
    @IBInspectable var placeholderColor: String = ""
    @IBInspectable var placeholderColorOpacity: CGFloat = 1.0
    @IBInspectable var isSecureText: Bool = false
    @IBInspectable var alwaysShowLabel: Bool = false
    @IBInspectable var returnKeyType: Int = 0
    
    var textFieldEmptyFlag: Bool = true
    /**
     use this for text field delegate
     */
    var delegate: UITextFieldDelegate?
    
    var isEnabled: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView(contentView: contentView)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initContentView(contentView: contentView)
        customInit()
    }
    
    func customInit() {
        txtText.delegate = self
        btnImgRight.addTarget(self, action: #selector(onBtnTapRevealSecureText), for: .touchUpInside)
        DispatchQueue.main.async {
            self.txtText.returnKeyType = UIReturnKeyType(rawValue: self.returnKeyType) ?? .default
            if (self.isSecureText) {
                self.btnImgRight.isHidden = true
            }
            
            if (!self.isEnabled) {
                self.txtText.isEnabled = self.isEnabled
                self.backgroundColor = UIColor(hexString: Constants.Colors.PinkSwan).withAlphaComponent(0.10)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (imageName == "") {
            imgIcon.removeFromSuperview()
        }
        if (placeholderColor != "") {
            txtText.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: placeholderColor).withAlphaComponent(placeholderColorOpacity)])
        }
        txtText.isSecureTextEntry = isSecureText
        
        if (rightImageName != "") {
            btnImgRight.setImage((UIImage(named: rightImageName)), for: .normal)
        }
        if (alwaysShowLabel) {
            lblLabel.isHidden = false
        }
        lblLabel.text = label
    }
    
    @objc func onBtnTapRevealSecureText() {
        txtText.isSecureTextEntry = !txtText.isSecureTextEntry
    }
}

//MARK: - Text Field Delegates
extension TextFieldIconView: UITextFieldDelegate {
    private func textFieldBeingSet(textField: UITextField) {
        //text field is being set
        textField.font = UIFont(name: Constants.Fonts.RobotoMedium, size: 16)
        if (textFieldEmptyFlag) {
            if (!alwaysShowLabel) {
                lblLabel.isHidden = false
            }
            
            if (imgIcon != nil) {
                imgIcon.image = UIImage(named: imageNameHighlighted)
            }
            
            if (isSecureText) {
                //show eye
                btnImgRight.isHidden = false
            }
        }
        
        textFieldEmptyFlag = false
    }
    
    private func textFieldBecomesEmpty(textField: UITextField) {
        //text field becomes empty
        textField.font = UIFont(name: Constants.Fonts.RobotoRegular, size: 16)
        if (!textFieldEmptyFlag) {
            if (!alwaysShowLabel) {
                lblLabel.isHidden = true
            }
            
            if (imgIcon != nil) {
                imgIcon.image = UIImage(named: imageName)
            }
            
            if (isSecureText) {
                //hide eye
                btnImgRight.isHidden = true
            }
        }
        
        textFieldEmptyFlag = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let string = textField.text?.trim()
        if (string?.count == 0) {
            textFieldBecomesEmpty(textField: textField)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 0 && textField.text?.count == 1 {
            textFieldBecomesEmpty(textField: textField)
        } else {
            textFieldBeingSet(textField: textField)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? true
    }
    
    //TODO: add other text field delegates here if necessary
}
