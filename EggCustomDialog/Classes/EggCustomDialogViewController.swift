//
//  EggCustomDialogViewController.swift
//  EggCustomDialog
//
//  Created by Peerapat.Pro on 12/12/2562 BE.
//

import UIKit
import Foundation
import EggDeviceExt

public protocol EggCustomDialogDelegate: class {
    func didTapLeftButton()
    func didTapRightButton()
}

public extension EggCustomDialogDelegate {
    func didTapLeftButton() {
        print("Did Tap Left Button")
    }
    
    func didTapRightButton() {
        print("Did Tap Right Button")
    }
}

public class EggCustomDialogViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var viewBackGround: UIView! {
        didSet {
            self.viewBackGround.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
    
    @IBOutlet weak private var viewDialog: UIView! {
        didSet {
            self.viewDialog.backgroundColor = .white
            self.viewDialog.layer.cornerRadius = 10
            self.viewDialog.isHidden = true
        }
    }
    
    @IBOutlet weak private var viewDialogWidthConstraint: NSLayoutConstraint! {
        didSet {
            self.viewDialogWidthConstraint.constant = UIScreen.main.bounds.width * (UIDevice.iPad ? 0.45 : 0.75)
        }
    }
    
    @IBOutlet weak private var viewImage: ScaledHeightImageView! {
        didSet {
            self.viewImage.contentMode = .scaleAspectFill
            self.viewImage.clipsToBounds = true
        }
    }
    
    @IBOutlet weak private var labelTitle: UILabel! {
        didSet {
            self.labelTitle.textColor = .black
            self.labelTitle.numberOfLines = 2
        }
    }
    
    @IBOutlet weak private var labelMessage: UILabel! {
        didSet {
            self.labelMessage.textColor = .black
            self.labelMessage.numberOfLines = 5
        }
    }
    
    @IBOutlet weak private var buttonLeft: UIButton! {
        didSet {
            self.buttonLeft.setTitle("", for: .normal)
            self.buttonLeft.titleLabel?.textColor = .black
            self.buttonLeft.tintColor = .black
            self.buttonLeft.backgroundColor = .lightGray
            self.buttonLeft.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak private var buttonRight: UIButton! {
        didSet {
            self.buttonRight.setTitle("", for: .normal)
            self.buttonRight.titleLabel?.textColor = .black
            self.buttonRight.tintColor = .black
            self.buttonRight.backgroundColor = .lightGray
            self.buttonRight.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak private var imageLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak private var imageTrillingConstraint: NSLayoutConstraint!
    
    
    public var content = CustomDialogTheme(sTitle: "", sMessage: "")
    public weak var delegate: EggCustomDialogDelegate?
    
    // MARK: - View Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    }
    
    // MARK: - IBActions
    @IBAction private func tapBtnLeft(_ sender: Any) {
        self.delegate?.didTapLeftButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func tapBtnRight(_ sender: Any) {
        self.delegate?.didTapRightButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Public Enum
    public enum StyleDialog {
        case withImageSmall
        case withImageLarge
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
    
    // MARK: - Public Struct
    public struct CustomDialogTheme {
        let sTitle: String
        let fontTitle: UIFont
        let numberOflineTitle: Int
        let colorTitle: UIColor
        let sMessage: String
        let fontMessage: UIFont
        let numberOflineMessage: Int
        let colorMessage: UIColor
        let img: UIImage
        let btnLeftTitle: String
        let btnLeftFont: UIFont
        let btnLeftTitleColor: UIColor
        let btnLeftBackgroundColor: UIColor
        let btnRightTitle: String
        let btnRightFont: UIFont
        let btnRightTitleColor: UIColor
        let btnRightBackgroundColor: UIColor
        let styleDialog: StyleDialog
        let styleButton: StyleButton
        let styleLabel: StyleLabel
        
        public init(sTitle: String,
                    fontTitle: UIFont = UIFont.boldSystemFont(ofSize: 20),
                    numberOflineTitle: Int = 2,
                    colorTitle: UIColor = .black,
                    sMessage: String,
                    fontMessage: UIFont = UIFont.systemFont(ofSize: 16),
                    numberOflineMessage: Int = 5,
                    colorMessage: UIColor = .black,
                    img: UIImage = UIImage(),
                    btnLeftTitle: String = "Cancel",
                    btnLeftFont: UIFont = UIFont.boldSystemFont(ofSize: 16),
                    btnLeftTitleColor: UIColor = .black,
                    btnLeftBackgroundColor: UIColor = .gray,
                    btnRightTitle: String = "Ok",
                    btnRightFont: UIFont = UIFont.boldSystemFont(ofSize: 16),
                    btnRightTitleColor: UIColor = .black,
                    btnRightBackgroundColor: UIColor = .gray,
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
            self.img = img
            self.btnLeftTitle = btnLeftTitle
            self.btnLeftFont = btnLeftFont
            self.btnLeftTitleColor = btnLeftTitleColor
            self.btnLeftBackgroundColor = btnLeftBackgroundColor
            self.btnRightTitle = btnRightTitle
            self.btnRightFont = btnRightFont
            self.btnRightTitleColor = btnRightTitleColor
            self.btnRightBackgroundColor = btnRightBackgroundColor
            self.styleDialog = styleDialog
            self.styleButton = styleButton
            self.styleLabel = styleLabel
        }
    }
    
    // MARK: - Public func
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
        
        switch content.styleDialog {
        case .noImage:
            self.viewImage.isShowImage = false
        case .withImageSmall:
            self.imageLeadingConstraint.constant = 100
            self.imageTrillingConstraint.constant = 100
            self.viewImage.isShowImage = true
        case .withImageLarge:
            self.imageLeadingConstraint.constant = 16
            self.imageTrillingConstraint.constant = 16
            self.viewImage.isShowImage = true
            
        }
        
        self.viewImage.image = content.img
        
        self.labelTitle.text = content.sTitle
        self.labelTitle.font = content.fontTitle
        self.labelTitle.numberOfLines = content.numberOflineTitle
        self.labelTitle.textColor = content.colorTitle
        
        self.labelMessage.text = content.sMessage
        self.labelMessage.font = content.fontMessage
        self.labelMessage.numberOfLines = content.numberOflineMessage
        self.labelMessage.textColor = content.colorMessage
        
        self.buttonLeft.setTitle(content.btnLeftTitle, for: .normal)
        self.buttonLeft.titleLabel?.font = content.btnLeftFont
        self.buttonLeft.tintColor = content.btnLeftTitleColor
        self.buttonLeft.backgroundColor = content.btnLeftBackgroundColor
        
        self.buttonRight.setTitle(content.btnRightTitle, for: .normal)
        self.buttonRight.titleLabel?.font = content.btnRightFont
        self.buttonRight.tintColor = content.btnRightTitleColor
        self.buttonRight.backgroundColor = content.btnRightBackgroundColor
    }
    
    public func showDialog() {
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
            self.setContent(content: self.content)
            self.viewDialog.isHidden = false
        }
    }
}

public class ScaledHeightImageView: UIImageView {
    var isShowImage = true
    
    public override var intrinsicContentSize: CGSize {
        previousLayoutWidth = bounds.width
        
        guard let image = self.image else {
            return super.intrinsicContentSize
        }
        
        if self.isShowImage {
            return CGSize(
                width: 90,
                height: bounds.width / image.size.aspectRatio
            )
        } else {
            return CGSize(
                width: 0,
                height: 0
            )
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if previousLayoutWidth != bounds.width {
            invalidateIntrinsicContentSize()
        }
    }
    
    private var previousLayoutWidth: CGFloat = 0
}

extension CGSize {
    public var aspectRatio: CGFloat {
        return width / height
    }
}
