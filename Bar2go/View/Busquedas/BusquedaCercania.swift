//
//  BusquedaCercania.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 17/3/21.
//

import SwiftUI

struct BusquedaCercania: View {
    @StateObject var bares = BarViewModel()
    @Binding var index: String
    @Binding var barEditar: BarModel
    
    var body: some View {
        ListaBares(bares: bares, tipoBusqueda: .distancia, index: $index, barEditar: $barEditar)
    }
}
