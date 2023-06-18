import UIKit

protocol PlayViewDelegate: AnyObject {
    func totalPointsDidUpdate(_ totalPoints: Int)
}

class PlayView: UIView {
    
    weak var parentVC: GamingViewController?
    weak var delegate: PlayViewDelegate?
    
    var totalPoints = 0 {
        didSet {
            delegate?.totalPointsDidUpdate(totalPoints)
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 22, text: "Choose your Strategy", bold: true)
        return label
    }()
    
    lazy var attackSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    lazy var defenseSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    lazy var healthSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    lazy var attackLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    lazy var defenseLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    lazy var healthLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    lazy var attackNameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "Attack", bold: false)
        return label
    }()
    
    lazy var defenseNameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "Defense", bold: false)
        return label
    }()
    
    lazy var healthNameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "Health", bold: false)
        return label
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .gearGreen?.withAlphaComponent(0.7)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tappedGame), for: .touchUpInside)
        return button
    }()
    
    @objc func sliderValueChanged() {
        let attack = Int(attackSlider.value)
        attackLabel.text = String(attack)
        
        let defense = Int(defenseSlider.value)
        defenseLabel.text = String(defense)
        
        let health = Int(healthSlider.value)
        healthLabel.text = String(health)
        
        totalPoints = attack + defense + health
    }
    
    @objc func tappedGame() {
        guard let parentVC = parentVC else {
            print("parentVC is nil")
            return
        }
        let vc = GameViewController()
        vc.modalPresentationStyle = .fullScreen

        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        parentVC.view.window!.layer.add(transition, forKey: kCATransition)
        parentVC.present(vc, animated: false)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(playButton)
        addSubview(titleLabel)
        addSubview(attackSlider)
        addSubview(defenseSlider)
        addSubview(healthSlider)
        addSubview(attackLabel)
        addSubview(defenseLabel)
        addSubview(healthLabel)
        addSubview(attackNameLabel)
        addSubview(defenseNameLabel)
        addSubview(healthNameLabel)
        
        
        titleLabel.anchor(top: topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        attackNameLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 46, right: nil, paddingRight: 0, width: 0, height: 0)
        
        attackLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: attackSlider.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        attackLabel.centerYAnchor.constraint(equalTo: attackSlider.centerYAnchor).isActive = true
        
        attackSlider.anchor(top: attackNameLabel.bottomAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 260, height: 20)
        attackSlider.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        defenseNameLabel.anchor(top: attackSlider.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 46, right: nil, paddingRight: 0, width: 0, height: 0)
        
        defenseLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: defenseSlider.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        defenseLabel.centerYAnchor.constraint(equalTo: defenseSlider.centerYAnchor).isActive = true

        defenseSlider.anchor(top: defenseNameLabel.bottomAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 260, height: 20)
        defenseSlider.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        healthNameLabel.anchor(top: defenseSlider.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 46, right: nil, paddingRight: 0, width: 0, height: 0)
        
        healthLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: healthSlider.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        healthLabel.centerYAnchor.constraint(equalTo: healthSlider.centerYAnchor).isActive = true
        
        healthSlider.anchor(top: healthNameLabel.bottomAnchor, paddingTop: 8, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 260, height: 20)
        healthSlider.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        playButton.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 24, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 130, height: 40)
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true



    }
}
