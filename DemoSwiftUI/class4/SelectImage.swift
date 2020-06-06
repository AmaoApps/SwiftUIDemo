//
//  SelectImage.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/5/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct SelectImage: View {
    
    //Cada vez qyue se vea un binding necesitamos un @state
    @State private var myImageView: Image?
    @State private var showAddImageAlert: Bool = false
    @State private var selectedImage: UIImage?
    
    func loadImage()->Void{
        guard let miImagen = selectedImage else { return }
        myImageView = Image(uiImage: miImagen)
    }
    
    var body: some View {
        VStack {
            myImageView?
                .resizable()
                .scaledToFit()
            Button(action: {
                self.showAddImageAlert = true
            }) {
                Text("Selecionar imagens")
            }
        }
        .sheet(isPresented: $showAddImageAlert, onDismiss: loadImage,
        content:{
            ImagePickerView(imagen: self.$selectedImage)
        })
        //.sheet(isPresented: $showAddImageAlert, onDismiss: ){
        //    ImagePickerView(imagen: self.$selectedImage)
        //}
    }
}

struct SelectImage_Previews: PreviewProvider {
    static var previews: some View {
        SelectImage()
    }
}
