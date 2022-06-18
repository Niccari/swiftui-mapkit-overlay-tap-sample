//
//  GeoEditOperation.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 04/06/2022.
//

import Foundation

enum GeoEditOperand {
    case selectPoint
    case selectRoute
    case selectArea
}

struct GeoEditOperation: Equatable {
    var id: String
    var operand: GeoEditOperand
    var geoObjectId: String

    static func == (lhs: GeoEditOperation, rhs: GeoEditOperation) -> Bool {
        lhs.id == rhs.id
    }
}
