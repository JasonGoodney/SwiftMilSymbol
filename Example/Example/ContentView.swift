//
//  ContentView.swift
//  SwiftMilSymbolApp
//
//  Created by Jason Goodney on 8/25/24.
//

import SwiftUI
import SwiftMilSymbol

struct ContentView: View {
    let milSymbol = MilSymbol.shared
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(symbolIdentificationCodes, id: \.self) { sidc in
                    if let image = milSymbol.image(sidc, options: ["size": 24]) {
                        Image(uiImage: image)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
