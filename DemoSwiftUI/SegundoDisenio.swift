//
//  File.swift
//  DemoSwiftUI
//
//  Created by Rakso on 5/25/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct SegundoDetalle: View {
    var body: some View {
        VStack {
            HeaderTitle(titulo: "Detalle del yapeo")
            ImageCheck()
            NormalText(texto: "Has yapeado")
            MonedaTexto(tipo: "S/. ", cantidad: "480.00")
            containerDetalles(nombres: "OSCAR ULISES AMAO QUIJANDRIA", fecha: "Vie 22/05/2020 - 01:47 pm", detalle: "Curso SwiftUI").padding()
            ButtonNuevoYapeo(buttonText: "Nuevo Yapeo").padding(.leading).padding(.trailing)
            ButtonTexto(buttonText: "Ir a inicio")
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct ButtonTexto: View {
    var buttonText: String
    var body : some View {
            Text(buttonText)
                .padding()
                .foregroundColor(Color("color_action_button"))
    }
}

struct ButtonNuevoYapeo: View {
    var buttonText: String
    var body : some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text(buttonText)
                .foregroundColor(Color.white)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("color_action_button"))
    }
}

struct containerDetalles: View {
    var nombres: String
    var fecha: String
    var detalle: String
    var body : some View {
        VStack {
            RowDetalle(iconoNombre: "icon_profile", detalle: nombres)
             RowDetalle(iconoNombre: "icon_calendar", detalle: fecha)
             RowDetalle(iconoNombre: "icon_message", detalle: detalle)
        }
        .padding([.top, .bottom], 20)
        .frame(maxWidth: .infinity)
        .background(Color("background_gray"))
    }
}

struct RowDetalle: View {
    var iconoNombre: String
    var detalle: String
    var body : some View {
        HStack {
            Image(uiImage:
                UIImage(imageLiteralResourceName: iconoNombre))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 24.0, height: 24.0)
                .padding(5)
            Text(detalle)
                .font(.system(size: 14))
                .bold()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 20)
        
    }
}

struct MonedaTexto: View {
    var tipo: String
    var cantidad: String
    var body : some View {
        HStack {
            Text(tipo)
                .font(.system(size: 14))
                .bold()
                .foregroundColor(Color.purple)
            Text(cantidad)
                .font(.system(size: 48))
                .bold()
                .foregroundColor(Color.purple)
        }
    }
}

struct NormalText: View {
    var texto: String
    var body : some View {
        Text(texto)
            .font(.system(size: 14))
            .bold()
            .foregroundColor(Color.gray)
    }
}

struct HeaderTitle : View {
    var titulo: String
    var body: some View {
        Text(titulo)
            .font(.system(size: 16))
            .bold()
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            .foregroundColor(.white)
    }
    
}

struct ImageCheck : View {
    var body : some View {
        Image(uiImage:
            UIImage(imageLiteralResourceName: "check_white"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 72.0, height: 72.0)
            .clipShape(Circle())
            .background(Circle().fill(Color.purple))
            .padding(.top, 20.0)
            .padding(.bottom, 30.0)
            
            //.shadow(radius: 1)
            //.overlay(Circle().stroke(Color.gray, lineWidth: 1))
    }
}



struct ContentView_SegundoDisenio: PreviewProvider {
    static var previews: some View {
        SegundoDetalle()
    }
}
