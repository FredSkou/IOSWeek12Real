//
//  ViewController.swift
//  customMapPin
//
//  Created by admin on 18/06/2020.
//  Copyright © 2020 Fred. All rights reserved.
//

import UIKit
import MapKit

// We make a class for the Pin
class customPin: NSObject,MKAnnotation{
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String,locationName: String,coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var longtitudeTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    @IBAction func setPin(_ sender: Any) {
        
        let lat = Double(locationTextField.text!)
        let lon = Double(longtitudeTextField.text!)
        let name: String = nameTextField.text!
        
        let mapZoom: Double = 1000
        
        var location = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        var region = MKCoordinateRegion(center: location, latitudinalMeters: mapZoom, longitudinalMeters: mapZoom)
        
        
        print("Pin at:\(name): \(lat),\(lon)")
        let pin = customPin(title: name, locationName: name, coordinate: location)
        self.mapView.addAnnotation(pin)
        self.mapView.setRegion(region, animated: true)
    }
}
