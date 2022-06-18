//
//  Area.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 24/05/2022.
//

import Foundation
import CoreLocation

struct Area: Equatable {
    var id: String
    var boundary: [CLLocationCoordinate2D]

    static func == (lhs: Area, rhs: Area) -> Bool {
        lhs.id == rhs.id
        && lhs.boundary.count == rhs.boundary.count
    }
}
