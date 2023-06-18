import UIKit

class SettingsViewController: UIViewController {
    
    lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "Nothing to see here, Gear is awesome :)", bold: false)
        label.numberOfLines = 0
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .gearBlack
        self.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(settingsLabel)
        
        settingsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
    }
    
}
