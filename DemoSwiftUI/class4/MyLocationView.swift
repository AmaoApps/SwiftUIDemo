//
//  MyLocationView.swift
//  DemoSwiftUI
//
//  Created by Rakso on 6/5/20.
//  Copyright © 2020 Rakso. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MyLocationView: View {
    var body: some View {
        VStack {
            NewMapView(coordinate: .init(latitude: 36.778259, longitude: -119.417931))
            //NewMapView(coordinate: .init(latitude: 36.778259, longitude: -119.417931)),
            VStack(alignment: .leading, spacing: 10){
                Text("Restaurante")
                Text("Av. auxiliar 123")
                Text("Telefono: 12313123")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
    }
}

struct MyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        MyLocationView()
    }
}
