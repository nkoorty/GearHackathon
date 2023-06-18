import UIKit

extension UITableView {
    
    func addTopBorder() {
        let border = UIView()
        border.backgroundColor = .gearGreen
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 1)
        addSubview(border)
    }
}

