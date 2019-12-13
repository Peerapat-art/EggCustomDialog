//
//  EggCustomDialogViewController.swift
//  EggCustomDialog
//
//  Created by Peerapat.Pro on 12/12/2562 BE.
//

import UIKit
import Foundation
import EggDeviceExt

public class EggCustomDialogViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak public var viewBackGround: UIView! {
        didSet {
            self.viewBackGround.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
    
    @IBOutlet weak public var viewDialog: UIView! {
        didSet {
            self.viewDialog.backgroundColor = .white
            self.viewDialog.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak public var viewDialogWidthConstraint: NSLayoutConstraint! {
        didSet {
            self.viewDialogWidthConstraint.constant = UIScreen.main.bounds.width * (UIDevice.iPad ? 0.45 : 0.75)
        }
    }
    
    @IBOutlet weak public var viewImage: UIImageView! {
        didSet {
            self.viewImage.contentMode = .scaleAspectFit
            self.viewImage.clipsToBounds = true
        }
    }
    
    @IBOutlet weak public var labelTitle: UILabel! {
        didSet {
            self.labelTitle.textColor = .black
            self.labelTitle.numberOfLines = 2
        }
    }
    
    @IBOutlet weak public var labelMessage: UILabel! {
        didSet {
            self.labelMessage.textColor = .black
            self.labelMessage.numberOfLines = 5
        }
    }
    
    @IBOutlet weak public var buttonLeft: UIButton! {
        didSet {
            self.buttonLeft.titleLabel?.textColor = .black
            self.buttonLeft.tintColor = .black
            self.buttonLeft.backgroundColor = .lightGray
            self.buttonLeft.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak public var buttonRight: UIButton! {
        didSet {
            self.buttonRight.titleLabel?.textColor = .black
            self.buttonRight.tintColor = .black
            self.buttonRight.backgroundColor = .lightGray
            self.buttonRight.layer.cornerRadius = 5
        }
    }
    
//    // MARK: - Properties
//    public var mViewBackGround: UIView! {
//        get {
//            return self.viewBackGround
//        } set {
//            self.viewBackGround = newValue
//        }
//    }
//
//    public var mViewDialog: UIView! {
//        get {
//            return self.viewDialog
//        } set {
//            self.viewDialog = newValue
//        }
//    }
//
//    public var mViewImage: UIImageView! {
//        get {
//            return self.viewImage
//        } set {
//            self.viewImage = newValue
//        }
//    }
//
//    public var mLabelTitle: UILabel! {
//        get {
//            return self.labelTitle
//        } set {
//            self.labelTitle = newValue
//        }
//    }
//
//    public var mLabelMessage: UILabel! {
//        get {
//            return self.labelMessage
//        } set {
//            self.labelMessage = newValue
//        }
//    }
//
//    public var mButtonLeft: UIButton! {
//        get {
//            return self.buttonLeft
//        } set {
//            self.buttonLeft = newValue
//        }
//    }
//
//    public var mButtonRight: UIButton! {
//        get {
//            return self.buttonRight
//        } set {
//            self.buttonRight = newValue
//        }
//    }
    
    public var content = CustomDialogTheme(sTitle: "", sMessage: "")
    
    // MARK: - View Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setContent(content: self.content)
//        self.view.backgroundColor = .red
    }
    
    // MARK: - IBActions
    
    // MARK: - Private Methods
    
    // MARK: - Public Methods
    
    public struct CustomDialogTheme {
        let sTitle: String
        let fontTitle: UIFont
        let numberOflineTitle: Int
        let colorTitle: UIColor
        let sMessage: String
        let fontMessage: UIFont
        let numberOflineMessage: Int
        let colorMessage: UIColor
        let styleDialog: StyleDialog
        let styleButton: StyleButton
        let styleLabel: StyleLabel
        
        public init(sTitle: String,
                    fontTitle: UIFont = UIFont.boldSystemFont(ofSize: 18),
                    numberOflineTitle: Int = 2,
                    colorTitle: UIColor = .black,
                    sMessage: String,
                    fontMessage: UIFont = UIFont.systemFont(ofSize: 16),
                    numberOflineMessage: Int = 5,
                    colorMessage: UIColor = .black,
                    styleDialog: StyleDialog = .noImage,
                    styleButton: StyleButton = .choice,
                    styleLabel: StyleLabel = .titleMessage) {
            
            self.sTitle = sTitle
            self.fontTitle = fontTitle
            self.numberOflineTitle = numberOflineTitle
            self.colorTitle = colorTitle
            self.sMessage = sMessage
            self.fontMessage = fontMessage
            self.numberOflineMessage = numberOflineMessage
            self.colorMessage = colorMessage
            self.styleDialog = styleDialog
            self.styleButton = styleButton
            self.styleLabel = styleLabel
        }
    }
    
    
    public func setContent(content: CustomDialogTheme) {
        
        self.viewImage.isHidden = content.styleDialog == .noImage
        self.buttonLeft.isHidden = content.styleButton == .single
        
        switch content.styleLabel {
        case .title:
            self.labelTitle.isHidden = false
            self.labelMessage.isHidden = true
        case .message:
            self.labelTitle.isHidden = true
            self.labelMessage.isHidden = false
        case .titleMessage:
            self.labelTitle.isHidden = false
            self.labelMessage.isHidden = false
        }
        
        self.labelTitle.text = content.sTitle
        self.labelMessage.text = content.sMessage
        
    }
    
    public func showDialog() {
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
        }
    }
}

public enum StyleDialog {
    case withImage
    case noImage
}

public enum StyleButton {
    case single
    case choice
}

public enum StyleLabel {
    case title
    case message
    case titleMessage
}
