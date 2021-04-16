//
//  BarModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 18/3/21.
//

import Foundation

struct BarModel: Identifiable, Hashable {
    var id: String = ""
    var nombre: String = ""
    var descripcion: String = ""
    var capacidad: Int = 0
    var capacidadTurno: [String:[String:Int]] = [:]
    var lat: Double = 0.0
    var long: Double = 0.0
    var tipo: String = "Pasta"
    var idUser: String = ""
    var dirImagen: String = ""
    var imagen: Data = .init(capacity: 0)
}
