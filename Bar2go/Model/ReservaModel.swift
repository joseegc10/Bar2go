//
//  ReservaModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 25/3/21.
//

import Foundation

struct ReservaModel: Identifiable {
    var id: String
    var idUser: String
    var bar: BarModel
    var tam: Int
    var turno: String
    var fecha: String
}
