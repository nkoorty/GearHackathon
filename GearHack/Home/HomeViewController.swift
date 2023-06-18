import UIKit

class HomeViewController: UIViewController, UIContextMenuInteractionDelegate {
    
    var tabBar: TabBarController?
    
    enum Network {
        case gear
        case vara
    }

    var currentNetwork: Network = .gear
    
    var characterForGear: [Character] = [
        Character(image: "Character1", title: "Goliath", description: "", date: "100 Units"),
        Character(image: "Character2", title: "Teddy", description: "", date: "110 Units"),
        Character(image: "Character3", title: "John", description: "", date: "85 Units"),
    ]

    var characterForVara: [Character] = [
        Character(image: "Character3", title: "John", description: "Technology, Hackathon", date: "85 Units"),
        Character(image: "Character1", title: "Goliath", description: "Music, Pop, Female", date: "100 Units"),
        Character(image: "Character2", title: "Teddy", description: "Music, Indie", date: "110 Units"),
    ]

    var collectionForGear: [Collections] = [
        Collections(image: "Collection1", title: "Fire Force", description: "High Attack, Slow XP", date: "Release: 20 Jun", price: "No Level Restriction"),
        Collections(image: "Collection2", title: "Gear Gorillas", description: "High HP, Fast XP", date: "Release: 27 Jun", price: "Level 8 Required"),
        Collections(image: "Collection3", title: "Affable Antelopes", description: "High Defense, Fast XP", date: "Release: 6 Jul", price: "Level 10 Required"),
    ]

    var collectionForVara: [Collections] = [
        Collections(image: "Collection1", title: "Fire Force", description: "High Attack, Slow XP", date: "Release: 20 Jun", price: "No Level Restriction"),
        Collections(image: "Collection3", title: "Affable Antelopes", description: "High HP, Fast XP", date: "Release: 27 Jun", price: "Level 8 Required"),
        Collections(image: "Collection2", title: "Gear Gorillas", description: "High Defense, Fast XP", date: "Release: 6 Jul", price: "Level 10 Required"),
    ]
        
