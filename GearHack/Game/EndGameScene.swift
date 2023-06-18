import Foundation
import SpriteKit

class EndGameScene: SKScene {
    
    weak var sceneDelegate: EndGameSceneDelegate?

    var winnerAnimal: String = "Cat1"
    var statValues: [CGFloat] = [0.5, 0.7, 0.6]

    var attackBar: SKShapeNode!
    var defenseBar: SKShapeNode!
    var healthBar: SKShapeNode!

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        evolve(winnerAnimal)
    }
    
    func evolve(_ animal: String) {
        let animalSprite = SKSpriteNode(imageNamed: animal)
        animalSprite.position = CGPoint(x: frame.midX, y: frame.midY)
        animalSprite.setScale(0.3)
        addChild(animalSprite)
        
        let lightEffect = SKSpriteNode(color: .white, size: self.size)
        lightEffect.position = CGPoint(x: frame.midX, y: frame.midY)
        lightEffect.alpha = 0
        addChild(lightEffect)
        
        let lightAction = SKAction.sequence([
            SKAction.fadeAlpha(to: 1, duration: 1),
            SKAction.run { [weak self] in
                animalSprite.texture = SKTexture(imageNamed: "Cat2")
            },
            SKAction.fadeAlpha(to: 0, duration: 1)
        ])
        
        lightEffect.run(lightAction) {
            // After evolution, display stats
            self.displayStats()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sceneDelegate?.endGameSceneDidTapScreen(self)
    }
    
    func displayStats() {
        let statNames = ["Attack", "Defense", "Health"]
        let statIncrease = [0.2, 0.1, 0.15]
        let statBarHeight: CGFloat = 20
        let statBarWidth: CGFloat = 200
        let spacing: CGFloat = 40

        for i in 0..<3 {
            let statBar = SKShapeNode(rectOf: CGSize(width: statBarWidth, height: statBarHeight), cornerRadius: 5)
            statBar.position = CGPoint(x: frame.midX - statBarWidth / 2 + 30, y: frame.minY + 100 + CGFloat(i) * spacing)
            statBar.strokeColor = .darkGray
            statBar.fillColor = .clear
            addChild(statBar)
            
            let filledStatBar = SKSpriteNode(color: .green, size: CGSize(width: 0, height: statBarHeight))
            filledStatBar.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            filledStatBar.position = CGPoint(x: statBar.frame.minX, y: statBar.position.y)
            addChild(filledStatBar)
            
            let statText = SKLabelNode(fontNamed: "Helvetica-Bold")
            statText.text = statNames[i]
            statText.fontSize = 16
            statText.fontColor = .white
            statText.position = CGPoint(x: statBar.position.x + 190, y: statBar.position.y - statText.frame.height/2)
            addChild(statText)
            
            filledStatBar.run(SKAction.resize(toWidth: statBarWidth * (statValues[i] + statIncrease[i]), duration: 1))
            
            let label = SKLabelNode(fontNamed: "Helvetica-Bold")
            label.text = "Oh? Is your Cat evolving?"
            label.numberOfLines = 2
            label.fontSize = 26
            label.horizontalAlignmentMode = .center
            label.fontColor = SKColor.white
            label.position = CGPoint(x: frame.midX, y: frame.midY + 230)
            label.alpha = 0.0
            self.addChild(label)

            let entryPoint = CGPoint(x: frame.midX, y: frame.size.height)
            let moveAction = SKAction.move(to: label.position, duration: 2.0)

            let fadeInAction = SKAction.fadeIn(withDuration: 2.0)

            let groupAction = SKAction.group([moveAction, fadeInAction])
            label.run(groupAction)
        }
    }
}
