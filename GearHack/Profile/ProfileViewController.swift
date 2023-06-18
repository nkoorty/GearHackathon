import UIKit

class ProfileViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var profileView: ProfileView = {
        let profileView = ProfileView()
        profileView.backgroundColor = .clear
        return profileView
    }()
    
    lazy var connectedLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 22, text: "Wallet Connection", bold: true)
        return label
    }()
    
    lazy var walletChevron: UIButton = {
        let upComingChevron = UIButton()
        upComingChevron.setsizedImage(symbol: "chevron.right", size: 12, colour: .gearGray!)
        upComingChevron.translatesAutoresizingMaskIntoConstraints = false
        return upComingChevron
    }()
    
    lazy var walletView: WalletView = {
        let profileView = WalletView()
        profileView.backgroundColor = .clear
        profileView.layer.borderWidth = 2
        if let gearGreen = UIColor.gearGreen?.withAlphaComponent(0.7).cgColor {
            profileView.layer.borderColor = gearGreen
        }
        profileView.layer.cornerRadius = 22
        return profileView
    }()
    
    lazy var statsLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 22, text: "Statistics", bold: true)
        return label
    }()
    
    lazy var statsView: StatsView = {
        let profileView = StatsView()
        profileView.backgroundColor = .clear
        profileView.layer.borderWidth = 2
        if let gearGreen = UIColor.gearGreen?.withAlphaComponent(0.7).cgColor {
            profileView.layer.borderColor = gearGreen
        }
        profileView.layer.cornerRadius = 22
        return profileView
    }()
    
    lazy var spacerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(profileView)
        stackView.addArrangedSubview(connectedLabel)
        stackView.setCustomSpacing(16, after: connectedLabel)
        stackView.addArrangedSubview(walletView)
        stackView.setCustomSpacing(24, after: walletView)
        stackView.addArrangedSubview(statsLabel)
        stackView.setCustomSpacing(16, after: statsLabel)
        stackView.addArrangedSubview(statsView)
        stackView.addArrangedSubview(spacerView)
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()

        NetworkManager.shared.getAddress() { (result) in
            switch result {
            case .success(let address):
                DispatchQueue.main.async {
                    self.walletView.addressAddressLabel.text = address
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        setUpView()
    }
    
    private func configureItems() {
        navigationController?.navigationBar.tintColor = .gearGreen
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "gearshape"),
                    style: .done,
                    target: self,
                    action: #selector(didTapSettingsButton)
                )
    }
    
    @objc private func didTapSettingsButton() {
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    func setUpView() {

        view.backgroundColor = .gearBlack
        self.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)

        stackView.anchor(top: scrollView.topAnchor, paddingTop: 16, bottom: scrollView.bottomAnchor, paddingBottom: 0, left: scrollView.leftAnchor, paddingLeft: 16, right: scrollView.rightAnchor, paddingRight: 16, width: 0, height: 0)
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true

        profileView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        walletView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        statsView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        spacerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
