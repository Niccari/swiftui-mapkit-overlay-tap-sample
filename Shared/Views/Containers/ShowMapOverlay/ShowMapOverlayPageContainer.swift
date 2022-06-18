//
//  ShowMapOverlayPageContainer.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 19/05/2022.
//

import SwiftUI
import CoreLocation
import MapKit
import Verge

struct ShowMapOverlayPageContainer: View {
    let rootStore: RootStore

    var body: some View {
        StateReader(rootStore).content { state in
            if let geoData: GeoData = state.geoData {
                let northEast: CLLocationCoordinate2D = geoData.bounds.northEast
                let southWest: CLLocationCoordinate2D = geoData.bounds.southWest

                ShowMapOverlayPage(
                    initialRegion: MKCoordinateRegion(
                        center: CLLocationCoordinate2D(
                            latitude: (northEast.latitude + southWest.latitude ) / 2,
                            longitude: (northEast.longitude + southWest.longitude ) / 2
                        ),
                        span: MKCoordinateSpan(
                            latitudeDelta: (northEast.latitude - southWest.latitude ) * 1.2,
                            longitudeDelta: (northEast.longitude - southWest.longitude ) * 1.2
                        )
                    ),
                    styledPolylines: state.styledPolylines,
                    onPolylineTapped: { polyline in
                        rootStore.selectPolyline(polyline.id)
                    }
                )
            } else {
                LoadErrorViewContainer()
            }
        }
    }
}
