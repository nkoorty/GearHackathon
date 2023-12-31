import UIKit

class ForYouMarketPlaceSlider: UIView {
    
    lazy var foryouButton: UIButton = {
        let button = UIButton()
        button.setTitle("For you", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 0
        return button
    }()
    
    lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGreen!
        return view
    }()
    
    lazy var marketplaceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Marketplace", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 0
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 12
        stackView.addArrangedSubview(foryouButton)
        stackView.addArrangedSubview(marketplaceButton)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonStackView)
        addSubview(underlineView)
        
        underlineView.anchor(top: foryouButton.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: foryouButton.leftAnchor, paddingLeft: 0, right: foryouButton.rightAnchor, paddingRight: 0, width: 0, height: 2)
        
        buttonStackView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
