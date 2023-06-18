import Foundation
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var cat: SKSpriteNode!
    var monkey: SKSpriteNode!
    var explosion: SKSpriteNode!
    var catHealthBar: SKShapeNode!
    var monkeyHealthBar: SKShapeNode!
    var roundIndicators: [SKSpriteNode] = []
    var currentRound = 0
    let healthDecrease: [CGFloat] = [0.1, 0.2, 0.05, 0.1, 0.15]

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        self.physicsWorld.contactDelegate = self

        let padding: CGFloat = 16 // left and right padding
        let availableWidth = self.frame.width - 2 * padding // total space available for round indicators
        let indicatorWidth = availableWidth / 5 // width for each indicator
        let spaceBetweenIndicators = indicatorWidth * 0.05 // spacing between each indicator (5% of each indicator's width)

        for i in 0..<5 {
            let roundIndicator = SKSpriteNode(color: .gray, size: CGSize(width: indicatorWidth - spaceBetweenIndicators, height: 4))
            let indicatorPositionX = self.frame.minX + padding + (indicatorWidth * CGFloat(i))
            roundIndicator.position = CGPoint(x: indicatorPositionX + roundIndicator.frame.width / 2, y: self.frame.maxY - roundIndicator.frame.height * 20)
            roundIndicators.append(roundIndicator)
            addChild(roundIndicator)
        }


        cat = SKSpriteNode(imageNamed: "Cat1")
        cat.position = CGPoint(x: frame.midX - 100, y: frame.midY - 100)
        cat.setScale(0.3)
        addChild(cat)

        monkey = SKSpriteNode(imageNamed: "Monkey2")
        monkey.position = CGPoint(x: frame.midX + 100, y: frame.midY)
        monkey.setScale(0.3)
        addChild(monkey)
        
        catHealthBar = createHealthBar(size: CGSize(width: 100, height: 10), color: .green)
        catHealthBar.position = CGPoint(x: frame.minX + 100, y: frame.minY + 50)
        addChild(catHealthBar)

        monkeyHealthBar = createHealthBar(size: CGSize(width: 100, height: 10), color: .green)
        monkeyHealthBar.position = CGPoint(x: frame.maxX - 100, y: frame.minY + 50)
        addChild(monkeyHealthBar)
        
        let yourHealth = SKLabelNode(text: "You")
        yourHealth.position = CGPoint(x: frame.minX + 100, y: frame.minY + 70)
        yourHealth.fontColor = .white
        yourHealth.fontSize = 16
        yourHealth.fontName = "Helvetica-Bold"
        addChild(yourHealth)

        let opponentHealth = SKLabelNode(text: "Evil Gear Monkey")
        opponentHealth.position = CGPoint(x: frame.maxX - 100, y: frame.minY + 70)
        opponentHealth.fontColor = .white
        opponentHealth.fontSize = 16
        opponentHealth.fontName = "Helvetica-Bold"
        addChild(opponentHealth)
        
        let label = SKLabelNode(fontNamed: "Helvetica-Bold")
        label.text = "Battle Time!"
        label.fontSize = 32
        label.fontColor = SKColor.white
        label.position = CGPoint(x: frame.midX, y: frame.midY + 260)
        self.addChild(label)
    }

    private func createHealthBar(size: CGSize, color: UIColor) -> SKShapeNode {
        let bar = SKShapeNode(rectOf: size, cornerRadius: size.height / 2)
        bar.fillColor = color
        bar.strokeColor = .clear
        return bar
    }

    func startRound() {
        if currentRound < 5 {
            let catMoveTowardsAction = SKAction.move(to: CGPoint(x: frame.midX - 50, y: frame.midY - 50), duration: 1.0)
            let monkeyMoveTowardsAction = SKAction.move(to: CGPoint(x: frame.midX + 50, y: frame.midY + 50), duration: 1.0)
            
            let catMoveApartAction = SKAction.move(to: CGPoint(x: frame.midX - 100, y: frame.midY - 100), duration: 1.0)
            let monkeyMoveApartAction = SKAction.move(to: CGPoint(x: frame.midX + 100, y: frame.midY), duration: 1.0)
            
            let catSequence = SKAction.sequence([catMoveTowardsAction, catMoveApartAction])
            let monkeySequence = SKAction.sequence([monkeyMoveTowardsAction, monkeyMoveApartAction])
            
            cat.run(catSequence)
            monkey.run(monkeySequence)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                self?.addExplosion()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                guard let strongSelf = self else { return }
                
                if strongSelf.currentRound < strongSelf.healthDecrease.count {
                    let healthDecrease = strongSelf.healthDecrease[strongSelf.currentRound]
                    strongSelf.catHealthBar.xScale *= (1 - healthDecrease)
                } else {
                    print("Invalid round index")
                }

                if strongSelf.monkeyHealthBar.xScale >= 0 {
                    strongSelf.monkeyHealthBar.xScale -= 0.2
                }
                
                if strongSelf.currentRound < strongSelf.roundIndicators.count {
                    strongSelf.roundIndicators[strongSelf.currentRound].color = .white
                }
                
                strongSelf.currentRound += 1
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.endGame()
            }
        }
    }

    func addExplosion() {
        explosion = SKSpriteNode(imageNamed: "Explosion")
        explosion.position = CGPoint(x: frame.midX, y: frame.midY)
        explosion.setScale(0.3)
        addChild(explosion)
        
        // Remove explosion after some time
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.explosion.removeFromParent()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startRound()
    }

    func didBegin(_ contact: SKPhysicsContact) {
        explosion = SKSpriteNode(imageNamed: "Explosion")
        explosion.position = CGPoint(x: frame.midX, y: frame.midY)
        explosion.setScale(0.5)
        addChild(explosion)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.explosion.removeFromParent()
        }
    }

    func endGame() {
        if let view = self.view {
            let gameOverScene = EndGameScene(size: view.bounds.size)
            let transition = SKTransition.fade(withDuration: 0.5)
            view.presentScene(gameOverScene, transition: transition)
        }
    }
}
