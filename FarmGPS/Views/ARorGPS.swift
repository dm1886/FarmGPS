//
//  ARorGPS.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import SwiftUI

struct ARorGPS: View {
    @ObservedObject var am : AppManager
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack{
                Button(action: {
                    am.viewToShow = .gpsTrack
                }) {
                    Text("Navigation")
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .shadow(color: .blue, radius: 2)
                        )
                }.padding(.horizontal)
                Button(action: {
                    am.viewToShow = .ar
                }) {
                    Text("AR Garden")
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                                .shadow(color: .blue, radius: 2)
                        )
                }.padding(.horizontal)
            }
        }
    }
}

struct ARorGPS_Previews: PreviewProvider {
    static var previews: some View {
        ARorGPS(am: AppManager())
    }
}
