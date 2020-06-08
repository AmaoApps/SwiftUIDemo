//
//  AgendaView.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/4/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI
import CoreData

struct AgendaView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: ContactoEntity.entity(), sortDescriptors: []) var contactosData: FetchedResults<ContactoEntity>
    
    @State var NewContacto:ContactoEntity?
    @State var FlagRegistro:Bool?
    @State var showForm = false
    
    
    @State var listaContactos: [Contacto] = [Contacto.init(nombreContacto: "Alejandro",apellidoContacto: "Alvarez", telefono: "998899778", genero: "Masculino", lugarTrabajo: "Oficina", profesion: "Developer"),
    Contacto.init(nombreContacto: "Julian",apellidoContacto: "Salazar",  telefono: "998746352", genero: "Masculino", lugarTrabajo: "Oficina", profesion: "-"),
    Contacto.init(nombreContacto: "Valentina",apellidoContacto: "Vivar",  telefono: "987654321", genero: "Femenino", lugarTrabajo: "Colegio", profesion: "Contador"),
    Contacto.init(nombreContacto: "Kimberly", apellidoContacto: "Estrada", telefono: "997788665", genero: "Femenino", lugarTrabajo: "Colegio", profesion: "Abogado"),
    Contacto.init(nombreContacto: "Miacelo", apellidoContacto: "Perez", telefono: "988977665", genero: "Masculino", lugarTrabajo: "trabajo", profesion: "-"),
    Contacto.init(nombreContacto: "Mariana",apellidoContacto: "Ventura",  telefono: "909909878", genero: "Femenino", lugarTrabajo: "Trabajo", profesion: "-"),
    Contacto.init(nombreContacto: "Viviana", apellidoContacto: "Espinoza", telefono: "980768543", genero: "Femenino", lugarTrabajo: "BELCORP", profesion: "-"),
    Contacto.init(nombreContacto: "Lizeth",apellidoContacto: "Velazquez",  telefono: "995522131", genero: "Femenino", lugarTrabajo: "Departamento", profesion: "-")
    ]
    


    //var listaAgenda:[AgendaContacto] = convertContactoToAgenda
    
    
    //Función para ordenar alfabeticamente
    
    var body: some View {
        var listaAgenda : [AgendaContacto] = obtenerVistaAgenda(contactos: listaContactos)
        //var listaAgenda: [AgendaContacto] = obtenerVistaAgendaEntity(contactos: contactosData)
       return NavigationView {
            VStack{
                List{
                    ForEach(listaAgenda) { agenda in
                        return VStack{
                            if(agenda.inicial==""){
                                NavigationLink(destination: DetalleContacto(contacto: agenda.contacto!)){
                                    return HStack{
                                        Text(agenda.contacto!.nombreContacto)
                                            .font(.system(size: 18))
                                        Text(agenda.contacto!.apellidoContacto).font(.system(size: 18))
                                            .fontWeight(.bold)
                                    }
                                }
                            }else{
                                HStack{
                                    Text(agenda.inicial).font(.system(size: 24)).fontWeight(.bold)
                                        .listRowBackground(Color.green)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Agenda Principal", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showForm.toggle()
                }){
                    Text("Registrar")
                }.sheet(isPresented: $showForm, onDismiss: {
                    self.registrarContacto()
                }) {
                    FormularioContacto(contactoToRegister: self.$NewContacto, flagToRegister: self.$FlagRegistro)
                }
                /*
                NavigationLink(destination:
                FormularioContacto(contactoToRegister: $NewContacto, flagToRegister: $FlagRegistro)){
                    Text("Agregar")
                }*/
            )
        }
         
    }
    
    func registrarContacto() -> Void {
        //let contactoToDB = ContactoEntity(context: managedObjectContext)
        self.contactosData.count
        print("Volviendo de registrar")
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

/*
func obtenerVistaAgendaEntity(contactos: [ContactoEntity]) -> [AgendaContacto]{

    var inicial = ""
    
    //ordenar alfabeticamente los nombres
    let contactosOrdenados = ordenarAlfabeticamenteEntity(listaContactos: contactos)
    
    var agendaContactos:[AgendaContacto] = []
    var agendaContacto = AgendaContacto()
    for contacto in contactosOrdenados {
        let inputInicial:String = contacto.apellidos!
        let inicialContactoEntity =  String(inputInicial[inputInicial.index(inputInicial.startIndex, offsetBy: 0)])
        agendaContacto = AgendaContacto()
        if(inicialContactoEntity>inicial){
            inicial = inicialContactoEntity
            agendaContacto.inicial = inicial
            agendaContactos.append(agendaContacto)
            
            agendaContacto = AgendaContacto()
            agendaContacto.contactoEntities = contacto
        }else{
            agendaContacto.contactoEntities = contacto
            
        }
        agendaContactos.append(agendaContacto)
    }
    return agendaContactos
}*/

func ordenarAlfabeticamente(listaContactos: [Contacto])-> [Contacto]{
    return listaContactos.sorted{ $0.apellidoContacto < $1.apellidoContacto }
}

/*func ordenarAlfabeticamenteEntity(listaContactos: [ContactoEntity])-> [ContactoEntity]{
    return listaContactos.sorted{ $0.apellidos < $1.apellidos }
}*/


struct AgendaView_Previews: PreviewProvider {
    static var previews: some View {
        AgendaView()
    }
}
