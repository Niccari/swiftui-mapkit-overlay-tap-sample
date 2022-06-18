//
//  OverlayViewModel.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 05/06/2022.
//

import Foundation

struct OverlayViewModel: Equatable {
    var routes: [RouteViewModel]
    var areas: [RouteViewModel]

    static func == (lhs: OverlayViewModel, rhs: OverlayViewModel) -> Bool {
        <#code#>
    }
}
