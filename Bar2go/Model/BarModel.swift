//
//  BarModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 18/3/21.
//

import Foundation

/// Para almacenar un bar
struct BarModel: Identifiable, Hashable {
    var id: String = ""                                 /// Id del bar
    var nombre: String = ""                             /// Nombre del bar
    var descripcion: String = ""                        /// Descripción del bar
    var capacidad: Int = 0                              /// Capacidad del bar
    var capacidadTurno: [String:[String:Int]] = [:]     /// Capacidad restante en función de la fecha y el turno
    var lat: Double = 0.0                               /// Latitud donde se encuentra el bar
    var long: Double = 0.0                              /// Longitud donde se encuentra el bar
    var tipo: String = "Pasta"                          /// Tipo de bar
    var idUser: String = ""                             /// Id del usuario que creó el bar
    var dirImagen: String = ""                          /// Dirección en el storage donde se encuentra la imagen del bar
    var imagen: Data = .init(capacity: 0)               /// Imagen del bar (se usa en casos puntuales)
}
