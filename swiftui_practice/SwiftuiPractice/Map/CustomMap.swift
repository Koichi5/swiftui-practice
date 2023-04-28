//
//  CustomMap.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/28.
//

import SwiftUI
import MapKit

struct CustomMap: View {
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2DMake(35.6809591, 139.7673068), latitudinalMeters: 1000, longitudinalMeters: 1000)
    var body: some View {
        Map(
            coordinateRegion: $coordinateRegion, interactionModes: .all).ignoresSafeArea()
    }
}

struct CustomMap_Previews: PreviewProvider {
    static var previews: some View {
        CustomMap()
    }
}
