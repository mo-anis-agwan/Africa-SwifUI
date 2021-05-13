//
//  InsetMapView.swift
//  Africa
//
//  Created by Anis on 02/05/21.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK:- Properties
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK:- Body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        
                    }
                }
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

    //MARK:- Preview
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
