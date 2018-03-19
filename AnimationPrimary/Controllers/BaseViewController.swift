//
//  BaseViewController.swift
//  AnimationPrimary
//
//  Created by 陈岩 on 2018/3/16.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit
import PureLayout

class BaseViewController: UIViewController {

    let screen:UIScreen = UIScreen.main
    let DEVICE_RECT:CGRect = UIScreen.main.bounds
    let DEVICE_WIDTH:CGFloat = UIScreen.main.bounds.width
    let DEVICE_HEIGHT:CGFloat = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(noti:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardShow(noti: Notification) {
        let dict = noti.userInfo as! [String:Any]
        let rect = (dict[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        viewTransformY(-Float(rect.size.height))
    }
    
    func viewTransformY(_ y:Float) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.view.transform = CGAffineTransform(translationX: 0, y: CGFloat(y))
        }, completion: nil)
    }
    
    func hideKeyboard() {
        self.view.endEditing(true)
        viewTransformY(0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
}
