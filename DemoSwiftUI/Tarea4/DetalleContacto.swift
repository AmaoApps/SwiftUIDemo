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
            Image(uiImage:
            UIImage(imageLiteralResourceName: "icon_profile"))
            .resizable()
                .frame(width: 150.0, height: 150.0)
            .clipShape(Circle())
            .shadow(radius: 1)
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            Text(contacto.nombreContacto).fontWeight(.bold)
            Text(contacto.apellidoContacto).fontWeight(.bold)
            HStack{
                Image(uiImage:
                UIImage(imageLiteralResourceName: "icon_phone")).resizable()
                .frame(width: 20, height: 20)
                Text(contacto.telefono)
            }
            HStack{
                if(contacto.genero == "Masculino"){
                    Image(uiImage:
                    UIImage(imageLiteralResourceName: "icon_male")).resizable()
                    .frame(width: 20, height: 20)
                }else if (contacto.genero == "Femenino"){
                    Image(uiImage:
                    UIImage(imageLiteralResourceName: "icon_female")).resizable()
                    .frame(width: 20, height: 20)
                }
                Text(contacto.genero)
            }
            HStack{
                Image(uiImage:
                UIImage(imageLiteralResourceName: "icon_building")).resizable()
                .frame(width: 20, height: 20)
                Text(contacto.lugarTrabajo)
            }
            HStack{
                Image(uiImage:
                UIImage(imageLiteralResourceName: "icon_work")).resizable()
                .frame(width: 20, height: 20)
                Text(contacto.profesion)
            }
        }
        
    }
}

struct DetalleContacto_Previews: PreviewProvider {
    static var previews: some View {
        DetalleContacto(contacto: Contacto.init(nombreContacto: "NombreContacto", apellidoContacto: "ApellidoContacto" , telefono: "Telefono", genero: "Masculino", lugarTrabajo: "Oficina", profesion: "Developer"))
    }
}
