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
    
    static var eggCustomDialogViewController = EggCustomDialogViewController()
    
    public func showCustomDialog() {
        
    }
}
