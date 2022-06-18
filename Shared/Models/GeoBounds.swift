//
//  GeoBounds.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 29/05/2022.
//

import Foundation
import CoreLocation

struct GeoBounds: Equatable {
    var northEast: CLLocationCoordinate2D
    var southWest: CLLocationCoordinate2D

    static func == (lhs: GeoBounds, rhs: GeoBounds) -> Bool {
        lhs.northEast.latitude == rhs.northEast.latitude
        && lhs.northEast.longitude == rhs.northEast.longitude
        && lhs.southWest.latitude == rhs.southWest.latitude
        && lhs.southWest.longitude == rhs.southWest.longitude
    }
}
