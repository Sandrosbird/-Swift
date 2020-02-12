//
//  GameScene.swift
//  HW_8_Emil_Mescheryakov
//
//  Created by Евгений Елчев on 30.07.17.
//  Copyright © 2017 Pinspb. All rights reserved.
//

import SpriteKit
import GameplayKit

//категория пересчения объектов
struct CollisionCategories{
    //Тело змеи
    static let Snake :     UInt32 = 0x1 << 0
    //Голова змеи
    static let SnakeHead : UInt32 = 0x1 << 1
    //Яблоко
    static let Apple:       UInt32 = 0x1 << 2
    //Край сцены (экрана)
    static let EdgeBody:   UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    //наша змея
    var snake: Snake?
    
    //вызывается при первом запуске сцены
    override func didMove(to view: SKView) {
        
        //цвет фона сцены
        backgroundColor = SKColor.black
        
        //вектор и сила гравитации
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)

        //добавляем поддержку физики
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        //выключаем внешние воздействия на нашу игру
        self.physicsBody?.allowsRotation = false
        
        //включаем оторажение отладочной информации
        view.showsPhysics = true

        //делаем нашу сцену делегатом соприкосновений
        self.physicsWorld.contactDelegate = self
        
        //Устанавливаем категорию взаимодействия с другими объектами
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        //устанавливаем категории с которыми будут пересекаться края сцены
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        
        
        // Поворот против часовой стрелки
        //создаем ноду (объект)
        let counterClockwiseButton = SKShapeNode()
        //задаем форму круга
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        //указываем координаты размещения
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)
        //цвет заливки
        counterClockwiseButton.fillColor = UIColor.gray
        //цвет рамки
        counterClockwiseButton.strokeColor = UIColor.gray
        //толщина рамки
        counterClockwiseButton.lineWidth = 10
        //имя объекта для взаимодействия
        counterClockwiseButton.name = "counterClockwiseButton"
        
        //Добавляем на сцену
        self.addChild(counterClockwiseButton)
        
        
        // Поворот по часовой стрелке
        
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX-80, y: view.scene!.frame.minY+30)
        clockwiseButton.fillColor = UIColor.gray
        clockwiseButton.strokeColor = UIColor.gray
        clockwiseButton.lineWidth = 10
        clockwiseButton.name = "clockwiseButton"
        
        self.addChild(clockwiseButton)
        
        createApple()
        
        //создаем змею по центру экрана и добавляем ее на сцену
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            touchedNode.fillColor = .green
            
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            touchedNode.fillColor = UIColor.gray
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    func createApple(){
        let randX  = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX-5)) + 1)
        let randY  = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY-5)) + 1)
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collisionObject = bodyes ^ CollisionCategories.SnakeHead
        
        switch collisionObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
        case CollisionCategories.EdgeBody: //ДЗ кажется каким-то плюшевым, просто перепечатать немного метод взаимодействия яблока с объектом, надеюсь, все правильно выполнил
            let _ = contact.bodyA.node is Snake ? contact.bodyA.node : contact.bodyB.node
            snake?.removeFromParent()
            snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
            self.addChild(snake!)
        case CollisionCategories.Snake:
            snake?.removeFromParent()
            snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
            self.addChild(snake!)
        default:
            break
        }
    }
}
