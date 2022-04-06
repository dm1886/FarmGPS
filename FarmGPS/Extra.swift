//
//  Extra.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import Foundation
import SceneKit
import CoreLocation
import SwiftUI


// App Stage


enum AppStage {
    case starting
    case accurrencyCK
    case savelocation
    case work
}


enum ViewToShow {
    case starting
    case ar
    case gpsTrack
}
