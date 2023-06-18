import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let middleButton = MiddleButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = tabBar.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        blurEffectView.alpha = 0.95
        tabBar.insertSubview(blurEffectView, at: 0)

        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()

        tabBar.tintColor = .gearGreen
        tabBar.barTintColor = UIColor.gearBlack?.withAlphaComponent(0.5)
        tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.5)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let home = HomeViewController()
        let homeimage = UIImage(systemName: "house")
        let homeselected = UIImage(systemName: "house.fill")
        home.tabBarItem =  UITabBarItem(title: "Home", image: homeimage, selectedImage: homeselected)
        
        let discover = GamingViewController()
        let discoverimage = UIImage(systemName: "teddybear")
        let discoverselected = UIImage(systemName: "teddybear.fill")
        discover.tabBarItem =  UITabBarItem(title: "Play", image: discoverimage, selectedImage: discoverselected)
        
        let wallet = ProfileViewController()
        let walletImage = UIImage(systemName: "person")
        let walletselected = UIImage(systemName: "person.fill")
        wallet.tabBarItem = UITabBarItem(title: "Profile", image: walletImage, selectedImage: walletselected)
        
        let tabbarList = [home, discover, wallet]
        
        viewControllers = tabbarList.map {
            UINavigationController(rootViewController: $0)
        }
        self.setupMiddleButton()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    func hideMiddleButton() {
        self.middleButton.isHidden = true
    }
    
    func showMiddleButton() {
        self.middleButton.isHidden = false
    }

    func setupMiddleButton() {
        
        middleButton.setImage(UIImage(systemName: "gamecontroller.fill")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
        middleButton.layer.cornerRadius = 25
        middleButton.layer.masksToBounds = true
        
        self.view.addSubview(middleButton)
        
        middleButton.anchor(top: tabBar.topAnchor, paddingTop: -16, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 50, height: 50)
        middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true

        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)

        self.view.layoutIfNeeded()
    }

    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 1
 
        sender.setImage(UIImage(systemName: "gamecontroller.fill")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .selected)
        sender.isSelected = true
        
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        }) { (completed) in
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
    }
}
