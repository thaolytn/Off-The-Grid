//
//  LocationData.swift
//  Off The Grid
//
//  Created by Lynn Ngo on 3/23/21.
//

import Foundation

struct LocationData : Decodable {
    let type : String
    let features : [Feature]
}

struct Feature : Decodable {
    let type : String
    let properties : Property
    let geometry : Geometry
}

struct Property : Decodable {
    let name : String
    let category : String
    let address : String
}

struct Geometry : Decodable {
    let coordinates : [Float]
}


