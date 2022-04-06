//
//  MapView.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var am : AppManager
    
    func makeUIView(context: Context) -> some UIView {
        
        return am.map
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
