import UIKit

extension UIFont {
    class func customFontDisplayBold(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: "SFProDisplay-Bold", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    class func customFontDisplayRegular(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: "SFProDisplay-Regular", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    class func customFontTextSemiBold(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: "SFProText-Semibold", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    class func customFontTextMedium(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: "SFProText-Medium", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    class func customFontTextRegular(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: "SFProText-Regular", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
