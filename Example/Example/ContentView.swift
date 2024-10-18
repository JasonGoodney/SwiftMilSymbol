//
//  ContentView.swift
//  SwiftMilSymbolApp
//
//  Created by Jason Goodney on 8/25/24.
//

import SwiftUI
import SwiftMilSymbol

struct ContentView: View {
    let ms2525c: MilStd2525c

    init() {
        ms2525c = MilStd2525.ms2525c()!
    }
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("MilSymbol Example") {
                    OptionsView()
                        .navigationTitle("MilSymbol")
                }
                

                Section(ms2525c.name) {
                    NavigationLink(ms2525c.warfighting.name) {
                        MilStd2525cSymbols(symbolSet: ms2525c.warfighting)
                    }
                    
                    NavigationLink(ms2525c.tacticalGraphics.name) {
                        MilStd2525cSymbols(symbolSet: ms2525c.tacticalGraphics)
                    }
                    
                    NavigationLink(ms2525c.emergencyManagementSymbols.name) {
                        MilStd2525cSymbols(symbolSet: ms2525c.emergencyManagementSymbols)
                    }
                    
                    NavigationLink(ms2525c.signalsIntelligence.name) {
                        MilStd2525cSymbols(symbolSet: ms2525c.signalsIntelligence)
                    }
                    
                    NavigationLink(ms2525c.stabilityOperations.name) {
                        MilStd2525cSymbols(symbolSet: ms2525c.stabilityOperations)
                    }
                }
            }
            .navigationTitle("Example")
        }
    }
}

#Preview {
    ContentView()
}
