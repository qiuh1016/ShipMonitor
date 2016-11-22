//
//  RouteViewController.swift
//  ShipMonitor
//
//  Created by qiuhong on 22/11/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import MapKit

class RouteViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let route = [
        CLLocationCoordinate2D(latitude: 29.825507, longitude: 122.37926 ),
        CLLocationCoordinate2D(latitude: 29.816571, longitude: 122.397113),
        CLLocationCoordinate2D(latitude: 29.814784, longitude: 122.421832),
        CLLocationCoordinate2D(latitude: 29.829081, longitude: 122.440371),
        CLLocationCoordinate2D(latitude: 29.84159 , longitude: 122.459597),
        CLLocationCoordinate2D(latitude: 29.853501, longitude: 122.46915 ),
        CLLocationCoordinate2D(latitude: 29.867863, longitude: 122.472259),
        CLLocationCoordinate2D(latitude: 29.881119, longitude: 122.484303)

    ]
    
    var routeLine: MKPolyline?

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        
        let center = CLLocationCoordinate2D(latitude: 29.84159, longitude: 122.409472)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        
        
        for coor in route {
            let ship = Ship()
            ship.name = "11-22 12:18:01"
            ship.number = ""
            ship.coor = coor
            setAnnotation(ship, type: .point)
        }
        
        
        drawRouteLine(route: route)
    }
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MyAnnotation.self) {
            var view = mapView.dequeueReusableAnnotationView(withIdentifier: "point");
            view = MKAnnotationView(annotation: annotation, reuseIdentifier: "point");
            let myAnnotation = annotation as! MyAnnotation
            switch myAnnotation.type {
            case .start:
                view?.image = UIImage(named: "map_icon_start");
            case .end:
                view?.image = UIImage(named: "map_icon_end");
            case .point:
                view?.image = UIImage(named: "routePoint_blue");
            }
            //view?.centerOffset = CGPoint(x: 0, y: -(view!.frame.size.height * 0.5));
            view?.canShowCallout = true;
            return view
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
            let polylineRenderer = MKPolylineRenderer(polyline: routeLine!)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 1
            return polylineRenderer
       
    }
    
    
    
    func setAnnotation(_ ship: Ship, type: MyAnnotationType) {
        let annotation = MyAnnotation()
        annotation.title = ship.name
        annotation.subtitle = ship.number
        annotation.type = type
        annotation.coordinate = ship.coor
        mapView.addAnnotation(annotation)
        
    }
    
    func drawRouteLine(route: [CLLocationCoordinate2D]) {
        routeLine = MKPolyline(coordinates: route, count: route.count)
        mapView.add(routeLine!)
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
