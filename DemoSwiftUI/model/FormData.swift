//
//  FormData.swift
//  DemoSwiftUI
//
//  Created by Rakso on 5/31/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import Foundation

class FormData : ObservableObject{
    
  @Published var iconName : String = ""
  @Published var placeHolder : String = ""
  @Published var nameUser: String = ""
  @Published var validation: Bool = true
  @Published var codigoError: Int = 0
    
    init(iconName: String,
         placeHolder: String,
         nameUser: String,
         validation: Bool,
         codigoError: Int) {
        self.iconName = iconName
        self.placeHolder = placeHolder
        self.nameUser = nameUser
        self.validation = validation
        self.codigoError = codigoError
       }

}
