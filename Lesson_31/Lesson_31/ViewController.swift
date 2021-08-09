//
//  ViewController.swift
//  Lesson_31
//
//  Created by Maxim Bulat on 09.08.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moscowCoordinates = CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417)
        let region = MKCoordinateRegion(center: moscowCoordinates, latitudinalMeters: 40000, longitudinalMeters: 40000)
        mapView.setRegion(region, animated: false)
        
        let pin = MKPointAnnotation()
        
        pin.coordinate = moscowCoordinates
        pin.title = "Current"
        pin.subtitle = "Location"

        mapView.addAnnotation(pin)
        mapView.showsUserLocation = true
        mapView.delegate = self
    }

    @IBAction func setZoomRangeButtonPressed(_ sender: Any) {
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 40000)
        
        let moscowCoordinates = CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423)
        let region = MKCoordinateRegion(center: moscowCoordinates, latitudinalMeters: 40000, longitudinalMeters: 40000)

        mapView.setRegion(region, animated: false)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let coordinates = view.annotation?.coordinate else {
            return
        }
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 10000)
        mapView.camera.centerCoordinate = coordinates
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
}

