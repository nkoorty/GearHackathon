import UIKit

class MiddleButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.gearGreen!.cgColor, UIColor.gearBlue!.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0)
        l.endPoint = CGPoint(x: 1, y: 1)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
