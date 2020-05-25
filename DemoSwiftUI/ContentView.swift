//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by Rakso on 5/24/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            obtenerHeader()
            obtenerDetalle()
            Spacer()
        }
    
        //.background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Cabecera de la estructura
struct obtenerHeader : View {
    var body: some View {
        HStack(alignment: .center){
            Image(uiImage:
                UIImage(imageLiteralResourceName: "img_academia_moviles"))
                .resizable()
                .frame(width: 72.0, height: 72.0)
                .clipShape(Circle())
                .shadow(radius: 1)
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            DetalleHeader(numeroDetalle: "44", textoDetalle: "Posts")
            DetalleHeader(numeroDetalle: "290", textoDetalle: "Followers")
            DetalleHeader(numeroDetalle: "155", textoDetalle: "Following")
        }
        .frame(maxWidth: .infinity,alignment: .center)
    }
}

//Detalles de la cabecera
struct DetalleHeader:View {
    
    var numeroDetalle:String
    var textoDetalle:String
    
    var body: some View {
        VStack {
            Text(numeroDetalle)
                .bold()
                .font(.system(size: 20))
            Text(textoDetalle)
                .font(.system(size: 14))
        }.frame(width:70)
    }
}

struct obtenerDetalle : View {
    var body: some View {
        VStack (alignment: .leading){
            DetalleTituloText(titulo:"Academia Móviles")
            DetalleSubTituloText(subtitulo: "Campus Building")
            DetalleHTMLText(textHtml: "&#9673;Contacto: +51 941 520 566 / +51 920 171 150&#128071;&#127477;&#127466;")
            DetalleHTMLText(textHtml: "&#127760;Fanpage: " +
                "<a href=" + "/academiamoviles/" + ">@academiamoviles </a>" +
                "<a href=" + "/explore/tags/academiam&oacute;viles/" + ">#academiam&oacute;viles</a> " +
                "<a href=" + "/explore/tags/academiamoviles/" + ">#academiamoviles</a> ")
            DetalleLinkText(link: "www.academiamoviles.com")
            DetalleNormalText(texto: "Av. Arequipa 2450 - Lince, Lince, Lima, Perú")
            DetalleNormalText(texto: "Followed by daccio7, cr72019898 and 3 others")
            DetalleBoldText(texto: "See translation")
        }
        .frame(maxWidth: .infinity ,alignment: .leading)
        .padding([.top, .leading], 16.0)
    }
}

struct DetalleTituloText : View {
    var titulo : String
    var body: some View {
        Text(titulo)
            .font(.headline)
    }
}

struct DetalleSubTituloText : View {
    var subtitulo : String
    var body: some View {
        Text(subtitulo)
            .font(.subheadline)
    }
}

struct DetalleHTMLText : View {
    var textHtml : String
    var body: some View {
        Text(textHtml.htmlDecoded)
            .font(.system(size: 14))
    }
}

struct DetalleLinkText : View {
    var link : String
    var body: some View {
        Text(link)
            .font(.system(size: 14))
            .bold()
            .foregroundColor(.blue)
    }
}

struct DetalleNormalText : View {
    var texto : String
    var body: some View {
        Text(texto)
            .font(.system(size: 14))
    }
}
struct DetalleBoldText : View {
    var texto : String
    var body: some View {
        Text(texto)
            .font(.system(size: 14))
            .bold()
    }
}


extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil).string

        return decoded ?? self
    }
}
