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
            
            MilStd2525CView()
                .tabItem {
                    Label("MilStd2525C", systemImage: "square.grid.3x1.below.line.grid.1x2.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
