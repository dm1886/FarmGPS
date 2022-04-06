//
//  SceneKitView.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import Foundation
import SceneKit
import SwiftUI


struct SceneKitView: UIViewRepresentable{
    
    var am : AppManager
    
    func makeUIView(context: Context) -> some UIView {
        
        am.setupView()
        return am.sceneView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
