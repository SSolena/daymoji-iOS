//
//  MKPointAnnotation.swift
//  Daymoji
//
//  Created by Keunna Lee on 2021/03/14.
//

import Foundation
import MapKit

// dummy data
extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "좋은 날씨"
        annotation.subtitle = "레나"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.532600, longitude: 127.034612)
        return annotation
    }
}

