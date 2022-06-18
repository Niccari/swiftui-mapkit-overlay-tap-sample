//
//  GeoPresentation.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 07/06/2022.
//

import Foundation

import MapKit

class GeoPresentation {
    static func createPolylines(
        routes: [Route],
        operations: [GeoOperation]
    ) -> [StyledPolyline] {
        return operations.map { operations -> StyledPolyline in
            if let route = routes.filter({ $0.id == operations.featureId }).first {
                    let color = (route.kind == .planned) ? UIColor.blue : UIColor.red
                return StyledPolyline(
                    id: operations.featureId ?? "",
                    points: [
                        route.start,
                        route.end
                    ],
                    strokeColor: color,
                    lineWidth: 10.0
                )
            } else {
                fatalError("Route not found")
            }
        }
    }
}
