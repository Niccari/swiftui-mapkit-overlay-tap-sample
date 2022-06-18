//
//  StyledPolyline.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 19/05/2022.
//

import Foundation
import UIKit
import MapKit

struct StyledPolyline: Equatable, Identifiable {
    var id: String

    var points: [CLLocationCoordinate2D]
    var strokeColor: UIColor
    var lineWidth: CGFloat

    static func == (lhs: StyledPolyline, rhs: StyledPolyline) -> Bool {
        lhs.id == rhs.id
        && lhs.strokeColor == rhs.strokeColor
        && lhs.lineWidth == rhs.lineWidth
    }
}
