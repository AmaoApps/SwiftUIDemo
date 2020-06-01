//
//  FormularioTarea.swift
//  DemoSwiftUI
//
//  Created by Rakso on 5/31/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct FormularioTarea: View {
    
    @ObservedObject var formNombres = FormData(iconName: "icon_name", placeHolder: "Ingresar el nombre de usuario", nameUser: "", validation: true, codigoError: 0)
    @ObservedObject var formCorreo = FormData(iconName: "icon_message", placeHolder: "Ingrese su correo electrónico", nameUser: "", validation: true, codigoError: 0)
    @ObservedObject var formTelefono = FormData(iconName: "icon_phone", placeHolder: "Ingrese su número telefónico", nameUser: "", validation: true, codigoError: 0)
    @ObservedObject var formPais = FormData(iconName: "icon_country", placeHolder: "Ingrese su pais de origen", nameUser: "", validation: true, codigoError: 0)
    
    
    var body: some View {
        VStack (alignment: .center){
            
            Text("Completar el siguiente formulario").font(.system(size: 22))
            
            ButtonFormulario(data: formNombres, keyboard_type: UIKeyboardType.namePhonePad)
            
            ButtonFormulario(data: formCorreo, keyboard_type: UIKeyboardType.emailAddress)
            
            ButtonFormulario(data: formTelefono, keyboard_type: UIKeyboardType.phonePad)
            
            ButtonFormulario(data: formPais, keyboard_type: UIKeyboardType.namePhonePad)
            
            /*
            ButtonFormulario(
                iconName: "icon_message",
                placeString: "Ingrese su correo electrónico",
                bindingdData: self.$nombres,
                bindingValidation: self.$statusNombres,
                codigoError: self.$cogigoErrorNombres)
            
            ButtonFormulario(
                iconName: "icon_documento",
                placeString: "Ingrese su DNI",
                bindingdData: self.$nombres,
                bindingValidation: self.$statusNombres,
                codigoError: self.$cogigoErrorNombres)
            
            ButtonFormulario(
                iconName: "icon_phone",
                placeString: "Ingrese su número telefónico",
                bindingdData: self.$nombres,
                bindingValidation: self.$statusNombres,
                codigoError: self.$cogigoErrorNombres)
            
            ButtonFormulario(
                iconName: "icon_country",
                placeString: "Ingrese su País",
                bindingdData: self.$nombres,
                bindingValidation: self.$statusNombres,
                codigoError: self.$cogigoErrorNombres)
            */
            
            Button(action: {
                print("\(self.formNombres.nameUser)")
                validarNombres(txtfield: self.formNombres)
                validarCorreo(txtfield: self.formCorreo)
                //validarDocumento()
                validarTelefono(txtfield: self.formTelefono)
                validarPais(txtfield: self.formPais)
            }) {
                Text("Enviar Formulario")
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .cornerRadius(22)
            
            Spacer()
        }.padding()
    }
}

struct FormularioTarea_Previews: PreviewProvider {
    static var previews: some View {
        FormularioTarea()
    }
}

struct ButtonFormulario: View {
    
    @ObservedObject var data: FormData
    var keyboard_type : UIKeyboardType
    
    var body : some View {
            VStack(alignment: .leading){
                if(data.validation){
                    ZStack{
                        HStack{
                                Image(uiImage:
                                    UIImage(imageLiteralResourceName: data.iconName))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 18, height: 18)
                                .padding(5)
                            TextField(data.placeHolder, text: $data.nameUser)
                                .keyboardType(keyboard_type)
                            }
                            .padding(EdgeInsets(top:8, leading: 10, bottom: 8, trailing: 10))
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    }
                }else{
                    VStack{
                        ZStack{
                            HStack{
                                    Image(uiImage:
                                    UIImage(imageLiteralResourceName: data.iconName))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 18, height: 18)
                                    .padding(5)
                                    TextField(data.placeHolder, text: $data.nameUser).keyboardType(keyboard_type)
                                }
                                .padding(EdgeInsets(top:8, leading: 10, bottom: 8, trailing: 10))
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.red, lineWidth: 1))
                        }
                        HStack{
                            Image(uiImage:
                            UIImage(imageLiteralResourceName: "icon_error"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 16, height: 16)
                            .padding(5)
                            
                            Text(getTextError(codigoError: data.codigoError)).font(.system(size: 12))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
    }
    

}



func getTextError(codigoError:Int) -> String{
    var txtResult:String = ""
    switch codigoError {
    case 0:
        txtResult = "Dato sin completar"
    case 1:
        txtResult = "Completar dato obligatorio"
    case 2:
        txtResult = "No es un dato válido"
    case 3:
        txtResult = "Es demasiado largo"
    case 4:
        txtResult = "Es demasiado corto"
    default:
        txtResult = ""
    }
    
    return txtResult
}

func validarNombres(txtfield: FormData){
    //Validamos si el campo esta vacio
    if(txtfield.nameUser == ""){
        txtfield.validation = false
        txtfield.codigoError = 1
        return
    }
    if(txtfield.nameUser.count>50){
        txtfield.validation = false
        txtfield.codigoError = 3
        return
    }
    if(txtfield.nameUser.count<3){
        txtfield.validation = false
        txtfield.codigoError = 4
        return
    }
    return txtfield.validation = true
}

func validarCorreo(txtfield: FormData){
    //Validamos si el campo esta vacio
    if(txtfield.nameUser == ""){
        txtfield.validation = false
        txtfield.codigoError = 1
        return
    }
    if(!txtfield.nameUser.contains("@")){
        txtfield.validation = false
        txtfield.codigoError = 2
        return
    }
    return txtfield.validation = true
}

func validarTelefono(txtfield: FormData){
    //Validamos si el campo esta vacio
    if(txtfield.nameUser == ""){
        txtfield.validation = false
        txtfield.codigoError = 1
        return
    }
    if(txtfield.nameUser.count<9){
        txtfield.validation = false
        txtfield.codigoError = 4
        return
    }
    if(txtfield.nameUser.count>9){
        txtfield.validation = false
        txtfield.codigoError = 3
        return
    }
    return txtfield.validation = true
}

func validarPais(txtfield: FormData){
    //Validamos si el campo esta vacio
    if(txtfield.nameUser == ""){
        txtfield.validation = false
        txtfield.codigoError = 1
        return
    }
    return txtfield.validation = true
}

