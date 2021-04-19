//
//  BaresUsuario.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 25/3/21.
//

import SwiftUI

struct BaresUsuario: View {
    @StateObject var bares = BarViewModel()
    @Binding var index: String
    @Binding var barEditar: BarModel
    
    @StateObject var speech: SpeechViewModel
    
    var body: some View {
        ListaBares(bares: bares, tipoBusqueda: .baresUsuario, index: $index, barEditar: $barEditar, speech: speech)
    }
}
