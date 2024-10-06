//
//  ContentView.swift
//  SwiftMilSymbolApp
//
//  Created by Jason Goodney on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            OptionsView()
                .tabItem {
                    Label("Options", systemImage: "text.below.photo")
                }
            
            GridView()
                .tabItem {
                    Label("Grid", systemImage: "square.grid.3x3")
                }
        }
    }
}

#Preview {
    ContentView()
}
