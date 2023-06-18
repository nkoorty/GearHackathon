import UIKit
import SpriteKit

class GameViewController: UIViewController, EndGameSceneDelegate {
    
    var gameScene: GameScene!
    var endGameScene: EndGameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameScene = GameScene(size: view.bounds.size)
        
        let skView = SKView(frame: self.view.frame)
        view.addSubview(skView)
        skView.presentScene(gameScene)
    }
    
    
    func endGameSceneDidTapScreen(_ scene: EndGameScene) {
        dismiss(animated: true, completion: nil)
        // or
        // navigationController?.popViewController(animated: true)
    }
}
