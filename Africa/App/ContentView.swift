//
//  ContentView.swift
//  Africa
//
//  Created by Anis on 28/04/21.
//

import SwiftUI

struct ContentView: View {
    //MARK:- Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK:- Functions
    func gridSwitch() {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            
            // TOOLBAR IMAGE
            switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
            }
        }
    
    var body: some View {
        
        //MARK:- Body
        NavigationView {
            Group {
                if !isGridActive {
                    List {
                        CoverImageView()
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) {animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListItemView(animal: animal) //: Link
                                })
                        } //: Loop
                        CopyrightView()
                            .modifier(CenterModifier())
                    } //: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal:animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: NavLink
                            } //: For loop
                        } //: Grid
                        .padding(10)
                        .animation(.easeIn)
                    } //: ScrollView
                } //: End Condition
            } //: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button(action: {
                            print("List view is activated")
                            isGridActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActive ? .primary : .accentColor)
                        })
                        
                        //Grid
                        Button(action: {
                            print("Grid view is activated")
                            isGridActive = true
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridActive ? .accentColor : .primary)
                        })
                        
                    } //: HStack
                } //: Buttons
            } //: Toolbar
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
