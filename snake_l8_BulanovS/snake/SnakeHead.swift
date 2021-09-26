//
//  SnakeHead.swift
//  snake
//
//  Created by Сергей Буланов on 24.09.2021.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    override init (atPoint point: CGPoint) {
        super.init(atPoint: point)
        self.physicsBody?.categoryBitMask = CollisionCategory.SnakeHead
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Snake | CollisionCategory.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
