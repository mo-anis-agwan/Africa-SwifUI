//
//  CenterModifier.swift
//  Africa
//
//  Created by Anis on 22/05/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
