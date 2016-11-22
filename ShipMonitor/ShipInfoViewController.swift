//
//  ShipInfoViewController.swift
//  ShipMonitor
//
//  Created by qiuhong on 21/11/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class ShipInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let infoName = ["基本信息", "船舶尺寸", "船舶容积", "管理信息"]
    var expandedCell: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let label = cell?.viewWithTag(100) as! UILabel
        label.text = infoName[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if expandedCell == nil {
            rotateImage(tableView: tableView, indexPath: indexPath)
            expandedCell = indexPath
        } else {
            if expandedCell == indexPath {
                rotateImage(tableView: tableView, indexPath: indexPath)
                expandedCell = nil
            } else {
                rotateImage(tableView: tableView, indexPath: indexPath)
                rotateImage(tableView: tableView, indexPath: expandedCell!)
                expandedCell = indexPath
            }
        }
        
    }
    
    func rotateImage(tableView: UITableView, indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let imageView = cell?.viewWithTag(101) as! UIImageView
        UIView.animate(withDuration: 0.3 , delay: 0, options: .curveLinear, animations: {
            imageView.transform = imageView.transform.rotated(by: CGFloat(M_PI))
            }, completion: { Void in
                //
        })
    }
}