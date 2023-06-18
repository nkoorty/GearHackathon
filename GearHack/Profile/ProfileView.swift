import UIKit

class ProfileView: UIView, UIContextMenuInteractionDelegate {
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ProfilePicture")
        image.layer.cornerRadius = 35
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 20, text: "Artemiy", bold: true)
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 18, text: "nkoorty", bold: false)
        return label
    }()
    
    lazy var statusInfoLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .darkGray, size: 10, text: "Hold to Change", bold: true)
        return label
    }()
    
    lazy var statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "🎯 Focused"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            let menu = UIMenu(title: "", children: [
                UIAction(title: "🎯 Focused", handler: {_ in self.statusLabel.text = "🎯 Focused"}),
                UIAction(title: "⚙️ Gearing Up", handler: {_ in self.statusLabel.text = "⚙️ Gearing Up"}),
                UIAction(title: "🌕 Over the Moon", handler: {_ in self.statusLabel.text = "🌕 Over the Moon"})
            ])
            return menu
        }
    }
    
    func setUpView() {
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(statusInfoLabel)
        addSubview(statusView)
        statusView.addSubview(statusLabel)
        
        profileImageView.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 70, height: 70)
        
        nameLabel.anchor(top: profileImageView.centerYAnchor, paddingTop: -20, bottom: nil, paddingBottom: 0, left: profileImageView.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)

        userNameLabel.anchor(top: profileImageView.centerYAnchor, paddingTop: 2, bottom: nil, paddingBottom: 0, left: profileImageView.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        statusInfoLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        statusView.anchor(top: statusInfoLabel.bottomAnchor, paddingTop: 4, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 40)
        
        statusLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: statusView.leftAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        statusLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor).isActive = true
    
        
        let interaction = UIContextMenuInteraction(delegate: self)
        statusView.addInteraction(interaction)
        
    }
}
