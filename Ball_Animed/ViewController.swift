//
//  ViewController.swift
//  Ball_Animed
//
//  Created by Doãn Tuấn on 11/28/16.
//  Copyright © 2016 doantuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewBall = UIImageView()
    var radians = CGFloat()
    var ballRadius = CGFloat()
    var time:Timer!
    var isLR:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        time = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(animedBall), userInfo: nil, repeats: true)
    }


    
    func addBall(){
        
        viewBall = UIImageView(image: UIImage(named: "ball"))
        ballRadius = 32.0
        viewBall.center = CGPoint(x: ballRadius , y: self.view.bounds.height*0.5)
        self.view.addSubview(viewBall)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        time.invalidate()
    }
    
    func rollLR(length: CGFloat){
        self.viewBall.transform = CGAffineTransform(rotationAngle: radians)
        viewBall.center = CGPoint(x: viewBall.center.x + length, y: viewBall.center.y)
    }
   
    func rollRL(length: CGFloat){
        self.viewBall.transform = CGAffineTransform(rotationAngle: -radians)
        viewBall.center = CGPoint(x: viewBall.center.x - length, y: viewBall.center.y + 0.1)
    }
    func animedBall(){
        let widthScreen = self.view.bounds.width
        let delaAngle: CGFloat = 0.1
        radians = radians + delaAngle
        let length = ballRadius*delaAngle
        
        if viewBall.center.x < ballRadius + 1.0 {
            isLR = true
        }else{
            if viewBall.center.x > widthScreen - ballRadius - 1.0{
                isLR = false
            }
        }
        if isLR {
            rollLR(length: length)
        }else{
            rollRL(length: length)
        }
        
        
        
}

}
