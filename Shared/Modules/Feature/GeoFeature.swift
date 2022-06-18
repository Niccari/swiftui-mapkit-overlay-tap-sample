//
//  GeoFeature.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 28/05/2022.
//

import Foundation

class GeoFeature {
    private let geoLoader: GeoLoaderProtocol

    init (geoLoader: GeoLoaderProtocol) {
        self.geoLoader = geoLoader
    }

    func load() -> GeoData? {
        do {
            return try self.geoLoader.load()
        } catch {
            return nil
        }
    }
}
