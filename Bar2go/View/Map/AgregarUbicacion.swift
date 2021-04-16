//
//  AgregarUbicacion.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 21/3/21.
//  Extraido de https://www.hackingwithswift.com/books/ios-swiftui/advanced-mkmapview-with-swiftui

import SwiftUI
import MapKit

struct AgregarUbicacion: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: AgregarUbicacion

        init(_ parent: AgregarUbicacion) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
}
