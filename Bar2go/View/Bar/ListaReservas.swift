//
//  ListaReservas.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 9/4/21.
//

import SwiftUI
import Combine
import MapKit
import Firebase

enum ActiveSheet2: Identifiable {
    case ubicacion
    
    var id: Int {
        hashValue
    }
}

struct ListaReservas: View {
    @StateObject var bares = BarViewModel()
    
    @State var miReserva: ReservaModel = ReservaModel(id: "", idUser: "", bar: BarModel(), tam: 0, turno: "", fecha: "")
    
    @State var actualiza: Bool = false
    @State var activeSheet: ActiveSheet? = nil
    @State var activeSheet2: ActiveSheet2? = nil
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 1), spacing: 0){
                ForEach(bares.reservas, id: \.self.id){ reserva in
                    ReservaCardBar(reserva: reserva, actualiza: $actualiza, activeSheet: $activeSheet2, miReserva: $miReserva)
                        .onTapGesture {
                            miReserva = reserva
                        }.sheet(item: $activeSheet2) { item in
                            switch item {
                            case .ubicacion:
                                ZStack{
                                    Color("fondo").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    MostrarUbicacion(bar: $miReserva.bar, activeSheet: $activeSheet, activeSheet2: $activeSheet2)
                                }
                            }
                        }
                        .padding(.all)
                }
            }
        }.onAppear{
            bares.obtenerReservasUsuario()
        }
        .onChange(of: actualiza) {_ in
            bares.obtenerReservasUsuario()
        }
    }
}
