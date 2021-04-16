//
//  Home.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 17/3/21.
//

import SwiftUI

struct Home: View {
    @StateObject var bares = BarViewModel()
    @Binding var index : String
    var nombre: String? = nil
    var tipo: String? = nil
    @Binding var barEditar: BarModel
    
    var body: some View {
        VStack{
            ListaBares(bares: bares, index: $index, barEditar: $barEditar)
        }
    }
}
