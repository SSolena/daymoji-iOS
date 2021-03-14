//
//  MapView.swift
//  Daymoji
//
//  Created by Keunna Lee on 2021/03/14.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapData: MapViewModel
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var currentLocation : CLLocationCoordinate2D
    private let action: (() -> Void)?
    var annotations: [MKPointAnnotation]
    
    // MARK: - Initializer
    init(
        centerCoordinate: Binding<CLLocationCoordinate2D>,
        currentLocation : Binding<CLLocationCoordinate2D>,
        annotations: [MKPointAnnotation],
        action: (() -> Void)? = nil
    ) {
        self._centerCoordinate = centerCoordinate
        self._currentLocation = currentLocation
        self.annotations = annotations
        self.action = action
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self, action: action)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let view = mapData.mapView
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        view.showsUserLocation = true
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        var parent: MapView
        private let action: (() -> Void)?
        
        init(_ parent: MapView, action: (() -> Void)? = nil) {
            self.parent = parent
            self.action = action
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            action?()
            
            guard let customMapView = mapView as? MapView else { return }

        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "PlaceMark"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                let pinImage = #imageLiteral(resourceName: "emoji_heart")
                let size = CGSize(width: 50, height: 50)
                UIGraphicsBeginImageContext(size)
                pinImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
                let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
                
                annotationView?.image = resizedImage
                annotationView?.canShowCallout = true
                
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard (view.annotation as? MKPointAnnotation) != nil else {return}
        }
    }
}
