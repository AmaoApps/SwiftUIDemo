//
//  FormularioContacto.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/6/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct FormularioContacto: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var imgProfile: Image? = Image(uiImage: UIImage(imageLiteralResourceName: "icon_profile"))
    @State var selectedImagen: UIImage?
    @State var showPicker = false
    
    
    @Binding var contactoToRegister: ContactoEntity?
    @Binding var flagToRegister: Bool?
    //let onComplete: (Contacto) -> Void
    
    @State var nuevoNombres = ""
    @State var nuevoApellidos = ""
    @State var nuevoTelefono = ""
    @State var nuevoGenero = ""
    @State var nuevoLugar = ""
    @State var nuevoProfesion = ""
    
    var body: some View {
        
        NavigationView{
            VStack{
                imgProfile?
                .resizable()
                    .frame(width: 150.0, height: 150.0)
                .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1)).padding(10)
                Button(action: {
                    self.showPicker.toggle()
                }){
                    Text("Editar Foto")
                }.sheet(isPresented: $showPicker, onDismiss: self.loadImage) {
                    ImagePickerContactView(imageSelected: self.$selectedImagen)
                }
                Form {
                    Section(header: Text("Datos")) {
                        TextField("Nombres", text: $nuevoNombres)
                                           .keyboardType(.default)
                        TextField("Apellidos", text: $nuevoApellidos)
                                       .keyboardType(.default)
                        TextField("Telefono", text: $nuevoTelefono)
                                       .keyboardType(.numberPad)
                        TextField("Genero", text: $nuevoGenero)
                                       .keyboardType(.default)
                        TextField("Lugar", text: $nuevoLugar)
                                       .keyboardType(.default)
                        TextField("Profesión", text: $nuevoProfesion)
                                       .keyboardType(.default)
                    }
                }
            }.navigationBarTitle("Nuevo Contacto", displayMode: .inline)
            .navigationBarItems(leading: self.btnCancelar(),
                                trailing: self.btnAgregar())
            
        }
    }
    
    func loadImage()->Void{
        guard let imagenPerfil = selectedImagen else { return }
        imgProfile = Image(uiImage: imagenPerfil)
    }
    

    func btnCancelar() -> some View {
        return Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }){
            Text("Cancelar")
        }
        
    }

    func btnAgregar() -> some View {
        return Button(action: {
            let ctbTodb = ContactoEntity(context: self.managedObjectContext)
            ctbTodb.apellidos = "ULI"
            self.contactoToRegister = ctbTodb
            self.flagToRegister = true
            self.presentationMode.wrappedValue.dismiss()
        }){
            Text("Registrar")
        }
    }
    
}

