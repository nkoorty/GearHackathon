import UIKit

class GamingViewController: UIViewController {
    
    lazy var petLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 22, text: "Your Pets", bold: true)
        return label
    }()
    
    lazy var playView: PlayView = {
        let playView = PlayView()
        playView.backgroundColor = .gearGray
        playView.layer.cornerRadius = 22
        playView.parentVC = self  // setting parentVC here
        return playView
    }()
    
    lazy var petView: PetView = {
        let petView = PetView()
        petView.backgroundColor = .clear
        petView.layer.borderWidth = 2
        if let gearGreen = UIColor.gearGreen?.withAlphaComponent(0.7).cgColor {
            petView.layer.borderColor = gearGreen
        }
        petView.layer.cornerRadius = 22
        return petView
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
        self.title = "Play"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(playView)
        view.addSubview(petLabel)
        view.addSubview(petView)
        
        playView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 330)
        
        petLabel.anchor(top: playView.bottomAnchor, paddingTop: 24, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        petView.anchor(top: petLabel.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 180)
    }
}
