//
//  BusquedaNombre.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 17/3/21.
//

import SwiftUI

struct BusquedaNombre: View {
    @State private var nombre: String = ""
    @Binding var index: String
    @StateObject var bares = BarViewModel()
    @State private var pideBares = false
    @State var miBar: BarModel = BarModel()
    
    @State private var isEditing = false
    
    @Binding var barEditar: BarModel
    
    @StateObject var speech: SpeechViewModel
    
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    TextField("Nombre", text: $nombre)
                        .disableAutocorrection(true)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                         
                                if isEditing {
                                    Button(action: {
                                        self.nombre = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
         
                    Button(action: {
                        bares.obtenerBaresNombre(nombreBuscado: nombre)
                    }) {
                        Text("Buscar")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }.padding()
                
                Spacer()
                
                ListaBares(bares: bares, tipoBusqueda: .nombre, nombre: nombre, index: $index, barEditar: $barEditar, speech: speech)
            }
        }
    }
}
