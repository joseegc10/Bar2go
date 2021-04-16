//
//  ReservaCardBar.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 9/4/21.
//

import SwiftUI

struct ReservaCardBar: View {
    @State var reserva: ReservaModel
    let turnoHoras = ["1":"14:00","2":"15:15","3":"21:00","4":"22:30"]
    
    @Binding var actualiza: Bool
    @Binding var activeSheet: ActiveSheet2?
    
    @State private var cancelar = false
    
    @StateObject var bares = BarViewModel()
    
    @Binding var miReserva: ReservaModel
    
    var body: some View {
        HStack(spacing: 15){
            VStack(spacing: 10){
                VStack{
                    Text(reserva.bar.nombre)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    Text(reserva.bar.tipo)
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                }
                
                Divider()
                
                Text("\(String(reserva.tam)) personas | \(String(turnoHoras[reserva.turno]!)) | \(reserva.fecha)")
                    .font(.headline)
                    .foregroundColor(Color.black)
                
                Divider()
                
                Button(action:{
                    miReserva = reserva
                    activeSheet = .ubicacion
                }){
                    HStack(spacing: 10){
                        Text("Ubicación")
                            .font(.headline)
                            .foregroundColor(Color.black)
                        Image(systemName: "map")
                            .font(.system(size: 26))
                            .foregroundColor(Color.black)
                    }
                    
                }
                
                Divider()
                
                Button(action:{
                    cancelar = true
                }){
                    HStack(spacing: 10){
                        Text("Cancelar reserva")
                            .font(.headline)
                        Image(systemName: "minus.circle")
                            .font(.system(size: 26))
                    }.foregroundColor(.red)
                }.alert(isPresented:$cancelar) {
                    return Alert(
                        title: Text("¿Seguro que quieres cancelar la reserva?"),
                        primaryButton: .default(Text("Sí")) {
                            bares.eliminarReserva(reserva: reserva)
                            actualiza.toggle()
                            activeSheet = nil
                        },
                        secondaryButton: .cancel(Text("No"))
                    )
                }
            }
        }.padding()
        .background(Color("card"))
        .cornerRadius(20)
    }
}
