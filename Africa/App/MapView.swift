//
//  MapView.swift
//  Africa
//
//  Created by Anis on 30/04/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK:- Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations:  [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK:- Body
    var body: some View {
        //MARK:- No1 Basic Map
        //Map(coordinateRegion: $region)
        
        //MARK:- No2 Map with Annoatations
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // Option A pin: Old style static
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // Option B: Marker: New Style static
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //Option C: Custom Basic Annotation
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } //: map Annotation
            
        })
    }
}
    //MARK:- Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
