//
//  DetalleContacto.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/5/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct DetalleContacto: View {
    
    var contacto: Contacto
    
    var body: some View {
        VStack{
            Text("Detalles del contacto")
            Text("Nombres: " + contacto.nombreContacto)
            Text("Telefono: " + contacto.telefono)
            Text("Genero: " + contacto.genero)
            Text("Lugar: " + contacto.lugarTrabajo)
            Text("Profesión: " + contacto.profesion)
        }
        
    }
}

struct DetalleContacto_Previews: PreviewProvider {
    static var previews: some View {
        DetalleContacto(contacto: Contacto.init(nombreContacto: "NombreContacto", telefono: "Telefono", genero: "Genero", lugarTrabajo: "Oficina", profesion: "Developer"))
    }
}
