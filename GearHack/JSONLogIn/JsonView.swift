import UIKit

class JsonView: UIView {
    
    lazy var uploadButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold, scale: .large)
        let largeImage = UIImage(systemName: "square.and.arrow.up", withConfiguration: largeConfig)
        button.setImage(largeImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var uploadLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "Import from Polkadot.js", bold: true)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 18, text: "Upload the .json file that you exported from Polkadot.js", bold: false)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        addSubview(uploadButton)
        addSubview(uploadLabel)
        addSubview(descriptionLabel)
        
        uploadButton.anchor(top: topAnchor, paddingTop: 40, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        uploadButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        uploadLabel.anchor(top: uploadButton.bottomAnchor, paddingTop: 22, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        uploadLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        descriptionLabel.anchor(top: uploadLabel.bottomAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 12, right: rightAnchor, paddingRight: 12, width: 0, height: 0)
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true


    }
}
