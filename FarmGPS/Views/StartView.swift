//
//  ContentView.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import SwiftUI

struct StartView: View {
    @StateObject var am = AppManager()
    var body: some View {
        
        switch am.viewToShow {
        case .starting :
            ARorGPS(am: am)
        case .ar:
            ARView(am: am)
        case .gpsTrack:
            GPSNavigationView(am: am)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
