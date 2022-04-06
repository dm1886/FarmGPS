//
//  ARGameScene.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import Foundation
import SceneKit
import CoreLocation
import SwiftUI
import simd
import ARKit

class ARGameScene: SCNScene,ARSessionDelegate, ARSCNViewDelegate{

    /// # Focus Square
    var focusSquare = FocusSquare()
    var arView : ARSCNView // the view contain the scene self
    
    init(arView: ARSCNView) {
        
        self.arView = arView
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //DELEGATE Methods
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async {
            self.updateFocusSquare()
        }
    }
    
    func updateFocusSquare() {
        
       

        
        if let camera = arView.session.currentFrame?.camera, case .normal = camera.trackingState,
           let query = arView.getRaycastQuery(),
           let result = arView.castRay(for: query).first {
            
            DispatchQueue.global().async {
                self.rootNode.addChildNode(self.focusSquare)
                self.focusSquare.state = .detecting(raycastResult: result, camera: camera)
            }
            
        } else {
            DispatchQueue.global().async {
                self.focusSquare.state = .initializing
                self.arView.pointOfView?.addChildNode(self.focusSquare)
            }
        }
    }
}
