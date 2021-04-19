//
//  ReservaModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 25/3/21.
//

import Foundation

/// Para almacenar una reserva
struct ReservaModel: Identifiable {
    var id: String          /// Id de la reserva
    var idUser: String      /// Id del usuario que ha hecho la reserva
    var bar: BarModel       /// Bar donde se ha hecho la reserva
    var tam: Int            /// Número de personas de la reserva
    var turno: String       /// Turno de la reserva
    var fecha: String       /// Fecha de la reserva
}
