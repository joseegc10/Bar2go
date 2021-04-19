//
//  ListaBares.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 23/3/21.
//

import SwiftUI
import Combine
import MapKit
import Firebase

enum ActiveSheet: Identifiable {
    case ubicacion, estado
    
    var id: Int {
        hashValue
    }
}

enum TipoBusqueda: Identifiable {
    case nombre, tipo, distancia, baresUsuario, reservasUsuario
    
    var id: Int {
        hashValue
    }
}

struct ListaBares: View {
    @StateObject var bares = BarViewModel()
    @State var activeSheet: ActiveSheet? = nil
    @State var activeSheet2: ActiveSheet2? = nil
    @State var tipoBusqueda: TipoBusqueda? = nil
    var nombre: String? = nil
    var tipo: String? = nil
    @Binding var index: String
    @State private var miBar = BarModel()
    
    @StateObject var userLocation = UserLocation()
    @State private var cancelable: AnyCancellable?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.21, longitude: 120.50),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    @Binding var barEditar: BarModel
    
    @State var reservas: [String:[Int:Int]] = [:]
    
    @StateObject var speech: SpeechViewModel
    
    func showLocation(){
        cancelable = userLocation.$locations.sink { (location) in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 2000, longitudinalMeters: 2000)
        }
    }
    
    func obtenerBares(){
        switch tipoBusqueda {
        case .nombre:
            bares.obtenerBaresNombre(nombreBuscado: nombre!)
        case .tipo:
            bares.obtenerBaresTipo(tipo: tipo!)
        case .distancia:
            showLocation()
            bares.obtenerBaresDistancia(userLat: region.center.latitude, userLong: region.center.longitude)
        case .baresUsuario:
            bares.obtenerBaresUsuario()
        case .reservasUsuario:
            bares.obtenerBaresConReservasUsuario()
        default:
            bares.obtenerBares()
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: -40), count: 1), spacing: -20){
                ForEach(bares.bares, id: \.self.id){ bar in
                    CardBar(bar: bar, activeSheet: $activeSheet, miBar: $miBar, speech: speech, bares: bares, nombre: nombre, tipo: tipo, tipoBusqueda: tipoBusqueda)
                        .onTapGesture {
                            guard let idUser = Auth.auth().currentUser?.uid else { return }
                            
                            if idUser == bar.idUser {
                                index = "editar"
                                barEditar = bar
                            } else {
                                if speech.synthesizer.isSpeaking {
                                    speech.synthesizer.stopSpeaking(at: .immediate)
                                } else {
                                    let texto: String = "El bar se llama " + bar.nombre + ", el cual" + bar.descripcion + ". En " + bar.nombre + "el tipo de comida que se sirve es " + bar.tipo
                                    
                                    speech.speak(speech: texto)
                                }
                            }
                        }.sheet(item: $activeSheet) { item in
                            switch item {
                            case .ubicacion:
                                ZStack{
                                    Color("fondo").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    MostrarUbicacion(bar: $miBar, activeSheet: $activeSheet, activeSheet2: $activeSheet2)
                                }
                            case .estado:
                                ZStack{
                                    Color("fondo").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    
                                    ScrollView{
                                        VStack{
                                            if reservas["1"] == nil && reservas["2"] == nil && reservas["3"] == nil && reservas["4"] == nil {
                                                
                                                Text("No hay ninguna reserva")
                                                    .font(.title)
                                                    .padding(.top, UIScreen.main.bounds.height/2.5)
                                                
                                                Text("para el día de hoy")
                                                    .font(.title)
                                            } else {
                                                if reservas["1"] != nil {
                                                    EstadoBar(huecosOcupados: reservas["1"]!, turno: "1")
                                                }
                                                
                                                if reservas["2"] != nil {
                                                    EstadoBar(huecosOcupados: reservas["2"]!, turno: "2")
                                                }
                                                
                                                if reservas["3"] != nil {
                                                    EstadoBar(huecosOcupados: reservas["3"]!, turno: "3")
                                                }
                                                
                                                if reservas["4"] != nil {
                                                    EstadoBar(huecosOcupados: reservas["4"]!, turno: "4")
                                                }
                                            }
                                        }.onAppear{
                                            bares.obtenerReservasBar(idBar: miBar.id){ (res) in
                                                reservas = res
                                            }
                                        }
                                    }
                                }
                            }
                        }
                }
            }
        }.onAppear{
            obtenerBares()
        }
        .onChange(of: activeSheet) {_ in
            if activeSheet == nil {
                obtenerBares()
            }
        }
        .onTapGesture {
            if speech.synthesizer.isSpeaking {
                speech.synthesizer.stopSpeaking(at: .immediate)
            }
        }
    }
}
