import UIKit

class PetView: UIView {
    
    lazy var pet1View: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var pet1Photo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Cat1Real")
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var pet1Label: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 16, text: "Cat", bold: true)
        return label
    }()
    
    lazy var pet1DescriptionLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 16, text: "Level 1", bold: false)
        return label
    }()
    
    lazy var pet2View: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var pet2Photo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Dog1Real")
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var pet2Label: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 16, text: "Dog", bold: true)
        return label
    }()
    
    lazy var pet2DescriptionLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 16, text: "Level 1", bold: false)
        return label
    }()
    
    lazy var pet3View: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var pet3Photo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Monkey1Real")
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var pet3Label: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 16, text: "Monkey", bold: true)
        return label
    }()
    
    lazy var pet3DescriptionLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .lightGray, size: 16, text: "Level 1", bold: false)
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
        
        addSubview(pet1View)
        addSubview(pet1Photo)
        addSubview(pet1Label)
        addSubview(pet1DescriptionLabel)
        addSubview(pet2View)
        addSubview(pet2Photo)
        addSubview(pet2Label)
        addSubview(pet2DescriptionLabel)
        addSubview(pet3View)
        addSubview(pet3Photo)
        addSubview(pet3Label)
        addSubview(pet3DescriptionLabel)
        
        pet1View.anchor(top: topAnchor, paddingTop: 12, bottom: bottomAnchor, paddingBottom: 12, left: leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 103, height: 0)
        
        pet1Photo.anchor(top: pet1View.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: pet1View.leftAnchor, paddingLeft: 12, right: pet1View.rightAnchor, paddingRight: 12, width: 0, height: 80)
        
        pet1Label.anchor(top: pet1Photo.bottomAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: pet1View.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        pet1DescriptionLabel.anchor(top: pet1Label.bottomAnchor, paddingTop: 2, bottom: nil, paddingBottom: 0, left: pet1View.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        pet2View.anchor(top: topAnchor, paddingTop: 12, bottom: bottomAnchor, paddingBottom: 12, left: pet1View.rightAnchor, paddingLeft: 12, right: pet3View.leftAnchor, paddingRight: 12, width: 103, height: 0)
        
        pet2Photo.anchor(top: pet2View.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: pet2View.leftAnchor, paddingLeft: 12, right: pet2View.rightAnchor, paddingRight: 12, width: 0, height: 80)
        
        pet2Label.anchor(top: pet2Photo.bottomAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: pet2View.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        pet2DescriptionLabel.anchor(top: pet2Label.bottomAnchor, paddingTop: 2, bottom: nil, paddingBottom: 0, left: pet2View.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        pet3View.anchor(top: topAnchor, paddingTop: 12, bottom: bottomAnchor, paddingBottom: 12, left: pet2View.rightAnchor, paddingLeft: 12, right: rightAnchor, paddingRight: 12, width: 102, height: 0)
        
        pet3Photo.anchor(top: pet3View.topAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: pet3View.leftAnchor, paddingLeft: 12, right: pet3View.rightAnchor, paddingRight: 12, width: 0, height: 80)
        
        pet3Label.anchor(top: pet3Photo.bottomAnchor, paddingTop: 12, bottom: nil, paddingBottom: 0, left: pet3View.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
        
        pet3DescriptionLabel.anchor(top: pet3Label.bottomAnchor, paddingTop: 2, bottom: nil, paddingBottom: 0, left: pet3View.leftAnchor, paddingLeft: 12, right: nil, paddingRight: 0, width: 0, height: 0)
    }
}
