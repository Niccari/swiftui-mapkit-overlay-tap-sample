//
//  CustomMapView.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Kuki Masato on 11/06/2022.
//

import MapKit

public class MapView: MKMapView {

    public var didTapDelegate: CustomMapViewProtocol?

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        super.touchesEnded(touches, with: event)
    }
}
