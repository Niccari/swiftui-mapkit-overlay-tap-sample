//
//  GeoOperation.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 05/06/2022.
//

import Foundation

enum GeoOperationKind {
    case create
    case select
}

struct GeoOperation: Equatable {
    var id: String
    var operation: GeoOperationKind
    var featureId: String?

    init (operation: GeoOperationKind, featureId: String?) {
        self.id = IssueId.issue()
        self.operation = operation
        self.featureId = featureId
    }
}

struct GeoOperationGroup: Equatable {
    var id: String
    var operations: [GeoOperation]

    init (operations: [GeoOperation]) {
        self.id = IssueId.issue()
        self.operations = operations
    }
}
