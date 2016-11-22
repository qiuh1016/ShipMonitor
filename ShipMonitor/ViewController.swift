//
//  ViewController.swift
//  ShipMonitor
//
//  Created by qiuhong on 21/11/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wheelImage: UIImageView!
    @IBOutlet weak var shipImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIView.animate(withDuration: 2 , delay: 0, options: .curveLinear, animations: {
            self.shipImage.transform = self.shipImage.transform.rotated(by: CGFloat(M_PI_2 / 4))
            }, completion: { Void in
                //
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

