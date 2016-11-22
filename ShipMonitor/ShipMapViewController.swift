//
//  ShipMapViewController.swift
//  ShipMonitor
//
//  Created by qiuhong on 21/11/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import MapKit

class ShipMapViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        searchButton.layer.cornerRadius = 18.5
        //searchButton.layer.masksToBounds = true
        
        mapView.showsUserLocation = true
        let center = CLLocationCoordinate2D(latitude: 30, longitude: 122)
        let span = MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "This ship"
        mapView.addAnnotation(annotation)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
