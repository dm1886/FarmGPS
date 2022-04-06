//
//  GameScene.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import Foundation
import SceneKit
import CoreLocation
import SwiftUI
import simd

class GameScene: SCNScene, SCNSceneRendererDelegate, SCNPhysicsContactDelegate{

    var sceneView : SCNView
    
    init(sceneView: SCNView) {
        self.sceneView = sceneView
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
