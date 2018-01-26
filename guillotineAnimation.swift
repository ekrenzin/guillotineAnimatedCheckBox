//
//  guillotineAnimation.swift
//  GRX Mail
//
//  Created by Ean Krenzin on 11/7/17.
//  Copyright © 2017 Ean Krenzin. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class GuillotineView: UIView {
    
    override func draw(_ rect: CGRect) {
     let shapePath = UIBezierPath()
        shapePath.lineWidth = 0.5
        shapePath.move(to: CGPoint(x: 0, y: 0))
        shapePath.addLine(to: CGPoint(x: 25, y: 0))
        shapePath.addLine(to: CGPoint(x: 25, y: 12))
        shapePath.addLine(to: CGPoint(x: 0,  y: 6))
        shapePath.close()
        UIColor.black.setFill()
        shapePath.fill()
        shapePath.stroke()
        
       
    }
    
}
class GuillotineView2: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let shapePath = UIBezierPath()
        shapePath.lineWidth = 0.5
        shapePath.move(to: CGPoint(x: 0, y: 0))
        shapePath.addLine(to: CGPoint(x: 32.5, y: 0))
        shapePath.addLine(to: CGPoint(x: 32.5, y: 30))
        shapePath.addLine(to: CGPoint(x: 0,  y: 20))
        shapePath.close()
        shapePath.lineWidth = 2.0
        UIColor.black.setStroke()
        UIColor.white.setFill()
        shapePath.stroke()
        var guillotineMask = CAShapeLayer()
        guillotineMask.path = shapePath.cgPath
        self.layer.mask = guillotineMask
        
    }
    
}
class GuillotineView3: UIView {
    
    override func draw(_ rect: CGRect) {
        let shapePath = UIBezierPath()
        shapePath.lineWidth = 0.5
        shapePath.move(to: CGPoint(x: 0, y: 0))
        shapePath.addLine(to: CGPoint(x: sS.width, y: 0))
        shapePath.addLine(to: CGPoint(x: sS.width, y: 40))
        shapePath.addLine(to: CGPoint(x: 0,  y: 30))
        shapePath.close()
        shapePath.lineWidth = 2.0
        UIColor.black.setStroke()
        UIColor.black.setFill()
        shapePath.stroke()
    }
}

class Box: UIView {
    
    override func draw(_ rect: CGRect) {
        let borderPath = UIBezierPath()
        borderPath.lineWidth = 4
        borderPath.move(to: CGPoint(x: 1, y: 1))
        borderPath.addLine(to: CGPoint(x: 22, y: 1))
        borderPath.addLine(to: CGPoint(x: 22, y: 22))
        borderPath.addLine(to: CGPoint(x: 1,  y: 22))
        borderPath.close()
        UIColor.white.set()
        borderPath.stroke()
        
    }
}

func guillotineAnimation(checkBox: UIView){
    let box = Box()
    box.frame = checkBox.frame
    box.backgroundColor = UIColor.clear
    checkBox.addSubview(box)
    checkBox.sendSubview(toBack: box)
     if boxStatus == true {
        let viewSize = checkBox.bounds.size
        let rect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        let guillotineView = GuillotineView()
        guillotineView.frame = CGRect(x: 1, y: 1, width: 22, height: 25)
        guillotineView.backgroundColor = UIColor.clear
        checkBox.mask(withRect: rect)
        checkBox.addSubview(guillotineView)
       UIView.animate(withDuration: 1, delay: 0.4, options: [ UIViewAnimationOptions.curveEaseIn, ], animations:
            {
                
                guillotineView.transform.ty += (checkBox.frame.height);
                
        },completion: {finished in
            let when = DispatchTime.now() + 0.25
            DispatchQueue.main.asyncAfter(deadline: when) {
                checkBox.backgroundColor = UIColor.black
//                checkBox.addSubview(whiteFrame)
//                whiteFrame.addSubview(blackBox)
            }
            
            }
            
        )} else {
       
        checkBox.backgroundColor = UIColor.white
    }
    
 
        
    

print(boxStatus)


}
