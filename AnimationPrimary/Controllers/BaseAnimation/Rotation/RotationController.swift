//
//  RotationController.swift
//  AnimationPrimary
//
//  Created by 陈岩 on 2018/3/16.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class RotationController: BaseViewController {

    var rotationImg: UIImageView!
    var button_x: UIButton!
    var button_y: UIButton!
    var button_z: UIButton!
    var button_custom: UIButton!
    
    var label_x: UILabel!
    var label_y: UILabel!
    var textField_x: UITextField!
    var textField_y: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        config_subviews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clickSender(_ sender: UIButton) {
        switch sender {
        case button_x:
            rotationImg.layer.removeAllAnimations()
            let animate = Animate.baseAnimationWithKeyPath("transform.rotation.x", fromValue: nil, toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionLinear)
            rotationImg.layer.add(animate, forKey: "transform.rotation.x")
        case button_y:
            rotationImg.layer.removeAllAnimations()
            let animate = Animate.baseAnimationWithKeyPath("transform.rotation.y", fromValue: nil, toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionLinear)
            rotationImg.layer.add(animate, forKey: "transform.rotation.y")
        case button_z:
            rotationImg.layer.removeAllAnimations()
            let animate = Animate.baseAnimationWithKeyPath("transform.rotation.z", fromValue: nil, toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionLinear)
            rotationImg.layer.add(animate, forKey: "transform.rotation.z")
        default:
            let x = (textField_x.text! as NSString).doubleValue
            let y = (textField_y.text! as NSString).doubleValue
            rotationImg.layer.anchorPoint = CGPoint(x: x, y: y)
            rotationImg.layer.removeAllAnimations()
            let animate = Animate.baseAnimationWithKeyPath("transform.rotation.z", fromValue: nil, toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionLinear)
            rotationImg.layer.add(animate, forKey: "transform.rotation.z")
        }
    }

}

extension RotationController {
    
    func config_subviews() {
        rotationImg = UIImageView()
        button_x = UIButton(type: .custom)
        button_y = UIButton(type: .custom)
        button_z = UIButton(type: .custom)
        button_custom = UIButton(type: .custom)
        label_x = UILabel(frame: CGRect.zero)
        label_y = UILabel(frame: CGRect.zero)
        textField_x = UITextField(frame: CGRect.zero)
        textField_y = UITextField(frame: CGRect.zero)
        for v in [rotationImg, button_y, button_x, button_z, button_custom, label_x, label_y, textField_x, textField_y] as [UIView] {
            view.addSubview(v)
            v.backgroundColor = UIColor.yellow
        }
        rotationImg.image = UIImage(named: "rotation_img")
        rotationImg.frame = CGRect(origin: CGPoint.init(x: 0, y: 0), size: CGSize(width: 152, height: 157))
        rotationImg.center = CGPoint(x: DEVICE_WIDTH / 2, y: DEVICE_HEIGHT / 2)
        
        var y: CGFloat = DEVICE_HEIGHT - 64 - 20
        button_custom.frame = CGRect(x: 20, y: y - 40, width: DEVICE_WIDTH - 40, height: 40)
        y -= 60
        label_x.frame = CGRect(x: 20, y: y - 30, width: 40, height: 30)
        label_y.frame = CGRect(x: DEVICE_WIDTH / 2 + 20, y: y - 30, width: 40, height: 30)
        textField_x.frame = CGRect(x: 80, y: y - 30, width: 80, height: 30)
        textField_y.frame = CGRect(x: DEVICE_WIDTH / 2 + 80, y: y - 30, width: 80, height: 30)
        y -= 40
        let width = (DEVICE_WIDTH - 40) / 3
        button_x.frame = CGRect(x: 20, y: y - 40, width: width - 5, height: 30)
        button_y.frame = CGRect(x: 20 + width, y: y - 40, width: width - 5, height: 30)
        button_z.frame = CGRect(x: 20 + width * 2, y: y - 40, width: width - 5, height: 30)
        
        label_x.text = "X:"
        label_y.text = "Y:"
        textField_x.text = "0.5"
        textField_y.text = "0.5"
        textField_x.textAlignment = .center
        textField_y.textAlignment = .center
        button_custom.setTitle("自定义角度", for: .normal)
        button_x.setTitle("RotationX", for: .normal)
        button_y.setTitle("RotationY", for: .normal)
        button_z.setTitle("RotationZ", for: .normal)

        for button in [button_x, button_y, button_z, button_custom] as [UIButton] {
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(clickSender(_:)), for: .touchUpInside)
        }
        
    }
    
}
