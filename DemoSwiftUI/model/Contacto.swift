//
//  Contacto.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/4/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import Foundation

class Contacto : ObservableObject, Identifiable{

  @Published var id = UUID()
  @Published var nombreContacto : String = ""
  @Published var apellidoContacto : String = ""
  @Published var telefono : String = ""
  @Published var genero: String = ""
  @Published var lugarTrabajo: String = ""
  @Published var profesion: String = ""
    
    init(nombreContacto: String,
         apellidoContacto: String,
         telefono: String,
         genero: String,
         lugarTrabajo: String,
         profesion: String) {
        self.nombreContacto = nombreContacto
        self.apellidoContacto = apellidoContacto
        self.telefono = telefono
        self.genero = genero
        self.lugarTrabajo = lugarTrabajo
        self.profesion = profesion
       }
    
    func getInicial() -> String{
        let input = self.apellidoContacto
        return String(input[input.index(input.startIndex, offsetBy: 0)])
    }

}
