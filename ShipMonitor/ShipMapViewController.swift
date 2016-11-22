//
//  ShipMapViewController.swift
//  ShipMonitor
//
//  Created by qiuhong on 21/11/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import MapKit

class ShipMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        searchButton.layer.cornerRadius = 18.5
        searchButton.layer.borderColor = UIColor.lightGray.cgColor
        searchButton.layer.borderWidth = 1 / 2
        //searchButton.layer.masksToBounds = true
        
        mapView.showsUserLocation = true
        let center = CLLocationCoordinate2D(latitude: 30, longitude: 122)
        let span = MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        
        
        
        let ship1 = Ship()
        ship1.name = "ACACIA"
        ship1.number = "371044000"
        ship1.coor = center
        setAnnotation(ship1, type: .point)
        
        let ship2 = Ship()
        ship2.name = "ACACIA_1"
        ship2.number = "371044000_1"
        ship2.coor = CLLocationCoordinate2D(latitude: 30.1, longitude: 122.4)
        setAnnotation(ship2, type: .point)
        
        let ship3 = Ship()
        ship3.name = "ACACIA_2"
        ship3.number = "371044000_2"
        ship3.coor = CLLocationCoordinate2D(latitude: 29.5, longitude: 121.6)
        setAnnotation(ship3, type: .point)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MyAnnotation.self) {
            var view = mapView.dequeueReusableAnnotationView(withIdentifier: "point");
            view = MKAnnotationView(annotation: annotation, reuseIdentifier: "point");
            let myAnnotation = annotation as! MyAnnotation
            switch myAnnotation.type {
            case .start:
                view?.image = UIImage(named: "map_icon_start")
            case .end:
                view?.image = UIImage(named: "map_icon_end")
            case .point:
                view?.image = UIImage(named: "ship_icon_blue_fill_shadow") //UIImage(named: "map_icon_point")
            }
//            view?.centerOffset = CGPoint(x: 0, y: -(view!.frame.size.height * 0.5));
            view?.canShowCallout = true;
            return view
        }
        
        return nil
    }
    

    func setAnnotation(_ ship: Ship, type: MyAnnotationType) {
        let annotation = MyAnnotation()
        annotation.title = ship.name
        annotation.subtitle = ship.number
        annotation.type = type
        annotation.coordinate = ship.coor
        mapView.addAnnotation(annotation)
//        anntations.append(annotation)
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
