//
//  RouterContainer.swift
//  SwiftUIMapKitGISExample (iOS)
//
//  Created by Niccari on 18/05/2022.
//

import SwiftUI
import Verge

struct RouterContainer: View {
    private let rootStore = AppContainer.shared.rootStore

    var body: some View {
        StateReader(rootStore).content { state in
            switch state.status {
                case .initial:
                    InitialViewContainer()
                case .showMapOverlay:
                    ShowMapOverlayPageContainer(rootStore: rootStore)
                case .loadError:
                    LoadErrorViewContainer()
            }
        }
    }
}
