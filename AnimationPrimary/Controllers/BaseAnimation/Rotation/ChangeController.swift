//
//  ChangeController.swift
//  AnimationPrimary
//
//  Created by 陈岩 on 2018/3/19.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit
import PureLayout

class ChangeController: BaseViewController {

    var bgColorView: UIView!
    var cornerView: UIView!
    var borderColorView: UIView!
    var borderWidthView: UIView!
    var iconImgView: UIImageView!
    var opacityImgView: UIImageView!
    var shadowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config_subviews()
        startAnimate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startAnimate() {
        
        let bgColorAnimate = Animate.baseAnimationWithKeyPath("backgroundColor", fromValue: nil, toValue: UIColor.green.cgColor, duration: 1, repeatCount: Float.infinity, timingFunction: nil)
        bgColorAnimate.autoreverses = true
        bgColorView.layer.add(bgColorAnimate, forKey: "bgColorAnimate")
        
        let cornerAnimate = Animate.baseAnimationWithKeyPath("cornerRadius", fromValue: nil, toValue: 25, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        cornerAnimate.autoreverses = true
        cornerView.layer.add(cornerAnimate, forKey: "cornerRndius")
        
        let borderColorAnimate = Animate.baseAnimationWithKeyPath("borderColor", fromValue: nil, toValue: UIColor.yellow.cgColor, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        borderColorAnimate.autoreverses = true
        borderColorView.layer.borderWidth = 5
        borderColorView.layer.add(borderColorAnimate, forKey: "borderColor")
        
        let borderWAnimate = Animate.baseAnimationWithKeyPath("borderWidth", fromValue: 0, toValue: 5, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        borderWAnimate.autoreverses = true
        borderWidthView.layer.borderColor = UIColor.red.cgColor
        borderWidthView.layer.add(borderWAnimate, forKey: "borderWidth")
        
        //onedown
        let img = UIImage(named: "onedown")
        let contentAnimate = Animate.baseAnimationWithKeyPath("contents", fromValue: nil, toValue: img?.cgImage, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        contentAnimate.autoreverses = true
        iconImgView.layer.add(contentAnimate, forKey: "contents")
        
        let opacityAnimate = Animate.baseAnimationWithKeyPath("opacity", fromValue: nil, toValue: 0.2, duration: 0.1, repeatCount: Float.infinity, timingFunction: nil)
        opacityAnimate.autoreverses = true
        opacityImgView.layer.add(opacityAnimate, forKey: "opacity")
        
        shadowView.layer.shadowColor = UIColor(white: 0, alpha: 0.5).cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowRadius = 8
        let shadowAnimate = Animate.baseAnimationWithKeyPath("shadowOpacity", fromValue: 0, toValue: 0.8, duration: 0.5, repeatCount: Float.infinity, timingFunction: nil)
        shadowAnimate.autoreverses = true
        shadowView.layer.add(shadowAnimate, forKey: "shadowOpacity")
    }

}

extension ChangeController {
    
    func config_subviews() {
        bgColorView = UIView.newAutoLayout()
        cornerView = UIView.newAutoLayout()
        borderColorView = UIView.newAutoLayout()
        borderWidthView = UIView.newAutoLayout()
        
        iconImgView = UIImageView.newAutoLayout()
        opacityImgView = UIImageView.newAutoLayout()
        
        shadowView = UIView.newAutoLayout()
        
        view.addSubview(bgColorView)
        view.addSubview(cornerView)
        view.addSubview(borderColorView)
        view.addSubview(borderWidthView)
        view.addSubview(iconImgView)
        view.addSubview(opacityImgView)
        view.addSubview(shadowView)
        
        let widthLeft = (DEVICE_WIDTH - 50 * 4) / 5
        for (index,v) in ([bgColorView, cornerView, borderColorView, borderWidthView] as [UIView]).enumerated() {
            let size = CGSize(width: 50, height: 50)
            v.autoSetDimensions(to: size)
            v.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
            v.autoPinEdge(toSuperviewEdge: .leading, withInset: widthLeft + (widthLeft + 50) * CGFloat(index))
            v.backgroundColor = UIColor.blue
        }
        
        iconImgView.autoCenterInSuperview()
        iconImgView.autoSetDimensions(to: CGSize(width: 150, height: 150))
        opacityImgView.autoAlignAxis(toSuperviewAxis: .vertical)
        opacityImgView.autoPinEdge(.top, to: .bottom, of: iconImgView, withOffset: 40)
        opacityImgView.autoSetDimensions(to: CGSize(width: 50, height: 50))

        shadowView.autoAlignAxis(toSuperviewAxis: .vertical)
        shadowView.autoPinEdge(.top, to: .bottom, of: opacityImgView, withOffset: 40)
        shadowView.autoSetDimensions(to: CGSize(width: 50, height: 50))
        iconImgView.image = UIImage(named: "icon2")
        
        opacityImgView.image = UIImage(named: "message")
        
        shadowView.backgroundColor = UIColor.blue
    }
    
}
