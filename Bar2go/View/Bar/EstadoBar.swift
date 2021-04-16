//
//  Capacidad.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 21/3/21.
//

import SwiftUI

struct EstadoBar: View {
    var huecosOcupados : [Int:Int]
    var turno: String
    
    var body: some View {
        VStack(spacing: 20){            
            Text("Turno " + turno)
                .bold()
                .font(.largeTitle)

            VStack(spacing: 30) {
                ForEach(Array(huecosOcupados.keys).sorted(by: <), id: \.self){ tam in
                    let ocupado: Int = huecosOcupados[tam] ?? 0
                    
                    Text("Mesas de tamaño " + String(tam) + ": " + String(ocupado))
                        .bold()
                        .font(.headline)
                }
            }
        }.padding()
        .background(Color("card"))
        .cornerRadius(20)
    }
}


struct ContadorMesas: View {
    @Binding var huecosOcupados : [Int:Int]
    let tam: Int
    
    var body: some View {
        HStack{
            Text(String(huecosOcupados[tam] ?? 0) + " mesas de " + String(tam))
                .bold()
                .font(.system(size: 30))
            
            /**
            Button(action: {
                if ((huecosOcupados[tam] ?? 0) == 0){
                    huecosOcupados[tam] = 1
                } else {
                    huecosOcupados[tam]! += 1
                }
            }, label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 50))
                    .foregroundColor(Color("navbarSuave"))
            })
            
            Button(action: {
                if ((huecosOcupados[tam] ?? 0) > 0){
                    huecosOcupados[tam]! -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
                    .font(.system(size: 50))
                    .foregroundColor(Color("navbarSuave"))
            })*/
        }
    }
}
