//
//  CopyrightView.swift
//  Africa
//
//  Created by Anis on 20/05/21.
//

import SwiftUI

struct CopyrightView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaleEffect()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright @ Childish El-Nino
    All rights reserved
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}

struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
        CopyrightView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
