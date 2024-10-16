//
//  ContentView.swift
//  SwiftMilSymbolApp
//
//  Created by Jason Goodney on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("MilSymbol Example") {
                    OptionsView()
                        .navigationTitle("MilSymbol")
                }
                
                NavigationLink("Warfighting Symbols") {
                    WarfightingSymbols()
                        .navigationTitle("Warfighting Symbols")
                }
            }
            .navigationTitle("Example")
        }
    }
}

#Preview {
    ContentView()
}
