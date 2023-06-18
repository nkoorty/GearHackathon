import UIKit

protocol ParachainSelectionDelegate {
    func didSelectParachain(name: String, imageName: String)
}

class ParachainSelectionViewController: UIViewController {
    
    lazy var gearButton: UIButton = {
        let button = UIButton(type: .system)
        button.layout(textcolour: .white, backgroundColour: .white.withAlphaComponent(0.1), size: 20, text: "Gear", image: nil, cornerRadius: 8)
        button.addTarget(self, action: #selector(gearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var moonBeamButton: UIButton = {
        let button = UIButton(type: .system)
        button.layout(textcolour: .white, backgroundColour: .white.withAlphaComponent(0.1), size: 20, text: "Moonbeam", image: nil, cornerRadius: 8)
        button.addTarget(self, action: #selector(moonBeamButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var astarButton: UIButton = {
        let button = UIButton(type: .system)
        button.layout(textcolour: .white, backgroundColour: .white.withAlphaComponent(0.1), size: 20, text: "Astar", image: nil, cornerRadius: 8)
        button.addTarget(self, action: #selector(astarButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var delegate: ParachainSelectionDelegate?
    
    @objc func gearButtonTapped() {
        delegate?.didSelectParachain(name: "Gear", imageName: "GearPNG")
        dismiss(animated: true)
    }
    
    @objc func moonBeamButtonTapped() {
        delegate?.didSelectParachain(name: "Moonbeam", imageName: "MoonbeamPNG")
        dismiss(animated: true)
    }
    
    @objc func astarButtonTapped() {
        delegate?.didSelectParachain(name: "Astar", imageName: "AstarPNG")
        dismiss(animated: true)
    }
    
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
        view.backgroundColor = .gearGray
        view.addSubview(gearButton)
        view.addSubview(moonBeamButton)
        view.addSubview(astarButton)
        
        gearButton.anchor(top: view.topAnchor, paddingTop: 60, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 54)
        gearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        moonBeamButton.anchor(top: gearButton.topAnchor, paddingTop: 60, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 54)
        moonBeamButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        astarButton.anchor(top: moonBeamButton.topAnchor, paddingTop: 60, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 54)
        astarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
