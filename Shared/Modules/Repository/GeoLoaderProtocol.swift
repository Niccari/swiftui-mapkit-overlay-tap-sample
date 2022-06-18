//
//  GeoLoaderProtocol.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 28/05/2022.
//

import Foundation

protocol GeoLoaderProtocol {
    func load() throws -> GeoData
}
