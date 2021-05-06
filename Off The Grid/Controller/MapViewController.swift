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
    var mapView: MGLMapView!
    var currentFeature : MGLPointFeature!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the map's styling URL
        let url = URL(string: "mapbox://styles/thaolyngo/ckdq24xor0rv81iqgphyie5qg")
        mapView = MGLMapView(frame: view.bounds, styleURL: url)
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
        
        // Add gesture recognizer when user taps on locations
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleItemTap(sender:)))
        for recognizer in mapView.gestureRecognizers! where recognizer is UITapGestureRecognizer {
            singleTap.require(toFail: recognizer)
        }
        mapView.addGestureRecognizer(singleTap)

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
    
    
    
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        
        DispatchQueue.global().async {
            let locationURL = Bundle.main.url(forResource: "locations", withExtension: "geojson")!
            let data = try! Data(contentsOf: locationURL)
            
            DispatchQueue.main.async {
                self.drawLocationData(data: data, style: style)
            }
        }
        
    }
    
    
    
    
    
    
    // MARK: - Utility Functions
    
    func drawLocationData(data: Data, style: MGLStyle) {
        
        
        let feature = try! MGLShape(data: data, encoding: String.Encoding.utf8.rawValue) as! MGLShapeCollectionFeature
        
        let shapeSource = MGLShapeSource(identifier: "store-locations", shape: feature, options: nil)
        
        let shapeLayer = MGLSymbolStyleLayer(identifier: "store-locations", source: shapeSource)
        
        if let image = UIImage(named: "location-icon") {
            style.setImage(image, forName: "location-symbol")
        }
        
        shapeLayer.iconImageName = NSExpression(forConstantValue: "location-symbol")
        
        style.addSource(shapeSource)
        style.addLayer(shapeLayer)
        
    }
    
    
    @objc @IBAction func handleItemTap(sender: UIGestureRecognizer) {
        if sender.state == .ended {
            let point : CGPoint = sender.location(in: mapView)
            let layer : Set = ["store-locations"]
 
            if mapView.visibleFeatures(at: point, styleLayerIdentifiers: layer).count > 0  {
                currentFeature = mapView.visibleFeatures(at: point, styleLayerIdentifiers: layer).first as? MGLPointFeature
                performSegue(withIdentifier: "goToDescription", sender: self)

            } else {
                print("Not a feature")
            }
        }
    }
    
    
    
//    func generateDescPage(feature: MGLPointFeature) {
//
//        let descVC = DescriptionViewController()
//        if let featureName = feature.attribute(forKey: "name") as? String {
//            descVC.featureName = featureName
//        }
//
//        //self.present(descVC, animated: true, completion: nil)
//
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDescription" {
            let descVC = segue.destination as! DescriptionViewController
            descVC.featureName = currentFeature.attribute(forKey: "name") as! String
                        
        }
    }

}

