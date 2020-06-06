//
//  ImagePickerContact.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/6/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct ImagePickerContactView: UIViewControllerRepresentable {
   
    @Binding var imagenProfile: UIImage?
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        //Definimos nuestro ViewContenedor
        var main: ImagePickerContactView
        
        //Creamos por defecto nuestro controller principal
        init(_ mainRepresentable: ImagePickerContactView){
            self.main = mainRepresentable
        }
        
        //Agregamos los metodos de donde extendemos el controlador, sea necesario según el caso que se tenga
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            //Definimos la imagen que tendremos cuando coloquemos el click
            guard let selectedImage = info[.originalImage] as? UIImage else {
                return
            }
            main.imagenProfile = selectedImage
            
        }
        
    }
    
    //Cuando usamos el coordinator necesitamos lo siguiente
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.delegate = context.coordinator //3. Coordinador es el Delegado
        return UIImagePickerController()
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    
    
}



