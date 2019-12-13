
import UIKit

extension UIDevice {
    public static var deviceType: UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
    public static var iPhone: Bool {
        return deviceType == .phone
    }
    
    public static var iPad: Bool {
        return deviceType == .pad
    }
    
    public enum ScreenInchType: Int {
        case iPhone4in
        case iPhone4dot7in
        case iPhone5dot5in
        case iPhone5dot8in
        case iPhone6dot1in
        case iPhone6dot5in
        case iPad9dot7in
        case iPad10dot5in
        case iPad11in
        case iPad12dot9in
        case unknown
    }
    
    public static var screenInchType: ScreenInchType {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return .iPhone4in
        case 1334:
            return .iPhone4dot7in
        case 1920, 2208:
            return .iPhone5dot5in
        case 2436:
            return .iPhone5dot8in
        case 1792:
            return .iPhone6dot1in
        case 2688:
            return .iPhone6dot5in
        case 2048:
            return .iPad9dot7in
        case 2224:
            return .iPad10dot5in
        case 2388:
            return .iPad11in
        case 2732:
            return .iPad12dot9in
        default:
            return .unknown
        }
    }
    
    public enum SizeAssociatedDevice {
        case iPhone4in(CGFloat)
        case iPhone4dot7in(CGFloat)
        case iPhone5dot5in(CGFloat)
        case iPhone5dot8in(CGFloat)
        case iPhone6dot1in(CGFloat)
        case iPhone6dot5in(CGFloat)
        case iPad9dot7(CGFloat)
        case iPad10dot5(CGFloat)
        case iPad11in(CGFloat)
        case iPad12dot9(CGFloat)
    }
    
    public static func sizeForAssociated(_ sizeDevices: [SizeAssociatedDevice], defaultSize: CGFloat = 16) -> CGFloat {
        for sizeAssociated in sizeDevices {
            switch sizeAssociated {
            case .iPhone4in(let size) where UIDevice.screenInchType == .iPhone4in:
                return size
            case .iPhone4dot7in(let size) where UIDevice.screenInchType == .iPhone4dot7in:
                return size
            case .iPhone5dot5in(let size) where UIDevice.screenInchType == .iPhone5dot5in:
                return size
            case .iPhone5dot8in(let size) where UIDevice.screenInchType == .iPhone5dot8in:
                return size
            case .iPhone6dot1in(let size) where UIDevice.screenInchType == .iPhone6dot1in:
                return size
            case .iPhone6dot5in(let size) where UIDevice.screenInchType == .iPhone6dot5in:
                return size
            case .iPad9dot7(let size) where UIDevice.screenInchType == .iPad9dot7in:
                return size
            case .iPad10dot5(let size) where UIDevice.screenInchType == .iPad10dot5in:
                return size
            case .iPad11in(let size) where UIDevice.screenInchType == .iPad11in:
                return size
            case .iPad12dot9(let size) where UIDevice.screenInchType == .iPad12dot9in:
                return size
            default: continue
            }
        }
        return defaultSize
    }
    
    public static var deviceID: String {
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            return uuid
        }
        return ""
    }
}
