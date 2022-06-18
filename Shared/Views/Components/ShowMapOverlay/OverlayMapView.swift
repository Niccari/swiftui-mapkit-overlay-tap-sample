//
//  OverlayMapView.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 19/05/2022.
//

import SwiftUI
import MapKit

struct OverlayMapView: UIViewRepresentable {
    let initialRegion: MKCoordinateRegion
    let styledPolylines: [StyledPolyline]
    let onPolylineTapped: ((StyledPolyline) -> Void)?

    let mapView = MKMapView()

    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.region = initialRegion

        let gesture = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.tapped)
        )
        mapView.addGestureRecognizer(gesture)

        return mapView
    }

    func makeCoordinator() -> Coordinator {
      Coordinator(self)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // TODO: differential update
        for route in styledPolylines {
//            let styledOverlay = getStyledOverlay(for: route.id)
//            if (styledOverlay != nil) {
//                continue
//            }
            let polyline = MKPolyline(
                coordinates: route.points,
                count: route.points.count
            )
            polyline.title = route.id
            mapView.addOverlay(polyline)
            let circle = MKCircle(
                center: route.points[0],
                radius: 10
            )
            circle.title = route.id + "a"
            mapView.addOverlay(circle)
        }
    }

    private func getStyledOverlay(for id: String) -> StyledPolyline? {
        return styledPolylines.first(where: { candidate in candidate.id == id })
    }
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: OverlayMapView

    init(_ parent: OverlayMapView) {
        self.parent = parent
    }

    @objc func tapped(gesture: UITapGestureRecognizer) {
        let touchLocation = gesture.location(in: gesture.view)
        let mapView = self.parent.mapView

        let locationCoordinate = mapView.convert(
            touchLocation, toCoordinateFrom: mapView.self)

        var mkCircleList: [MKCircle] = mapView.overlays.compactMap { $0 as? MKCircle }
        mkCircleList = mkCircleList.filter { $0.contains(locationCoordinate) }
        if let mkCircle = mkCircleList.first {
//            didTapDelegate?.didTapMKCircle(for: mapView, of: mkCircle)
            return
        }

        var mkPolylineList: [MKPolyline] = mapView.overlays.compactMap { $0 as? MKPolyline }
        mkPolylineList = mkPolylineList.filter { $0.contains(locationCoordinate, with: 30.0) }
        if let mkPolyline = mkPolylineList.first {
            if let route = parent.styledPolylines.first(where: { candidate in candidate.id == mkPolyline.title }) {
                parent.onPolylineTapped?(route)
                let renderer = mapView.renderer(for: mkPolyline) as! MKPolylineRenderer
                renderer.invalidatePath()
                renderer.strokeColor = UIColor.yellow
            }
            return
        }
    }
}

// MARK: MKMapViewDelegate
extension Coordinator {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            if let route = parent.styledPolylines.first(where: { candidate in candidate.id == routePolyline.title }) {
                renderer.strokeColor = route.strokeColor
                renderer.lineWidth = route.lineWidth
                return renderer
            }
        }
        return MKOverlayRenderer()
    }
}
