//
//  LocationManager.swift
//  Off The Grid
//
//  Created by Lynn Ngo on 3/24/21.
//

import Foundation

//struct LocationManager {
//    
//    let locationURL = Bundle.main.url(forResource: "locations", withExtension: "geojson")!
//    
//    func parseGeoJSON( _ locationData: Data? ) -> [LocationModel]? {
//        
//        let decoder = JSONDecoder()
//        
//        do {
//            
//            var locations : [LocationModel]
//            
//            let decodedData = try decoder.decode(LocationData.self, from: locationData!)
//            
//            for feature in decodedData.features {
//                let name = feature.properties.name
//                let category = feature.properties.category
//                let coordinates = feature.geometry.coordinates
//                
//                let locationModel = LocationModel(name: name, category: category, coordinates: coordinates)
//                locations.append(locationModel)
//            }
//            return locations
//        }
//    }
//    
//    
//}

