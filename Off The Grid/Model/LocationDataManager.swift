//
//  ListDataSource.swift
//  Off The Grid
//
//  Created by Thaoly Ngo on 5/10/21.
//

import Foundation

struct LocationDataManager {
    
    func loadLocations() -> [Location]? {
        let locationURL = Bundle.main.url(forResource: "locations", withExtension: "geojson")!
        let data = try! Data(contentsOf: locationURL)
        return parseGeoJSON(data)!
    }
    
    
    func parseGeoJSON( _ locationData: Data? ) -> [Location]? {
        
        let decoder = JSONDecoder()
        do {
            var locations: [Location] = []
            let decodedData = try decoder.decode(LocationData.self, from: locationData!)
            
            for feature in decodedData.features {
                let name = feature.properties.name
                let category = feature.properties.category
                
                let locationModel = Location(name: name, category: category)
                locations.append(locationModel)
            }
            return locations
            
        } catch {
            return nil
        }
        
    }

}

