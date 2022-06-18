//
//  MKCircle.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 11/06/2022.
//

import Foundation
import MapKit

extension MKCircle {
    func contains(_ coordinate2D: CLLocationCoordinate2D) -> Bool {
        let renderer = MKCircleRenderer(circle: self)
        let currentMapPoint: MKMapPoint = MKMapPoint(coordinate2D)
        let viewPoint: CGPoint = renderer.point(for: currentMapPoint)
        if renderer.path == nil {
            return false
        } else {
            return renderer.path.contains(viewPoint)
        }
    }
}
