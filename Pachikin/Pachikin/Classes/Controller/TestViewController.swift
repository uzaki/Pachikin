//
//  TestViewController.swift
//  Pachikin
//
//  Created by uzaki kota on 2018/01/20.
//  Copyright © 2018年 uzaki kota. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class TestViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    
    var lm: CLLocationManager!
    let defaultRadius = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
        lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestAlwaysAuthorization()
        lm.distanceFilter = 300
        lm.startUpdatingLocation()
        //startLocation()
        
        
        
    }
    
    func startLocation(){
        //NSLog("aaaaaa")
        lm.startUpdatingLocation()
    }
    
    func stopLocation(){
        
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!){
        //NSLog("bbb")
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:newLocation.coordinate.latitude,longitude:newLocation.coordinate.longitude)
        let now :GMSCameraPosition = GMSCameraPosition.camera(withLatitude: coordinate.latitude,longitude:coordinate.longitude,zoom:17)
        mapView.camera = now
        
        
        
    }
    
    private func locationManager(manager: CLLocationManager!, didFailWithError error: Error!){
        NSLog("ccc")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
