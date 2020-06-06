//
//  NewMapView.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/5/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI
import MapKit

struct NewMapView: UIViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    
    class NewMapViewCoordinator : NSObject, MKMapViewDelegate{
        
        var mapView: NewMapView
        
        init(_ mapView: NewMapView){
            self.mapView = mapView
        }
        
        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
            print()
        }
        
        
    }
    
    func makeCoordinator() -> NewMapViewCoordinator {
        NewMapViewCoordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView =  MKMapView()
        
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<NewMapView>) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: self.coordinate, span: span)
        //let marker = MKAnnotation(coordinate: coordinate)
        // S etiene q crear una clase
        uiView.setRegion(region, animated: true)
    }
    
}


