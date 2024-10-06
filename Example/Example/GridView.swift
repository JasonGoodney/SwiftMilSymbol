//
//  GridView.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol

struct GridView: View {
    let milSymbol = MilSymbol.shared
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(symbolIdentificationCodes, id: \.self) { sidc in
                    if let image = milSymbol.image(sidc) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                    }
                }
            }
        }
    }
}

#Preview {
    GridView()
}
