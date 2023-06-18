import UIKit

class LogInViewController: UIViewController {
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "Background")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "Import your account by connecting via one of the provided methods", bold: false)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var polkadotButton: UIButton = {
        let button = UIButton(type: .system)
        button.layout(textcolour: .white, backgroundColour: .white.withAlphaComponent(0.1), size: 19, text: "Polkadot.js", image: UIImage(systemName: "trash.circle.fill"), cornerRadius: 8)
        button.addTarget(self, action: #selector(tappedLogIn), for: .touchUpInside)
        return button
    }()
    
    lazy var polkadotJSLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "PolkadotJS")
        image.layer.cornerRadius = 12.5
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var qrcodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layout(textcolour: .white, backgroundColour: .white.withAlphaComponent(0.1), size: 19, text: "QR Code", image: UIImage(systemName: "qrcode"), cornerRadius: 8)
        button.addTarget(self, action: #selector(tappedLogIn), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLogIn() {
        let vc = JsonViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .gearBlack
        self.title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(polkadotButton)
        view.addSubview(polkadotJSLogo)
        view.addSubview(qrcodeButton)
        
        backgroundImageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        polkadotButton.anchor(top: titleLabel.bottomAnchor, paddingTop: 64, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 50)
        
        polkadotJSLogo.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: polkadotButton.leftAnchor, paddingLeft: 115, right: nil, paddingRight: 0, width: 25, height: 25)
        polkadotJSLogo.centerYAnchor.constraint(equalTo: polkadotButton.centerYAnchor).isActive = true

        qrcodeButton.anchor(top: polkadotButton.bottomAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 50)
    }
    
}
