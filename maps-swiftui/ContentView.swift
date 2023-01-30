//
//  ContentView.swift
//  maps-swiftui
//
//  Created by masaki on 2023/01/31.
//

import SwiftUI
import MapKit
struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
        }.navigationBarTitle("Map swiftUI")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
