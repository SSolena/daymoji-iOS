//
//  EmojiLocation.swift
//  Daymoji
//
//  Created by Keunna Lee on 2021/03/14.
//

import MapKit

struct EmojiLocation: Identifiable {
    
    var id = UUID().uuidString
    let card: Card
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
