//
//  MKPolygon.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 11/06/2022.
//

import Foundation
import MapKit

extension MKPolyline {
    func contains(_ coordinate2D: CLLocationCoordinate2D,
                  with strokeWidth: CGFloat) -> Bool {

        let renderer = MKPolylineRenderer(polyline: self)
        let currentMapPoint: MKMapPoint = MKMapPoint(coordinate2D)
        let viewPoint: CGPoint = renderer.point(for: currentMapPoint)
        if renderer.path == nil {
            return false
        } else {
            let path = renderer.path.copy(
                strokingWithWidth: strokeWidth,
                lineCap: .round,
                lineJoin: .round,
                miterLimit: .greatestFiniteMagnitude
            )
            return path.contains(viewPoint)
        }
    }
}
