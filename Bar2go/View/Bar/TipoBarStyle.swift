//
//  tipoBarButton.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 21/3/21.
//

import SwiftUI

struct TipoBarStyle: ButtonStyle {
    @Binding var tipo: String
    let miTipo: String
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(tipo == miTipo ? LinearGradient(gradient: Gradient(colors: [Color("navbar"), Color("cardFuerte")]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color("navbar"), Color("card")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
    }
}
