//
//  AppManager.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import Foundation
import SceneKit
import SwiftUI
import CoreLocation
import MapKit
import ARKit


class AppManager:NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate  {
    
    var arView = ARSCNView()
    var arScene : ARGameScene?
    var sceneView = SCNView()
    var scene : GameScene?
    var sceneTest = SCNScene()
    var map = MKMapView()
    var CLmanager = CLLocationManager()
    
    
    //app stage
    @Published var appstage : AppStage = .starting
    
    @Published var viewToShow : ViewToShow = .starting
    
    override init() {
        super.init()
        startInt()
        
    }
    
    
    func startInt(){
        arScene = ARGameScene(arView: arView)
        scene = GameScene(sceneView: sceneView)
    }
    
    
    //Scenekit setup
    func setupView(){
        guard let scene = scene else {
            return
        }

        sceneView.backgroundColor = .black
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = false
        sceneView.showsStatistics = true
        sceneView.scene = scene
        sceneView.delegate = scene.self
        sceneView.scene?.isPaused = false
        sceneView.rendersContinuously = true
        sceneView.debugOptions = []
        
    }
  
    
    // ARkit setup
    
    func setupARView() {
        guard let arScene = arScene else {
            return
        }

        arView.scene = arScene
        guard ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
            print("People occlusion is not supported on this device.")
            return
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapAR))
        arView.addGestureRecognizer(tap)
        let configuration = ARWorldTrackingConfiguration()
        configuration.frameSemantics.insert(.personSegmentationWithDepth)
        configuration.isAutoFocusEnabled = true
        configuration.planeDetection = [.horizontal]
        arView.autoenablesDefaultLighting = true
        arView.debugOptions = [.showWorldOrigin]
        arView.showsStatistics = true
        arView.session.delegate = arScene.self
        arView.delegate = arScene.self
        arView.session.run(configuration, options: .resetSceneReconstruction)
        
    }
    // MARK: AR STUFF
    @objc func handleTapAR(sender: UITapGestureRecognizer) {
        print("tapped")
    }
    
    // MARK: CORE LOCATION STUFF
    func setupCoreLocation (){
        CLmanager.delegate = self
        CLmanager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        reqAuth()
        CLmanager.startUpdatingLocation()
        CLmanager.startUpdatingHeading()
        
        
    }
    
    func reqAuth() {
        if CLmanager.authorizationStatus == .notDetermined || CLmanager.authorizationStatus == .restricted || CLmanager.authorizationStatus == .denied {
            CLmanager.requestAlwaysAuthorization()
        }
    }
  
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        case .authorizedAlways :
            print("always auth")
          
        case .notDetermined:
            print("Not Det")
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("Restrict")
            manager.requestWhenInUseAuthorization()
        case .denied:
            print("Denied")
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            print("when in use")
            
        @unknown default:
            print("Default")
        }
    }
}
