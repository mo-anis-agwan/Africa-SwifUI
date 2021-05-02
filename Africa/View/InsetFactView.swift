//
//  InsetFactView.swift
//  Africa
//
//  Created by Anis on 02/05/21.
//

import SwiftUI

struct InsetFactView: View {
    //MARK:- Properties
    let animal: Animal
    
    //MARK:- Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 148, idealWidth: 168, maxHeight: 180)
        } //: GroupBox
    }
}

    //MARK:- Preview
struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
