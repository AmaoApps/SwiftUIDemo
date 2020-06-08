//
//  ImagePickerContact.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/6/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI
import UIKit

struct ImagePickerContactView: UIViewControllerRepresentable {
   
    @Environment(\.presentationMode) var presentationMode
    @Binding var imageSelected: UIImage?
    
    //Cuando usamos el coordinator necesitamos lo siguiente
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.delegate = context.coordinator //3. Coordinador es el Delegado
        return pickerVC
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}


class ImagePickerCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
       //Definimos nuestro ViewContenedor
       var main: ImagePickerContactView
       
       //Creamos por defecto nuestro controller principal
       init(_ mainRepresentable: ImagePickerContactView){
           self.main = mainRepresentable
       }
       
       //Agregamos los metodos de donde extendemos el controlador, sea necesario según el caso que se tenga
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           //Definimos la imagen que tendremos cuando coloquemos el click
            if let selectedImage = info[.originalImage] as? UIImage {
                main.imageSelected = selectedImage
            }
            //guard let selectedImage = info[.originalImage] as? UIImage else {
            //   return
            // }
           //self.presentationMode.wrappedValue.dismiss()
           //main.imageSelected = selectedImage
           main.presentationMode.wrappedValue.dismiss()
       }
       
       
}
