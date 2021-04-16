//
//  Prueba.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 10/4/21.
//

import SwiftUI
import Combine
import MapKit
import Firebase

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
    }
}

struct CardBar: View {
    var bar: BarModel
    @Binding var activeSheet: ActiveSheet?
    @Binding var miBar: BarModel
    @State var confirmaReserva1 = false
    @State var confirmaReserva2 = false
    @State var confirmaReserva3 = false
    @State var confirmaReserva4 = false
    
    @StateObject var userLocation = UserLocation()
    @State private var cancelable: AnyCancellable?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.21, longitude: 120.50),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    @State private var prueba: Data? = nil
    
    @StateObject var speech: SpeechViewModel
    
    @StateObject var bares: BarViewModel
    
    var nombre: String? = nil
    var tipo: String? = nil
    
    @State var tipoBusqueda: TipoBusqueda? = nil
    
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
        HStack(alignment: .center) {
            ImagenStorageView(imageURL: bar.dirImagen, anchura: 80, altura: 80)
                .padding(.all)
                .alert(isPresented:$confirmaReserva1) {
                    let num = UserDefaults.standard.integer(forKey: "numPersonas")
                    //let idUser = Auth.auth().currentUser?.uid
                    return Alert(
                        title: Text(num == 1 ? ("¿Seguro que quieres realizar la reserva para 1 persona, en el turno 1 y en el bar " + bar.nombre + " ?") : ("¿Seguro que quieres realizar la reserva para " + String(num) + " personas, en el turno 1 y en el bar " + bar.nombre + "?")),
                        primaryButton: .default(Text("Reservar")) {
                            let correcto = bares.reservaMesa(tam: num, miBar: bar, turno: "1")
                            //bares.reservaPorUsuario(idUser: idUser ?? "", tam: num, idBar: bar.id, turno: "1")
                            
                            if correcto {
                                print("Reserva realizada correctamente")
                            } else {
                                print("La reserva no se ha realizado correctamente")
                            }
                            
                            activeSheet = nil
                            obtenerBares()
                        },
                        secondaryButton: .cancel(Text("Cancelar"))
                    )
                }
                
            
            VStack(alignment: .leading) {
                Text(bar.nombre)
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .alert(isPresented:$confirmaReserva2) {
                        let num = UserDefaults.standard.integer(forKey: "numPersonas")
                        
                        return Alert(
                            title: Text(num == 1 ? ("¿Seguro que quieres realizar la reserva para 1 persona, en el turno 2 y en el bar " + bar.nombre + " ?") : ("¿Seguro que quieres realizar la reserva para " + String(num) + " personas, en el turno 2 y en el bar " + bar.nombre + "?")),
                            primaryButton: .default(Text("Reservar")) {
                                let correcto = bares.reservaMesa(tam: num, miBar: bar, turno: "2")
                                
                                if correcto {
                                    print("Reserva realizada correctamente")
                                } else {
                                    print("La reserva no se ha realizado correctamente")
                                }
                                
                                activeSheet = nil
                                obtenerBares()
                            },
                            secondaryButton: .cancel(Text("Cancelar"))
                        )
                    }
                
                Text(bar.tipo)
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.black)
                    .alert(isPresented:$confirmaReserva3) {
                        let num = UserDefaults.standard.integer(forKey: "numPersonas")
                        
                        return Alert(
                            title: Text(num == 1 ? ("¿Seguro que quieres realizar la reserva para 1 persona, en el turno 3 y en el bar " + bar.nombre + " ?") : ("¿Seguro que quieres realizar la reserva para " + String(num) + " personas, en el turno 3 y en el bar " + bar.nombre + "?")),
                            primaryButton: .default(Text("Reservar")) {
                                let correcto = bares.reservaMesa(tam: num, miBar: bar, turno: "3")
                                
                                if correcto {
                                    print("Reserva realizada correctamente")
                                } else {
                                    print("La reserva no se ha realizado correctamente")
                                }
                                
                                activeSheet = nil
                                obtenerBares()
                            },
                            secondaryButton: .cancel(Text("Cancelar"))
                        )
                    }
                
                HStack() {
                    Button(action:{
                        if speech.synthesizer.isSpeaking {
                            speech.synthesizer.stopSpeaking(at: .immediate)
                        }
                        
                        miBar = bar
                        activeSheet = .ubicacion
                    }){
                        VStack {
                            Text("Localiz.")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.black)
                            
                            Image(systemName: "map")
                                .foregroundColor(.black)
                        }.padding(.top, 8)
                        .alert(isPresented:$confirmaReserva4) {
                            let num = UserDefaults.standard.integer(forKey: "numPersonas")
                            
                            return Alert(
                                title: Text(num == 1 ? ("¿Seguro que quieres realizar la reserva para 1 persona, en el turno 4 y en el bar " + bar.nombre + " ?") : ("¿Seguro que quieres realizar la reserva para " + String(num) + " personas, en el turno 4 y en el bar " + bar.nombre + "?")),
                                primaryButton: .default(Text("Reservar")) {
                                    let correcto = bares.reservaMesa(tam: num, miBar: bar, turno: "4")
                                    
                                    if correcto {
                                        print("Reserva realizada correctamente")
                                    } else {
                                        print("La reserva no se ha realizado correctamente")
                                    }
                                    
                                    activeSheet = nil
                                    obtenerBares()
                                },
                                secondaryButton: .cancel(Text("Cancelar"))
                            )
                        }
                    }
                    
                    Spacer()
                    
                    Button(action:{
                        if speech.synthesizer.isSpeaking {
                            speech.synthesizer.stopSpeaking(at: .immediate)
                        }
                        
                        miBar = bar
                        activeSheet = .estado
                    }){
                        VStack {
                            Text("Estado")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.black)
                            
                            Image(systemName: "tablecells")
                                .foregroundColor(.black)
                        }.padding(.top, 8)
                    }
                    
                    Spacer()
                    
                    Menu {
                        Button(action:{
                            confirmaReserva1 = true
                        }){
                            HStack(spacing: 24){
                                Text("Turno 1 -> 14:00")
                                    .font(.headline)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .disabled(UserDefaults.standard.integer(forKey: "numPersonas") > bar.capacidadTurno[fechaMañana]!["1"]!)
                        
                        Button(action:{
                            confirmaReserva2 = true
                        }){
                            HStack(spacing: 24){
                                Text("Turno 2 -> 15:15")
                                    .font(.headline)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .disabled(UserDefaults.standard.integer(forKey: "numPersonas") > bar.capacidadTurno[fechaMañana]!["2"]!)
                        
                        
                        Button(action:{
                            confirmaReserva3 = true
                        }){
                            HStack(spacing: 24){
                                Text("Turno 3 -> 21:00")
                                    .font(.headline)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .disabled(UserDefaults.standard.integer(forKey: "numPersonas") > bar.capacidadTurno[fechaMañana]!["3"]!)
                        
                        
                        Button(action:{
                            confirmaReserva4 = true
                        }){
                            HStack(spacing: 24){
                                Text("Turno 4 -> 22:30")
                                    .font(.headline)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .disabled(UserDefaults.standard.integer(forKey: "numPersonas") > bar.capacidadTurno[fechaMañana]!["4"]!)
                        
                
                        
                    } label: {
                        VStack {
                            Text("Reserva")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.black)
                            
                            Image(systemName: "book")
                                .foregroundColor(.black)
                        }.padding(.top, 8)
                    }.onTapGesture {
                        if speech.synthesizer.isSpeaking {
                            speech.synthesizer.stopSpeaking(at: .immediate)
                        }
                    }
                }
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("card"))
        .modifier(CardModifier())
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("navbar"), lineWidth: 1)
        )
        .padding(.all, 10)
    }
}
