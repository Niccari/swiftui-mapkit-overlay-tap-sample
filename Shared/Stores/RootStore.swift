//
//  RootStore.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 18/05/2022.
//

import CoreLocation
import Verge
import UIKit

enum ScreenStatus {
    case initial
    case showMapOverlay
    case loadError
}

final class RootStore: StoreComponentType {
    private let geoFeature: GeoFeature

    struct State: Equatable {
        var status: ScreenStatus = .initial
        var geoData: GeoData? = nil
        var geoOperations: [GeoOperationGroup] = []
        var styledPolylines: [StyledPolyline] = []
    }

    let store = DefaultStore(initialState: .init())

    init (geoFeature: GeoFeature) {
        self.geoFeature = geoFeature
    }

    func loadGeo() {
        if let geoData = geoFeature.load() {
            commit {
                $0.geoData = geoData
                $0.status = .showMapOverlay
            }
            addAll(geoData: geoData)
        } else {
            commit {
                $0.status = .loadError
            }
        }
    }

    func addAll(geoData: GeoData) {
        let operations = geoData.routes.map { route in
            GeoOperation(
                operation: .create,
                featureId: route.id
            )
        }
        let operationGroup = GeoOperationGroup(
            operations: operations
        )
        let styledPolylines = GeoPresentation.createPolylines(
            routes: geoData.routes,
            operations: operations
        )
        commit {
            $0.status = .showMapOverlay
            $0.styledPolylines = styledPolylines
            $0.geoOperations.append(operationGroup)
        }
    }

    func selectPolyline(_ id: String) {
        var styledPolylines = store.state.styledPolylines
        guard let index = styledPolylines.firstIndex(where: {
            polyline in polyline.id == id
        }) else { return }
        let item = styledPolylines[index]
        styledPolylines[index] = StyledPolyline(
            id: IssueId.issue(),
            points: item.points,
            strokeColor: item.strokeColor != UIColor.green ? UIColor.green : UIColor.yellow,
            lineWidth: item.lineWidth
        )

        commit {
            $0.styledPolylines = styledPolylines
            $0.geoOperations.append(GeoOperationGroup(
                operations: [
                    GeoOperation(
                        operation: .select,
                        featureId: id
                    )]
            ))
        }
    }

    func selectObject(by id: String) {
        commit {
            $0.geoOperations.append(GeoOperationGroup(
                operations: [
                    GeoOperation(
                        operation: .select,
                        featureId: id
                    )]
            ))
        }
    }

    func unselectObject() {
        commit {
            $0.geoOperations.append(GeoOperationGroup(
                operations: [
                    GeoOperation(
                        operation: .select,
                        featureId: nil
                    )]
            ))
        }
    }
}
