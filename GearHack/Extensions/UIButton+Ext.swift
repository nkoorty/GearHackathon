import UIKit

// Extension for laying out UIButton
extension UIButton {
    
    func layout(textcolour: UIColor?, backgroundColour: UIColor?, size: CGFloat?, text: String?, image: UIImage?, cornerRadius: CGFloat?, spacing: CGFloat = 10) {
        setTitle(text, for: .normal)
        setTitleColor(textcolour, for: .normal)
        if let size = size {
            titleLabel?.font = UIFont.boldSystemFont(ofSize: size)
        }

        setImage(image, for: .normal)
        if let radius = cornerRadius {
            layer.cornerRadius = radius
        }
        layer.masksToBounds = true
        backgroundColor = backgroundColour
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
    }
    
    func setsizedImage(symbol: String, size: CGFloat, colour: UIColor) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: symbol, withConfiguration: largeConfig)?.withTintColor(colour).withRenderingMode(.alwaysOriginal)
        self.setImage(largeBoldDoc, for: .normal)
    }
    
    func addPadding(_ padding: CGFloat, spacing: CGFloat = 10) {
        titleEdgeInsets = UIEdgeInsets(top: padding, left: padding + spacing, bottom: padding, right: padding)
        contentEdgeInsets = UIEdgeInsets(top: padding * 2, left: padding * 2, bottom: padding * 2, right: padding * 2)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
    }
}

