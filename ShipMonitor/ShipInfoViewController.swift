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
    
    let infoNameCN = ["基本信息", "船舶尺寸", "船舶容积", "管理信息"]
    let infoName = ["BASIC INFO", "SIZE", "VOLUME", "MANAGE INFO"]
    var expandedCell: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

        if tableView.responds(to: #selector(setter: UIView.layoutMargins)){
            tableView.layoutMargins = UIEdgeInsets.zero
        }
        if tableView.responds(to: #selector(setter: UITableViewCell.separatorInset)){
            tableView.separatorInset = UIEdgeInsets.zero
        }
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
        return expandedCell == nil ? infoName.count : infoName.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if expandedCell == nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let label = cell?.viewWithTag(100) as! UILabel
            label.text = infoName[indexPath.row]
            return cell!
        } else {
            if indexPath.row < expandedCell!.row + 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                let label = cell?.viewWithTag(100) as! UILabel
                label.text = infoName[indexPath.row]
                return cell!
            } else if indexPath.row > expandedCell!.row + 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                let label = cell?.viewWithTag(100) as! UILabel
                label.text = infoName[indexPath.row - 1]
                return cell!
            } else {
                //info cell
                let cell = tableView.dequeueReusableCell(withIdentifier: "basicInfoCell")
                (cell?.viewWithTag(100) as! UILabel).text = "ACACIA"
                (cell?.viewWithTag(101) as! UILabel).text = "371044000"
                (cell?.viewWithTag(102) as! UILabel).text = "3FAM2"
                (cell?.viewWithTag(103) as! UILabel).text = "9476599"
                (cell?.viewWithTag(104) as! UILabel).text = "Pamaa"
                (cell?.viewWithTag(105) as! UILabel).text = "oil and chemical tanker"
                (cell?.viewWithTag(106) as! UILabel).text = "STEEL"
                (cell?.viewWithTag(107) as! UILabel).text = "PANAMA"
                (cell?.viewWithTag(108) as! UILabel).text = "14.0kn"
                (cell?.viewWithTag(109) as! UILabel).text = "30/08/2010"
                return cell!
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if expandedCell == nil {
            rotateImage(tableView: tableView, indexPath: indexPath)
            expandedCell = indexPath
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
        } else {
            
            // MARK: TODO 展开动画
            if indexPath.row < expandedCell!.row {
                rotateImage(tableView: tableView, indexPath: indexPath)
                rotateImage(tableView: tableView, indexPath: expandedCell!)
                expandedCell = indexPath
                tableView.reloadData()
            } else if indexPath.row == expandedCell!.row {
                rotateImage(tableView: tableView, indexPath: expandedCell!)
                expandedCell = nil
                tableView.deleteRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
            } else if indexPath.row == expandedCell!.row + 1 {
                rotateImage(tableView: tableView, indexPath: expandedCell!)
                expandedCell = nil
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if indexPath.row > expandedCell!.row + 1 {
                rotateImage(tableView: tableView, indexPath: indexPath)
                rotateImage(tableView: tableView, indexPath: expandedCell!)
                expandedCell = IndexPath(row: indexPath.row - 1, section: 0)
                tableView.reloadData()
            }
        }
        
        
    }
    
    func rotateImage(tableView: UITableView, indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let imageView = cell?.viewWithTag(101) as! UIImageView
        UIView.animate(withDuration: 0.3 , delay: 0, options: .curveLinear, animations: {
            imageView.transform = imageView.transform.rotated(by: CGFloat(M_PI))
            }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandedCell == nil {
            return 44
        } else {
            return indexPath.row == expandedCell!.row + 1 ? 267 : 44
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UIView.layoutMargins)){
            cell.layoutMargins = UIEdgeInsets.zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)){
            cell.separatorInset = UIEdgeInsets.zero
        }
    }
    
}
