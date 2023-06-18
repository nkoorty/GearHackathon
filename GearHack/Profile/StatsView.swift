import UIKit

class StatsView: UIView {
    
    lazy var balanceView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 20, text: "Balance", bold: true)
        return label
    }()
    
    lazy var balanceAmountLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .gearGreen!, size: 42, text: "994.1", bold: false)
        return label
    }()
    
    lazy var balanceUnitLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 20, text: "Units", bold: true)
        return label
    }()

    lazy var statView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var statLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 20, text: "Char Count", bold: true)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var statCountLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .gearGreen!, size: 38, text: "3", bold: false)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lowerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var lowerLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 20, text: "Experience", bold: true)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lowerLevelLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 18, text: "Level", bold: true)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lowerLevelCountLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .gearGreen!, size: 32, text: "1", bold: false)
        return label
    }()
    
    lazy var lowerXPLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 18, text: "0/100 XP", bold: false)
        return label
    }()
    
    lazy var lowerProgressView: ProgressView = {
        let progressView = ProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor = .clear
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        addSubview(balanceView)
        balanceView.addSubview(balanceLabel)
        balanceView.addSubview(balanceAmountLabel)
        balanceView.addSubview(balanceUnitLabel)
        addSubview(statView)
        statView.addSubview(statLabel)
        statView.addSubview(statCountLabel)
        addSubview(lowerView)
        lowerView.addSubview(lowerLabel)
        lowerView.addSubview(lowerLevelLabel)
        lowerView.addSubview(lowerLevelCountLabel)
        lowerView.addSubview(lowerProgressView)
        lowerView.addSubview(lowerXPLabel)
        
        balanceView.anchor(top: topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 16, right: statView.leftAnchor, paddingRight: 12, width: 0, height: 130)
        
        balanceLabel.anchor(top: balanceView.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: balanceView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        balanceAmountLabel.anchor(top: nil, paddingTop: 0, bottom: balanceView.bottomAnchor, paddingBottom: 12, left: balanceView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        balanceUnitLabel.anchor(top: nil, paddingTop: 0, bottom: balanceView.bottomAnchor, paddingBottom: 17, left: balanceAmountLabel.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)

        statView.anchor(top: topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 16, width: 100, height: 130)
        
        statLabel.anchor(top: statView.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: statView.leftAnchor, paddingLeft: 12, right: statView.rightAnchor, paddingRight: 12, width: 0, height: 0)
        
        statCountLabel.anchor(top: nil, paddingTop: 0, bottom: statView.bottomAnchor, paddingBottom: 12, left: statView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        lowerView.anchor(top: balanceView.bottomAnchor, paddingTop: 12, bottom: bottomAnchor, paddingBottom: 16, left: leftAnchor, paddingLeft: 16, right: rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        lowerLabel.anchor(top: lowerView.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: lowerView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        lowerProgressView.anchor(top: nil, paddingTop: 0, bottom: lowerView.bottomAnchor, paddingBottom: 12, left: lowerView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        lowerLevelCountLabel.anchor(top: nil, paddingTop: 0, bottom: lowerProgressView.bottomAnchor, paddingBottom: 16, left: nil, paddingLeft: 0, right: lowerProgressView.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        lowerLevelLabel.anchor(top: nil, paddingTop: 0, bottom: lowerProgressView.bottomAnchor, paddingBottom: 20, left: nil, paddingLeft: 0, right: lowerLevelCountLabel.leftAnchor, paddingRight: 6, width: 0, height: 0)
        
        lowerXPLabel.anchor(top: nil, paddingTop: 0, bottom: lowerProgressView.bottomAnchor, paddingBottom: 20, left: lowerView.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        

    }
}
