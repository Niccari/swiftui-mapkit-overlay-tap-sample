//
//  AreaViewModel.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 24/05/2022.
//

import Foundation
import UIKit
import MapKit

struct AreaViewModel {
    var id: String

    var polygon: MKPolygon

    var strokeColor: UIColor
    var strokeWidth: CGFloat
    var fillColor: UIColor
}
