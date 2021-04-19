//
//  BusquedaTipo.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 17/3/21.
//

import SwiftUI

struct BusquedaTipo: View {
    @State private var tipo: String = "Pasta"
    @Binding var index: String
    @StateObject var bares = BarViewModel()
    let tiposPosibles: [String] = TipoBar.allCases.map{ $0.rawValue }
    
    @Binding var barEditar: BarModel
    
    @StateObject var speech: SpeechViewModel
    
    var body: some View {
        VStack{
            HStack {
                VStack{
                    TiposPickerView(selectedTitle: $tipo, tipoInicial: "Pasta")
                        .onChange(of: tipo){t in
                            bares.obtenerBaresTipo(tipo: t)
                        }
                }
            }.padding()
            
            Spacer()
            
            ListaBares(bares: bares, tipoBusqueda: .tipo, tipo: tipo, index: $index, barEditar: $barEditar, speech: speech)
        }.onAppear{            
            bares.obtenerBaresTipo(tipo: tipo)
        }
    }
}
