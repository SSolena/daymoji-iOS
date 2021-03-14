//
//  MapViewModel.swift
//  Daymoji
//
//  Created by Keunna Lee on 2021/03/14.
//

import Foundation

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var mapView = MKMapView()
}
