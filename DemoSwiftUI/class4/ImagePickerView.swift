//
//  ImagePickerView.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/5/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

//1 . Heredasd de UIVIEWCONTROLLERREPRESENTABLE
struct ImagePickerView: UIViewControllerRepresentable {
    
    //@Environment(\.presentationMode) var presentationMode
    @Binding var imagen: UIImage?
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var main: ImagePickerView
        
        init(_ mainRepresentable: ImagePickerView){
            self.main = mainRepresentable
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else {
                return
            }
            main.imagen = selectedImage
            //picker.dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        }
        
    }
    
    //Cuando usamos el COordinador necesitamos lo siguiente
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        //2. Crear nuestro VC
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.delegate = context.coordinator //3. Coordinador es el Delegado
        return UIImagePickerController()
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
}

