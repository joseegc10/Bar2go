//
//  ReservasUsuario.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 25/3/21.
//

import SwiftUI

struct ReservasUsuario: View {
    @StateObject var bares = BarViewModel()
    
    var body: some View {
        ListaReservas()
    }
}
