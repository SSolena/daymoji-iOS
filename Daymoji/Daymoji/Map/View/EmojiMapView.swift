//
//  EmojiMapView.swift
//  Daymoji
//
//  Created by Keunna Lee on 2021/03/14.
//

import SwiftUI
import CoreLocation
import MapKit

struct EmojiMapView: View {

    // map
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    @State private var currentLocation = CLLocationCoordinate2D()
    @State private var centerCoordinate = CLLocationCoordinate2D()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
}
