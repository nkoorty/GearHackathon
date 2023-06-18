import UIKit

class WalletView: UIView {
    
    lazy var walletButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var walletImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "PolkadotJS")
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 20),
            image.heightAnchor.constraint(equalToConstant: 20)
        ])
        return image
    }()
    
    lazy var walletNameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 16, text: "Polkadot.js", bold: true)
        return label
    }()
    
    lazy var walletStackView: UIStackView = {
       let stackview = UIStackView(arrangedSubviews: [walletImageView, walletNameLabel])
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        stackview.alignment = .center
        stackview.spacing = 8
        return stackview
    }()
    
    lazy var logOutView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var logOutImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "rectangle.portrait.and.arrow.right")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.tintColor = .gearGreen
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 20),
            image.heightAnchor.constraint(equalToConstant: 20)
        ])
        return image
    }()
    
    lazy var logOutLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 16, text: "Disconnect", bold: true)
        return label
    }()
    
    lazy var logOutStackView: UIStackView = {
       let stackview = UIStackView(arrangedSubviews: [logOutImageView, logOutLabel])
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        stackview.alignment = .center
        stackview.spacing = 8
        return stackview
    }()
    
    lazy var addressView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var addressImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Dots")
        image.layer.cornerRadius = 30
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var addressNameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "GearHack Test", bold: true)
        return label
    }()
    
    lazy var addressAddressLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 16, text: "5Ge1V7...tA5nj4", bold: false)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var addressCopyButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.addTarget(self, action: #selector(copyToClipBoard), for: .touchUpInside)
        return button
    }()
    
    @objc func copyToClipBoard() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = "5Ge1V7TXs8zcw9ikearrDXfG7ZedGexfGTH9Ef4FaUtA5nj4"
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        NetworkManager.shared.getAddress() { (result) in
            switch result {
            case .success(let address):
                DispatchQueue.main.async {
                    self.addressAddressLabel.text = address
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        addSubview(addressView)
        addressView.addSubview(addressImageView)
        addressView.addSubview(addressNameLabel)
        addressView.addSubview(addressAddressLabel)
        addressView.addSubview(addressCopyButton)
        addSubview(walletButtonView)
        walletButtonView.addSubview(walletStackView)
        addSubview(logOutView)
        logOutView.addSubview(logOutStackView)
        
        addressView.anchor(top: topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 16, right: rightAnchor, paddingRight: 16, width: 0, height: 118)
        
        addressImageView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: addressView.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 60, height: 60)
        addressImageView.centerYAnchor.constraint(equalTo: addressView.centerYAnchor).isActive = true
        
        addressNameLabel.anchor(top: addressImageView.topAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: addressImageView.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        addressAddressLabel.anchor(top: addressImageView.topAnchor, paddingTop: 32, bottom: nil, paddingBottom: 0, left: addressImageView.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        addressCopyButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 36, width: 40, height: 40)
        addressCopyButton.centerYAnchor.constraint(equalTo: addressView.centerYAnchor).isActive = true

        walletButtonView.anchor(top: addressView.bottomAnchor, paddingTop: 12, bottom: bottomAnchor, paddingBottom: 16, left: leftAnchor, paddingLeft: 16, right: logOutView.leftAnchor, paddingRight: 12, width: 0, height: 0)
        
        walletStackView.translatesAutoresizingMaskIntoConstraints = false
        walletStackView.centerXAnchor.constraint(equalTo: walletButtonView.centerXAnchor).isActive = true
        walletStackView.centerYAnchor.constraint(equalTo: walletButtonView.centerYAnchor).isActive = true
        
        logOutView.anchor(top: addressView.bottomAnchor, paddingTop: 12, bottom: bottomAnchor, paddingBottom: 16, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 16, width: 158, height: 0)
        
        logOutStackView.translatesAutoresizingMaskIntoConstraints = false
        logOutStackView.centerXAnchor.constraint(equalTo: logOutView.centerXAnchor).isActive = true
        logOutStackView.centerYAnchor.constraint(equalTo: logOutView.centerYAnchor).isActive = true
    }
}
