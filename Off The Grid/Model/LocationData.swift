//
//  LocationData.swift
//  Off The Grid
//
//  Created by Lynn Ngo on 3/23/21.
//

import Foundation

struct LocationData : Codable {
    let type : String
    let features : [Feature]
}

struct Feature : Codable {
    let type : String
    let properties : Property
    let geometry : Geometry
}

struct Property : Codable {
    let name : String
    let category : String
}

struct Geometry : Codable {
    let coordinates : [[Double]]
    let type : String
}
