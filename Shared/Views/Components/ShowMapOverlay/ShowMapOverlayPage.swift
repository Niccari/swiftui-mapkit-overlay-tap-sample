//
//  ShowMapOverlayPage.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 11/06/2022.
//

import SwiftUI
import CoreLocation
import Verge
import Map
import MapKit

struct ShowMapOverlayPage: View {
    let styledPolylines: [StyledPolyline]
    let onPolylineTapped: ((StyledPolyline) -> Void)?
    private let annotationItems: [StyledPolyline] = []

    @State var initialRegion: MKCoordinateRegion

    init (
        initialRegion: MKCoordinateRegion,
        styledPolylines: [StyledPolyline],
        onPolylineTapped: ((StyledPolyline) -> Void)?
    ) {
        self.styledPolylines = styledPolylines
        self.onPolylineTapped = onPolylineTapped
        self.initialRegion = initialRegion
    }

    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $initialRegion,
                annotationItems: annotationItems,
                annotationContent: {_ in
                    // never called
                    MapPin(
                        coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0),
                        tint: .red
                    )
                },
                overlayItems: styledPolylines,
                overlayContent: { styled in
                    MapPolyline(
                        polyline: MKPolyline(
                            coordinates: styled.points,
                            count: styled.points.count
                        ),
                        level: nil,
                        strokeColor: styled.strokeColor,
                        lineWidth: styled.lineWidth
                    )
                },
                onOverlayTapped: { item in
                    print(item)
                    onPolylineTapped?(item)
                }
            )
        }
    }
}
