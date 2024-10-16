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
                
                NavigationLink("MIL-STD-2525C List") {
                    MilStd2525CView()
                        .navigationTitle("MIL-STD-2525C")
                }
            }
            .navigationTitle("Example")
        }
    }
}

#Preview {
    ContentView()
}
