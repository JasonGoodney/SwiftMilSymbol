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
                NavigationLink("MilSymbol with options") {
                    OptionsView()
                        .navigationTitle("MilSymbol with options")
                }
                
                NavigationLink("MIL-STD 2525C") {
                    MilStd2525CView()
                        .navigationTitle("MIL-STD 2525C")
                }
            }
            .navigationTitle("Example")
        }
    }
}

#Preview {
    ContentView()
}
