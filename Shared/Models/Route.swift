//
//  Route.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 19/05/2022.
//

import Foundation
import CoreLocation

enum RouteKind {
    case planned
    case visited
}

struct Route: Equatable {
    var id: String
    var kind: RouteKind
    var start: CLLocationCoordinate2D
    var end: CLLocationCoordinate2D

    var distanceMeter: CLLocationDistance {
        get {
            let from = CLLocation(
                latitude: start.latitude,
                longitude: start.longitude
            )
            let to = CLLocation(
                latitude: end.latitude,
                longitude: end.longitude
            )
            return from.distance(from: to)
        }
    }

    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.kind == rhs.kind
        && lhs.start.latitude == rhs.start.latitude
        && lhs.start.longitude == rhs.start.longitude
        && lhs.end.latitude == rhs.end.latitude
        && lhs.end.longitude == rhs.end.longitude
    }
}
