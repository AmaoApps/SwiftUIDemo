//
//  AgendaView.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/4/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct AgendaView: View {
    
    @State var listaContactos: [Contacto] = [Contacto.init(nombreContacto: "Alejandro", telefono: "998899778", genero: "Masculino", lugarTrabajo: "Oficina", profesion: "Developer"),
    Contacto.init(nombreContacto: "Julian", telefono: "998746352", genero: "Masculino", lugarTrabajo: "Oficina", profesion: "-"),
    Contacto.init(nombreContacto: "Valentina", telefono: "987654321", genero: "Femenino", lugarTrabajo: "Colegio", profesion: "Contador"),
    Contacto.init(nombreContacto: "Kimberly", telefono: "997788665", genero: "Femenino", lugarTrabajo: "Colegio", profesion: "Abogado"),
    Contacto.init(nombreContacto: "Miacelo", telefono: "988977665", genero: "Masculino", lugarTrabajo: "trabajo", profesion: "-"),
    Contacto.init(nombreContacto: "Mariana", telefono: "909909878", genero: "Femenino", lugarTrabajo: "Trabajo", profesion: "-"),
    Contacto.init(nombreContacto: "Viviana", telefono: "980768543", genero: "Femenino", lugarTrabajo: "BELCORP", profesion: "-"),
    Contacto.init(nombreContacto: "Lizeth", telefono: "995522131", genero: "Femenino", lugarTrabajo: "Departamento", profesion: "-")
    ]
    


    //var listaAgenda:[AgendaContacto] = convertContactoToAgenda
    
    
    //Función para ordenar alfabeticamente
    
    var body: some View {
        var listaAgenda : [AgendaContacto] = obtenerVistaAgenda(contactos: listaContactos)
       return NavigationView {
            VStack{
                List{
                    ForEach(listaAgenda) { agenda in
                        return VStack{
                            if(agenda.inicial==""){
                                NavigationLink(destination: DetalleContacto(contacto: agenda.contacto!)){
                                    Text(agenda.contacto!.nombreContacto)
                                }
                            }else{
                                Text(agenda.inicial)
                            }
                        }
                    }
                }
            }.navigationBarTitle("Agenda Principal")
        }
         
    }
    
}

func obtenerVistaAgenda(contactos: [Contacto]) -> [AgendaContacto]{

    var inicial = ""
    
    //ordenar alfabeticamente los nombres
    let contactosOrdenados = ordenarAlfabeticamente(listaContactos: contactos)
    
    var agendaContactos:[AgendaContacto] = []
    var agendaContacto = AgendaContacto()
    for contacto in contactosOrdenados {
        agendaContacto = AgendaContacto()
        if(contacto.getInicial()>inicial){
            inicial = contacto.getInicial()
            agendaContacto.inicial = inicial
            agendaContactos.append(agendaContacto)
            
            agendaContacto = AgendaContacto()
            agendaContacto.contacto = contacto
        }else{
            agendaContacto.contacto = contacto
            
        }
        agendaContactos.append(agendaContacto)
    }
    return agendaContactos
}

func ordenarAlfabeticamente(listaContactos: [Contacto])-> [Contacto]{
    return listaContactos.sorted{ $0.nombreContacto < $1.nombreContacto }
}



struct AgendaView_Previews: PreviewProvider {
    static var previews: some View {
        AgendaView()
    }
}
