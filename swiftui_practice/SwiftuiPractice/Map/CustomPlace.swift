//
//  CustomPlace.swift
//  SwiftUIPractice
//
//  Created by Koichi Kishimoto on 2023/03/28.
//

import SwiftUI
import MapKit

struct CustomPlace: Identifiable {
    let coordinate: CLLocationCoordinate2D
    let id = UUID()
}

//指定した地点にマーカーを表示する
struct CustomPlaceView: View {
    @State var coordinateRegion = MKCoordinateRegion(
//        市ヶ谷駅の緯度経度
        center: CLLocationCoordinate2D(latitude: 35.69193, longitude: 139.736254), latitudinalMeters: 10000, longitudinalMeters: 10000
    )
    
    var body: some View {
        Map(
            coordinateRegion: $coordinateRegion,
            annotationItems: [
                CustomPlace(coordinate: CLLocationCoordinate2D(latitude: 35.7301896, longitude: 139.7150302)),
                CustomPlace(coordinate: CLLocationCoordinate2D(latitude: 35.6983223, longitude: 139.7730186)),
                CustomPlace(coordinate: CLLocationCoordinate2D(latitude: 35.6291112, longitude: 139.7389313)),
            ],
            annotationContent: {
                item in MapMarker(coordinate: item.coordinate, tint: Color.blue)
            }
        )
    }
}

struct CustomPlace_Previews: PreviewProvider {
    static var previews: some View {
        CustomPlaceView()
    }
}
