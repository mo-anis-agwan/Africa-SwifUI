//
//  ContentView.swift
//  Africa
//
//  Created by Anis on 28/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //MARK:- Properties
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        
        //MARK:- Body
        NavigationView {
            List {
                CoverImageView()
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) {animal in
                    NavigationLink(
                        destination: AnimalDetailView(animal: animal),
                        label: {
                            AnimalListItemView(animal: animal)
                        })
                }
                
            } //: List
            .navigationBarTitle("Africa", displayMode: .large)
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
