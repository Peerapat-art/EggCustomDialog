import Foundation
import UIKit

open class EggCustomDialog {
    
    /// Enumeration that specifies dialog style
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
    
    fileprivate var eggCustomDialogViewController = EggCustomDialogViewController()
    
    public func showCustomDialog(styleDialog: StyleDialog, styleButton: StyleButton, styleLabel: StyleLabel,
                                 sTitle: String = "", fontTitle: UIFont = UIFont.boldSystemFont(ofSize: 18), lineTitle: Int = 2, colorTitle: UIColor = .black  ) {
        
        // custom style
        self.eggCustomDialogViewController.mViewImage.isHidden = styleDialog == .noImage
        self.eggCustomDialogViewController.mButtonLeft.isHidden = styleButton == .single
        
        switch styleLabel {
        case .title:
            self.eggCustomDialogViewController.mLabelTitle.isHidden = false
            self.eggCustomDialogViewController.mLabelMessage.isHidden = true
        case .message:
            self.eggCustomDialogViewController.mLabelTitle.isHidden = true
            self.eggCustomDialogViewController.mLabelMessage.isHidden = false
        case .titleMessage:
            self.eggCustomDialogViewController.mLabelTitle.isHidden = false
            self.eggCustomDialogViewController.mLabelMessage.isHidden = false
        }
        
        
    }
}
