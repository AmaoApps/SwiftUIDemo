//
//  AgendaContacto.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/5/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import Foundation


class AgendaContacto :ObservableObject,  Identifiable{

     @Published var id = UUID()
   @Published var inicial : String = ""
   @Published var contacto : Contacto?
    
    /*
    init(inicial: String,
         contactos: [Contacto]) {
        self.inicial = inicial
        self.contactos = contactos
       }*/
    
    

}
