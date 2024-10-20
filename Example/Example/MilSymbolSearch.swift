//
//  MilSymbolSearch.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol

struct MilSymbolSearch: View {
    @State private var sidcInput = "SFG*EWRH--"
    @State private var sidcOutput = ""
    @State private var undefinedSidcOutput = ""
    @State private var ms2525cSymbol: MilStd2525c.Symbol?
    
    let symbols: [MilStd2525c.Symbol]
    
    init() {
        symbols = MilStd2525.ms2525c()?.symbols ?? []
    }
    
    var body: some View {
        List {
            TextField("SIDC", text: $sidcInput)
                .textInputAutocapitalization(.characters)
                .onChange(of: sidcInput) {
                    setSidcOutput(sidcInput)
                    findSymbol(sidcInput)
                }
            
            if let image = MilSymbol.symbol(sidcOutput)?.image {
                Section("Symbol") {
                    Image(uiImage: image)
                }
            }
            
            if let symbol = ms2525cSymbol {
                Section("Description")  {
                    VStack(alignment: .leading) {
                        Text(symbol.hierarchy)
                            .fontWeight(.bold)
                        
                        ForEach(symbol.names.indices, id: \.self) { index in
                            Text(symbol.names[index])
                                .foregroundStyle(index == symbol.names.count - 1 ? .primary : .secondary)
                                .fontWeight(index == symbol.names.count - 1 ? .bold : .regular)
                        }
                        
                        HStack(spacing: 0) {
                            Text("SIDC: ")
                                .foregroundStyle(.secondary)
                            Text(symbol.sidc)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .onAppear {
            setSidcOutput(sidcInput)
        }
    }
    
    func setSidcOutput(_ sidc: String) {
        sidcOutput = sidc
                            
        var sidcArray = Array(sidc).map { String($0) }
        if sidcArray.count < 10 {
            let diff = 10 - sidcArray.count
            let unused = Array(repeating: "-", count: diff)
            sidcArray.append(contentsOf: unused)
        }
        
        if sidcArray.count > 1 {
            sidcArray[1] = "*"
        }
        if sidcArray.count > 3 {
            sidcArray[3] = "*"
        }
        undefinedSidcOutput = sidcArray.joined(separator: "")
        print(undefinedSidcOutput)
    }
    
    func findSymbol(_ sidc: String) {
        ms2525cSymbol = symbols.first(where: { undefinedSidcOutput == $0.sidc || undefinedSidcOutput.hasPrefix($0.sidc) })
    }
}

#Preview {
    MilSymbolSearch()
}
