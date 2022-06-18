//
//  GeoJsonCodable.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 28/05/2022.
//

import Foundation

struct Collection : Decodable {
    let type: String
    let features: [Feature]
}

struct Feature : Decodable {
    let type: String
    let properties: Properties
    let geometry: Geometry
    // there is also geometry
}

struct Properties: Decodable {
    let scalerank : Int
    let name : String
    let website : URL
    let natlscale : Int
    let featureclass : String
}

struct Geometry: Decodable {
    let type: String
    let coordinates: [[[Double]]] | [[Double]]
}
