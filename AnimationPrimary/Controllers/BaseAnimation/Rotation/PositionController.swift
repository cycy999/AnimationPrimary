//
//  PositionController.swift
//  AnimationPrimary
//
//  Created by 陈岩 on 2018/3/16.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit
import PureLayout

class PositionController: BaseViewController {
    
    var moveLabel_x: UILabel!
    var moveLabel_y: UILabel!
    var pointLabel_x: UILabel!
    var pointLabel_y: UILabel!

    var moveTextField_x: UITextField!
    var moveTextField_y: UITextField!
    var pointTextField_x: UITextField!
    var pointTextField_y: UITextField!

    var imgView: UIImageView!
    var moveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        config_subviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func startAnimate(_ sender: UIButton) {
        hideKeyboard()
        
        imgView.layer.removeAllAnimations()
        
        let px = (moveTextField_x.text! as NSString).doubleValue
        let py = (moveTextField_y.text! as NSString).doubleValue
        let anchor_x = (pointTextField_x.text! as NSString).doubleValue
        let anchor_y = (pointTextField_y.text! as NSString).doubleValue
        
        
        let animate = Animate.baseAnimationWithKeyPath("position",
                                                       fromValue: NSValue(cgPoint: CGPoint(x: 64, y: 164)),
                                                       toValue: NSValue(cgPoint: CGPoint(x: px, y: py)),
                                                       duration: 1.5,
                                                       repeatCount: Float.infinity,
                                                       timingFunction: kCAMediaTimingFunctionEaseOut)
        animate.autoreverses = true
        imgView.layer.anchorPoint = CGPoint(x: anchor_x, y: anchor_y)
        imgView.layer.add(animate, forKey: "position")
    }

}

extension PositionController {
    
    func config_subviews() {
        
        imgView = UIImageView()
        view.addSubview(imgView)
        imgView.image = UIImage(named: "rotation_img")
        imgView.frame = CGRect(origin: CGPoint.init(x: 10, y: 100), size: CGSize(width: 152, height: 157))
        //imgView.center = CGPoint(x: DEVICE_WIDTH / 2, y: DEVICE_HEIGHT / 2)
        
        var bottomInset: CGFloat = DEVICE_HEIGHT - 64 - 160
        
        moveLabel_x = UILabel(frame: CGRect(x: 10, y: bottomInset, width: 80, height: 40))
        moveLabel_y = UILabel(frame: CGRect(x: 10 + DEVICE_WIDTH / 2, y: bottomInset, width: 80, height: 40))
        moveTextField_x = UITextField(frame: CGRect(x: 100, y: bottomInset, width: 80, height: 40))
        moveTextField_y = UITextField(frame: CGRect(x: 100 + DEVICE_WIDTH / 2, y: bottomInset, width: 80, height: 40))
        
        bottomInset += 80
        pointLabel_x = UILabel(frame: CGRect(x: 10, y: bottomInset, width: 80, height: 40))
        pointLabel_y = UILabel(frame: CGRect(x: 10 + DEVICE_WIDTH / 2, y: bottomInset, width: 80, height: 40))
        
        pointTextField_x = UITextField(frame: CGRect(x: 100, y: bottomInset, width: 80, height: 40))
        pointTextField_y = UITextField(frame: CGRect(x: 100 + DEVICE_WIDTH / 2, y: bottomInset, width: 80, height: 40))

        bottomInset += 80
        moveButton = UIButton(frame: CGRect(x: 20, y: bottomInset, width: DEVICE_WIDTH - 40, height: 40))
        
        for (index,v) in ([moveLabel_x, moveLabel_y, pointLabel_x, pointLabel_y] as [UILabel]).enumerated() {
            view.addSubview(v)
            v.backgroundColor = UIColor.yellow
            v.textAlignment = .center
            v.text = ["移动到X:","Y:","中心点X:","Y:"][index]
        }
        for (index, v) in ([moveTextField_x, moveTextField_y, pointTextField_x, pointTextField_y] as [UITextField]).enumerated() {
            view.addSubview(v)
            v.backgroundColor = UIColor.yellow
            v.textAlignment = .center
            v.text = ["200","64","0.5","0.5"][index]
        }
        view.addSubview(moveButton)
        moveButton.backgroundColor = UIColor.red
        moveButton.setTitle("开始动画", for: .normal)
        moveButton.setTitleColor(UIColor.black, for: .normal)
        moveButton.addTarget(self, action: #selector(startAnimate(_:)), for: .touchUpInside)
    }
    
}
