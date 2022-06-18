//
//  AppContainer.swift
//  carTrashDetector (iOS)
//
//  Created by Niccari on 2022/05/28.
//

import SwiftUI

class AppContainer {
    static let shared = AppContainer()

    let rootStore: RootStore

    private let geoJsonLoader: GeoLoaderProtocol
    let geoFeature: GeoFeature

    init() {
        geoJsonLoader = GeoJsonLoader(geoJsonPath: "sample")
        geoFeature = GeoFeature(geoLoader: geoJsonLoader)
        rootStore = RootStore(geoFeature: geoFeature)
//        captureStore.launch()
        rootStore.loadGeo()
    }
}
