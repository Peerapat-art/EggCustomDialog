//
//  EggCustomDialogViewController.swift
//  EggCustomDialog
//
//  Created by Peerapat.Pro on 12/12/2562 BE.
//

import UIKit

class EggCustomDialogViewController: UIViewController {
    
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
        }
    }
    
    @IBOutlet weak private var viewDialogWidthConstraint: NSLayoutConstraint! {
        didSet {
            self.viewDialogWidthConstraint.constant = UIScreen.main.bounds.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.45 : 0.75)
        }
    }
    
    @IBOutlet weak private var viewImage: UIImageView! {
        didSet {
            self.viewImage.contentMode = .scaleAspectFit
            self.viewImage.clipsToBounds = true
        }
    }
    
    @IBOutlet weak private var labelTitle: UILabel! {
        didSet {
            self.labelTitle.text = ""
            self.labelTitle.textColor = .black
            self.labelTitle.numberOfLines = 2
        }
    }
    
    @IBOutlet weak private var labelMessage: UILabel! {
        didSet {
            self.labelMessage.text = ""
            self.labelMessage.textColor = .black
            self.labelMessage.numberOfLines = 5
        }
    }
    
    @IBOutlet weak private var buttonLeft: UIButton! {
        didSet {
            self.buttonLeft.titleLabel?.text = ""
            self.buttonLeft.titleLabel?.textColor = .black
            self.buttonLeft.tintColor = .black
            self.buttonLeft.backgroundColor = .lightGray
            self.buttonLeft.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak private var buttonRight: UIButton! {
        didSet {
            self.buttonRight.titleLabel?.text = ""
            self.buttonRight.titleLabel?.textColor = .black
            self.buttonRight.tintColor = .black
            self.buttonRight.backgroundColor = .lightGray
            self.buttonRight.layer.cornerRadius = 5
        }
    }
    
    // MARK: - Properties
    public var mViewBackGround: UIView! {
        get {
            return self.viewBackGround
        } set {
            self.viewBackGround = newValue
        }
    }
    
    public var mViewDialog: UIView! {
        get {
            return self.viewDialog
        } set {
            self.viewDialog = newValue
        }
    }
    
    public var mLabelTitle: UILabel! {
        get {
            return self.labelTitle
        } set {
            self.labelTitle = newValue
        }
    }
    
    public var mLabelMessage: UILabel! {
           get {
               return self.labelMessage
           } set {
               self.labelMessage = newValue
           }
       }
    
    public var mButtonLeft: UIButton! {
           get {
               return self.buttonLeft
           } set {
               self.buttonLeft = newValue
           }
       }
    
    public var mButtonRight: UIButton! {
        get {
            return self.buttonRight
        } set {
            self.buttonRight = newValue
        }
    }
    
    // MARK: - Object Life Cycle
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("\(String(describing: self)) has been deinit.")
    }
    
    // MARK: - View Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - IBActions
    
    // MARK: - Private Methods
    
    // MARK: - Public Methods
   
}
