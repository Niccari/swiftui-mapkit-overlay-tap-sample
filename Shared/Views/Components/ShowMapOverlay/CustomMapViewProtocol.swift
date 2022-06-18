//
//  CustomMapViewProtocol.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 11/06/2022.
//

import MapKit

public protocol CustomMapViewProtocol {
  func didTapMKCircle(for mapView: MKMapView, of mkCircle: MKCircle)
  func didTapMKPolyline(for mapView: MKMapView, of mkPolyline: MKPolyline)
}
