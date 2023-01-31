//
//  ContentView.swift
//  maps-swiftui
//
//  Created by masaki on 2023/01/31.
//

import SwiftUI
import MapKit
import Combine
struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
    @State private var cancellable: AnyCancellable?
    
    func showLocation() {
        cancellable = locationManager.$locations.sink { (location) in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 2000, longitudinalMeters: 2000)
        }
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil)
        }.navigationBarTitle("Map swiftUI")
        .onAppear {
            showLocation()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