    lazy var networkInfoLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .darkGray, size: 10, text: "Hold to Change Networks", bold: true)
        return label
    }()
    
    lazy var networkView: UIView = {
        let view = UIView()
        view.backgroundColor = .gearGray
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var networkLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Network"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var networkImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "PolkadotPLogo")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var slider: ForYouMarketPlaceSlider = {
        let slider = ForYouMarketPlaceSlider()
        return slider
    }()
    
    lazy var trendingNowTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 18, text: "Trending NFTs", bold: true)
        return text
    }()
    
    lazy var trendingNowChevron: UIButton = {
        let trendingNowChevron = UIButton()
        trendingNowChevron.setsizedImage(symbol: "chevron.right", size: 12, colour: .lightGray)
        trendingNowChevron.translatesAutoresizingMaskIntoConstraints = false
        return trendingNowChevron
    }()
    
    lazy var upComingTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 18, text: "Upcoming Collections", bold: true)
        return text
    }()
    
    lazy var upComingChevron: UIButton = {
        let upComingChevron = UIButton()
        upComingChevron.setsizedImage(symbol: "chevron.right", size: 12, colour: .lightGray)
        upComingChevron.translatesAutoresizingMaskIntoConstraints = false
        return upComingChevron
    }()
    
    lazy var collectionsCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(CollectionCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    lazy var characterCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(CharacterCell.self, forCellWithReuseIdentifier: "characterCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.showsHorizontalScrollIndicator = false
        return collectionview
    }()
    
//    lazy var walletChevron: UIButton = {
//        let upComingChevron = UIButton()
//        upComingChevron.setsizedImage(symbol: "chevron.right", size: 12, colour: .gearGray!)
//        upComingChevron.translatesAutoresizingMaskIntoConstraints = false
//        return upComingChevron
//    }()
    

    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            let menu = UIMenu(title: "", children: [
                UIAction(title: "Gear Staging Testnet V7", image: UIImage(named: "GearLogo"), handler: {_ in
                    self.networkLabel.text = "Gear Staging Testnet V7"
                    self.networkImageView.image = UIImage(named: "GearLogo")
                    self.currentNetwork = .gear
                    self.characterCollectionView.reloadData()
                    self.collectionsCollectionView.reloadData()
                }),
                                
                UIAction(title: "Vara Stable Testnet", image: UIImage(named: "VaraLogo"), handler: {_ in
                    self.networkLabel.text = "Vara Stable Testnet"
                    self.networkImageView.image = UIImage(named: "VaraLogo")
                    self.currentNetwork = .vara
                    self.characterCollectionView.reloadData()
                    self.collectionsCollectionView.reloadData()
                })
            ])
            return menu
        }
    }
    
    init(tabBar: TabBarController) {
        self.tabBar = tabBar
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NetworkManager.shared.sendRequest() { result in
//            switch result {
//            case .success(let data):
//                print(String(data: data, encoding: .utf8))
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
            
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .gearBlack
        self.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(networkInfoLabel)
        view.addSubview(networkView)
        networkView.addSubview(networkLabel)
        networkView.addSubview(networkImageView)
        view.addSubview(slider)
        view.addSubview(trendingNowTitle)
        view.addSubview(trendingNowChevron)
        view.addSubview(collectionsCollectionView)
        view.addSubview(upComingTitle)
        view.addSubview(upComingChevron)
        view.addSubview(characterCollectionView)
        
        
        networkInfoLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        networkView.anchor(top: networkInfoLabel.bottomAnchor, paddingTop: 4, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 40)
        
        networkImageView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: networkView.leftAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 20, height: 20)
        networkImageView.centerYAnchor.constraint(equalTo: networkView.centerYAnchor).isActive = true
        
        networkLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: networkImageView.rightAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 0, height: 0)
        networkLabel.centerYAnchor.constraint(equalTo: networkView.centerYAnchor).isActive = true
        
        slider.anchor(top: networkLabel.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        trendingNowTitle.anchor(top: slider.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        trendingNowChevron.centerYAnchor.constraint(equalTo: trendingNowTitle.centerYAnchor).isActive = true
        trendingNowChevron.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        characterCollectionView.anchor(top: trendingNowTitle.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 175)

        upComingTitle.anchor(top: characterCollectionView.bottomAnchor, paddingTop: 26, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 16, width: 0, height: 0)
        
        upComingChevron.centerYAnchor.constraint(equalTo: upComingTitle.centerYAnchor).isActive = true
        upComingChevron.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        collectionsCollectionView.anchor(top: upComingTitle.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 200)
        
        let interaction = UIContextMenuInteraction(delegate: self)
        networkView.addInteraction(interaction)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionsCollectionView {
            return currentNetwork == .gear ? collectionForGear.count : collectionForVara.count
        } else {
            return currentNetwork == .gear ? characterForGear.count : characterForVara.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "collectionCell",
                for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
            let data = (currentNetwork == .gear ? collectionForGear : collectionForVara)[indexPath.item]
            cell.configure(data: data)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "characterCell",
                for: indexPath) as? CharacterCell else { return UICollectionViewCell() }
            let data = (currentNetwork == .gear ? characterForGear : characterForVara)[indexPath.item]
            cell.configure(data: data)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionsCollectionView {
            let itemWidth = collectionView.bounds.width
            let itemHeight = CGFloat(44)//view.bounds.height / 15
            let itemSize = CGSize(width: itemWidth, height: itemHeight)
            return itemSize
        }
        else {
            let itemSize = CGSize(width: 130, height: 150)
            return itemSize
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionsCollectionView {
            return 30
        }
        else {
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionsCollectionView {
            return 20
        }
        else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let tabBar = self.tabBar else {return}
//        let eventVC = EventViewController(tabBar: tabBar)
//        self.navigationController?.pushViewController(eventVC, animated: true)
    }
}


struct Collections {
    var image: String
    var title: String
    var description: String
    var date: String
    var price: String
}

struct Character {
    var image: String
    var title: String
    var description: String
    var date: String
}
