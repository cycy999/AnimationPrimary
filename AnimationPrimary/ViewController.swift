//
//  ViewController.swift
//  AnimationPrimary
//
//  Created by 陈岩 on 2018/3/15.
//  Copyright © 2018年 陈岩. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    
    let datas = [["Rotation","Position","Change","Scale","Size"],["KeyFrame"],["Transition"],["Spring"],["Group"],["DrawLine","WaveLine","Fire","FireTwo","Login"]]
    let titles : [String] = ["CABaseAnimation","CAKeyframeAnimation","TransitionAnimation","SpringAnimation","GroupAnimation","综合实例"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if title == nil {
            title = "主页面"
        }
        tableView = UITableView(frame: UIScreen.main.bounds)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 40
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = datas[indexPath.section][indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let name = datas[indexPath.section][indexPath.row] + "Controller"
        print("AnimationPrimary" + "." + name)
        if let type = NSClassFromString("AnimationPrimary" + "." + name) {
            let vc = (type as! UIViewController.Type).init()
            show(vc, sender: nil)
        }
    }

}

