//
//  GeoData.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 28/05/2022.
//

import Foundation
import CoreLocation

struct GeoData: Equatable {
    var routes: [Route]
    var bounds: GeoBounds

    init (routes: [Route]) {
        self.routes = routes
        self.bounds = GeoBounds(
            northEast: CLLocationCoordinate2D(),
            southWest: CLLocationCoordinate2D()
        )
        self.bounds = self.findBounds()
    }

    private func findBounds() -> GeoBounds {
        let routesPoints = self.routes.flatMap { route in
            [route.start, route.end]
        }
        let allPoints = routesPoints
        let latitudes = allPoints.map{ point in point.latitude }
        let longitudes = allPoints.map{ point in point.longitude }

        return GeoBounds(
            northEast: CLLocationCoordinate2D(
                latitude: latitudes.max() ?? 0.0,
                longitude: longitudes.max() ?? 0.0
            ),
            southWest: CLLocationCoordinate2D(
                latitude: latitudes.min() ?? 0.0,
                longitude: longitudes.min() ?? 0.0
            )
        )
    }

    static func == (lhs: GeoData, rhs: GeoData) -> Bool {
        lhs.routes == rhs.routes
        && lhs.bounds == rhs.bounds
    }
}
