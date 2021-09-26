//
//  GameScene.swift
//  snake
//
//  Created by Сергей Буланов on 22.09.2021.
//

import SpriteKit
import GameplayKit

struct CollisionCategory {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
    
}

class GameScene: SKScene {
    
    
    var snake: Snake?
    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .black
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        
        view.showsPhysics = true
        
        //кнопки
        //1
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        
        counterClockwiseButton.fillColor = .magenta
        counterClockwiseButton.strokeColor = .purple
        counterClockwiseButton.lineWidth = 10
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)
        
        //2
        
        let clockWiseButton = SKShapeNode()
        clockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        clockWiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        
        clockWiseButton.fillColor = .magenta
        clockWiseButton.strokeColor = .purple
        clockWiseButton.lineWidth = 10
        clockWiseButton.name = "clockWiseButton"
        self.addChild(clockWiseButton)
        
        
        createApple()
        createSnake()
        
        self.physicsWorld.contactDelegate = self
        
        
        self.physicsBody?.categoryBitMask = CollisionCategory.EdgeBody
        self.physicsBody?.collisionBitMask = CollisionCategory.Snake | CollisionCategory.SnakeHead
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockwiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            
            touchNode.fillColor = .blue
            
            if touchNode.name == "clockWiseButton" {
                snake!.moveClockWise()
                
            } else if touchNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockWise()
                
            }
        }
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockwiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            
            touchNode.fillColor = .magenta
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        snake!.move()
    }
    
    func createApple () {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 5)))
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
    func showAlertQuestion() {
        let alertController = UIAlertController(title: "Вы проиграли", message: "Начать заново?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.createSnake()
        })
        alertController.addAction(okAction)
        
        self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func createSnake() {
        self.snake?.removeFromParent()
        self.snake = Snake(atPoint: CGPoint(x: self.view!.scene!.frame.midX, y: self.view!.scene!.frame.midY))
        self.addChild(self.snake!)
    }
}


extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionObject = bodyes - CollisionCategory.SnakeHead
        
        switch collisionObject {
        case CollisionCategory.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node: contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
        case CollisionCategory.EdgeBody:
            showAlertQuestion()
            //Заставить змейку разбиваться саму об себя у меня не вышло = ( 
            
        default:
            break
        }
        
        
    }
}
