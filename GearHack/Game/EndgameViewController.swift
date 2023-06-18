import UIKit
import SpriteKit

protocol EndGameSceneDelegate: class {
    func endGameSceneDidTapScreen(_ scene: EndGameScene)
}

class EndGameViewController: UIViewController {
    
    var winnerAnimal: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let skView = SKView(frame: self.view.frame)
        let scene = EndGameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        scene.winnerAnimal = winnerAnimal
        scene.sceneDelegate = self
        
        skView.presentScene(scene)
        self.view.addSubview(skView)
    }
}

extension EndGameViewController: EndGameSceneDelegate {
    func endGameSceneDidTapScreen(_ scene: EndGameScene) {
        // Transition to GamingViewController
        guard let tabBarController = self.tabBarController,
              let viewControllers = tabBarController.viewControllers,
              let gamingViewController = viewControllers.first as? GamingViewController else {
            return
        }
        
        tabBarController.selectedIndex = 0 // Select the GamingViewController tab
        navigationController?.popToRootViewController(animated: true) // Pop to the root view controller (GamingViewController)// Restart the game in GamingViewController
    }
}
