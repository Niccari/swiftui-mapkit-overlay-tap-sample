//
//  IssueId.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 05/06/2022.
//

import Foundation

class IssueId {
    private static let issuer = UUID()
    public static func issue() -> String {
        return UUID().uuidString
    }
}
