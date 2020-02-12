//
//  Apple.swift
//  HW_8_Emil_Mescheryakov
//
//  Created by Евгений Елчев on 30.07.17.
//  Copyright © 2017 Pinspb. All rights reserved.
//

import UIKit
import SpriteKit

//Яблоко
class Apple: SKShapeNode {
    
    //определяем как оно будет рисоваться
    convenience init(position: CGPoint) {
        self.init()
        //рисуем круг
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        //заливаем красным
        fillColor = UIColor.red
        //рамка тоже красная
        strokeColor = UIColor.red
        //ширина рамки 5 поинтов
        lineWidth = 5
        
        self.position = position
        
        //Добавялем физическое тело совпадающее с изображением яблока
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center:CGPoint(x:5, y:5))
        //категория - яблоко
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}

