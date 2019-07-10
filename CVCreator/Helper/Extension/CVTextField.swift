//
//  CVTextField.swift
//  CVCreater
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

@objc enum TextFieldValidationType:NSInteger {
    case optionalType = 0
    case required = 1
    case email = 2
    case phone = 3
    case password = 4
    case number = 5
    case name = 6
}

@objc protocol CVTextfieldDelegate: NSObjectProtocol {
    func changeText(textField:CVTextField)
}

class CVTextField: UITextField, UITextFieldDelegate {
    
    @IBInspectable
    var objectKey:String = ""{
        didSet {
            
        }
    }
    
    var isInitialised:Bool = true
    
    weak var cvDelegate: CVTextfieldDelegate?
    
    @IBInspectable var validation:Int = 0
        {
        willSet {
            
        }
        didSet{
            self.validationType = TextFieldValidationType(rawValue: validation)!
            if validation != 2 && validation != 4{
                self.autocapitalizationType = .sentences
            }
        }
    }
    
    var validationType:TextFieldValidationType = .optionalType{
        didSet {
            switch self.validationType {
            case .email:
                self.keyboardType = .emailAddress
                break
            case .phone, .number:
                self.keyboardType = .phonePad
                self.font = UIFont.appMediumFontWithSize(size: 16)
                break
            case .password:
                self.isSecureTextEntry = true
                break
            default:
                self.keyboardType = .alphabet
                break
            }
        }
        willSet {
            
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()

        NotificationCenter.default.addObserver(self, selector: #selector(self.textChange), name: UITextField.textDidChangeNotification, object: nil)
        setupFieldCustomization()
    }
    
    func setupFieldCustomization() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.AppBorderGrayColor().cgColor
        self.layer.cornerRadius = self.frame.size.height/2
        self.textColor = UIColor.AppTextFieldBlackColor()
        self.backgroundColor = UIColor.clear
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftViewMode = .always
        self.font = UIFont.appMediumFontWithSize(size: 16.0)
        self.autocorrectionType = .no
    }
    
    @objc func textChange(notificationName:Notification) {
        
        var newText = self.text
        self.text = self.removeWhiteSpaceFromStarting(text: newText!)
        if self.validationType == .number {
            if !self.text!.hasOnlyNUmber {
                newText = String(text!.self.dropLast())
                self.text = newText
                return
            }
        }
            
        else if(self.validationType == .email){
            self.text = newText?.trimmed
        }
        _ = self.validate()
        
        self.cvDelegate?.changeText(textField: self)   
    }
    
    var isvalidPassword: Bool{
        let passWordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passWordRegEx)
        return passwordTest.evaluate(with: self.text)
    }
    
    func setCursorAtLastosition(){
        let position = self.endOfDocument
        self.selectedTextRange = self.textRange(from: position, to: position)
    }
    
    func removeWhiteSpaceFromStarting(text:String) -> String{
        var newText = text
        
        if (newText.hasPrefix(" ")) {
            newText = String(newText.dropFirst())
            _ = self.removeWhiteSpaceFromStarting(text: newText)
        }
        return newText
    }

    func validate(classInitialised:Bool = false) -> Bool{
        if isInitialised {
            isInitialised = false
            return true
        }
        if classInitialised{
            return true
        }
        
        self.layer.borderWidth = 1.0
        var isValid:Bool = false
        
        if self.text!.trimmed.length == 0{
            return false
        }
        
        switch self.validationType
        {
        case .email:
            isValid = self.text?.isEmail ?? false
            break
        case .required:
            isValid = !self.text!.isEmpty
            break
        case .phone:
            if self.text?.hasOnlyNUmber ?? false && self.text?.length ?? 0 <= 11{
                isValid = true
            }
            break
        case .number:
            isValid = self.text?.hasOnlyNUmber ?? false
            break
        case .password:
            isValid = isvalidPassword
            break
        default:
            isValid = true
            break
        }
        return isValid
    }

    @IBInspectable var isDropDown:Bool = false{
        didSet {
            if self.placeholder != nil {
                let placeHolderString = NSMutableAttributedString(string: self.placeholder!,attributes: [NSAttributedString.Key.foregroundColor: UIColor.AppTextFieldBlackColor()] )
                self.attributedPlaceholder = placeHolderString
            }
        }
    }
    
    
}
