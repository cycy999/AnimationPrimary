//
//  Animate.swift
//  AnimationPrimary
//
//  Created by 陈岩 on 2018/3/16.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class Animate: NSObject {

    class func baseAnimationWithKeyPath(_ path: String, fromValue: Any?, toValue: Any?, duration: CFTimeInterval, repeatCount: Float?, timingFunction: String?) -> CABasicAnimation {
        let animate = CABasicAnimation(keyPath: path)
        
        animate.fromValue = fromValue
        
        animate.toValue = toValue
        
        animate.duration = duration
        
        animate.repeatCount = repeatCount ?? 0
        
        animate.timingFunction = CAMediaTimingFunction(name: timingFunction ?? kCAMediaTimingFunctionEaseInEaseOut)
        
        animate.fillMode = kCAFillModeBoth
        
        return animate
    }
    
    
    
}
