//
//  ViewController.swift
//  Off The Grid
//
//  Created by Lynn Ngo on 3/17/21.
//

import UIKit
import Mapbox

class MapViewController: UIViewController, MGLMapViewDelegate {

    private var nyc: MGLCoordinateBounds!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the map's styling URL
        let url = URL(string: "mapbox://styles/thaolyngo/ckdq24xor0rv81iqgphyie5qg")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        mapView.compassView.compassVisibility = .hidden
       
        let center = CLLocationCoordinate2D(latitude: 40.7580, longitude: -73.9855)
        
        // Set the map's center coordinate and zoom level
        mapView.setCenter(center, zoomLevel: 12, direction: 0, animated: false)
        
        // Set NYC bounds
        let northeast = CLLocationCoordinate2D(latitude: 41.003977, longitude: -73.516367)
        let southwest = CLLocationCoordinate2D(latitude: 40.508105, longitude: -74.335879)
        nyc = MGLCoordinateBounds(sw: southwest, ne: northeast)
 
        // Add the mapView to the current View
        view.addSubview(mapView)

    }

    
    
    
    // MARK: - MGLMapViewDelegate Functions
    
    func mapView(_ mapView: MGLMapView, shouldChangeFrom oldCamera: MGLMapCamera, to newCamera: MGLMapCamera) -> Bool {
        
        // Get the current camera to restore it after
        let currentCamera = mapView.camera
        
        // From the new camera obtain the center to test if it's inside the boundaries
        let newCameraCenter = newCamera.centerCoordinate
        
        // Set the map's visible bounds to newCamera
        mapView.camera = newCamera
        let newVisibleCoordinates = mapView.visibleCoordinateBounds
        
        // Revert the camera
        mapView.camera = currentCamera
        
        // Test if the newCameraCenter and newVisibleCoordinates are inside self.nyc
        let inside = MGLCoordinateInCoordinateBounds(newCameraCenter, self.nyc)
        let intersects = MGLCoordinateInCoordinateBounds(newVisibleCoordinates.ne, self.nyc) && MGLCoordinateInCoordinateBounds(newVisibleCoordinates.sw, self.nyc)
        
        return inside && intersects
    }
    
    

}

