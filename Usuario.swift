//
//  Usuario.swift
//  Practica 1
//
//  Created by Luis Antonio  Manzano Gopar on 11/01/22.
//

import Foundation

class Usuario {
    var numeroEmpleado: Int
    var nombre: String
    var email: String
    var telefono: String
    var password: String
    var fechaNacimiento: Date
    
    init(numeroEmpleado: Int, nombre: String, email: String, telefono: String, password: String, fechaNacimiento: Date){
        self.numeroEmpleado = numeroEmpleado
        self.nombre = nombre
        self.email = email
        self.telefono = telefono
        self.password = password
        self.fechaNacimiento = fechaNacimiento

    }
}
