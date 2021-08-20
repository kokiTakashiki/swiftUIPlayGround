//
//  MapView.swift
//  Landmarks
//
//  Created by 武田孝騎 on 2021/08/16.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordnate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordnate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordnate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
