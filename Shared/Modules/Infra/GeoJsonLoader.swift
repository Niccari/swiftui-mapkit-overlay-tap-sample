//
//  GeoJsonLoader.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 19/05/2022.
//

import Foundation
import MapKit
import GeoJSON

class GeoJsonLoader {
    private let geoJsonPath: String

    init (geoJsonPath: String) {
        self.geoJsonPath = geoJsonPath
    }

    private func parse(for features: [Feature]) throws -> GeoData {
        var routes: [Route] = []

        features.forEach { feature in
            switch feature.geometry {
                case .lineString(let lineString):
                    let start = lineString.coordinates[0]
                    let end = lineString.coordinates[1]
                    var kind: RouteKind = .visited
                    switch feature.properties?.data["kind"] {
                        case "visited":
                            kind = .visited
                        case "planned":
                            kind = .planned
                        default:
                            break
                    }
                    routes.append(
                        Route(
                            id: String(routes.count),
                            kind: kind,
                            start: CLLocationCoordinate2D(latitude: start.latitude, longitude: start.longitude),
                            end: CLLocationCoordinate2D(latitude: end.latitude, longitude: end.longitude)
                        )
                    )
                default:
                    break
            }
        }
        return GeoData(
            routes: routes
        )
    }
}

extension GeoJsonLoader: GeoLoaderProtocol {
    func load() throws -> GeoData {
        guard let url = Bundle.main.url(forResource: self.geoJsonPath, withExtension: "geojson") else {
            throw NSError(domain: "cannot find asset", code: -1, userInfo: nil)
        }
        let data = try Data(contentsOf: url)
        let collection = try JSONDecoder().decode(FeatureCollection.self, from: data)
        return try parse(for: collection.features)
    }
}
