//
//  MostrarUbicacion.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 21/3/21.
//

import SwiftUI
import MapKit
import Combine

struct Place: Identifiable {
let id = UUID()
let name: String
let latitude: Double
let longitude: Double
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

struct MostrarUbicacion: View {
    @Binding var bar: BarModel

    @State private var places: [Place] = []

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.21, longitude: 120.50),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    @Binding var activeSheet: ActiveSheet?
    @Binding var activeSheet2: ActiveSheet2?
    
    func cambiaLocalizacion(){
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: bar.lat, longitude: bar.long),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
        
        places = [Place(name: bar.nombre, latitude: bar.lat, longitude: bar.long)]
    }

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true,  annotationItems: places){ place in
            MapPin(coordinate: place.coordinate)
        }.edgesIgnoringSafeArea(.all)
        .onAppear{
            cambiaLocalizacion()
        }
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    activeSheet = nil
                    activeSheet2 = nil
                }) {
                    Image(systemName: "arrow.down")
                }
                .padding()
                .background(Color.black.opacity(0.75))
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.trailing)
            }
        }
    }
}

