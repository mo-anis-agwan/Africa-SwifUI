//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Anis on 01/05/21.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK:- Properties
    let animal: Animal
    
    
    //MARK:- Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false ) {
            VStack(alignment: .center, spacing: 20, content: {
                // Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height:6)
                            .offset(y: 24)
                    )
                
                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                } //: Group
                .padding(.horizontal)
                
                // Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // Map
                
                // Link
                
            }) //: VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        
        } //: ScrollView
    }
}

    //MARK:- Preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
                .previewDevice("iPhone 12 mini")
        }
    }
}
