//
//  ARView.swift
//  FarmGPS
//
//  Created by Damiano Miazzi on 05/04/2022.
//

import SwiftUI

struct ARView: View {
    @ObservedObject var am : AppManager
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ARViewWrapped(am: am)
            
            
                .overlay{
                    Button(action: {
                        am.viewToShow = .starting
                    }) {
                        Text("BACK")
                            .padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 2.0)
                                    .shadow(color: .blue, radius: 2)
                            )
                    }.padding(.horizontal)
                }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView(am: AppManager())
    }
}
