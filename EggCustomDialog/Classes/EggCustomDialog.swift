import Foundation
import UIKit
import EggDeviceExt

extension UIViewController {
    
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
}
