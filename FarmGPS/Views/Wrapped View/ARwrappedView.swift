//
//  ARwrappedView.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import Foundation
import SwiftUI
import ARKit

struct ARViewWrapped: UIViewRepresentable{

    var am : AppManager

    func makeUIView(context: Context) -> some UIView {

        am.setupARView()
        return am.arView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}
