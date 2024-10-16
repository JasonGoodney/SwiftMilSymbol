//
//  Untitled.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol

struct OptionsView: View {
    let sidc = "SFG*EWRH--MT"
    
    var body: some View {
        List {
            if let image = MilSymbol.image(sidc, options: [
                "size": 35,
                "quantity": 200,
                "staffComments": "for reinforcements".uppercased(),
                "additionalInformation": "added support for JJ".uppercased(),
                "direction": (750 * 360) / 6400,
                "type": "machine gun".uppercased(),
                "dtg": "30140000ZSEP97",
                "location": "0900000.0E570306.0N"
            ]) {
                Section("Symbol") {
                    Image(uiImage: image)
                }
            }
            
            if let symbol = MilStd2525.ms2525c()?.warfighting.symbols.first(where: { "S*G*EWRH--MT".hasPrefix($0.sidc) }) {
                Section("Description")  {
                    VStack(alignment: .leading) {
                        Text(symbol.hierarchy)
                            .fontWeight(.bold)
                        
                        ForEach(symbol.names.indices, id: \.self) { index in
                            if let name = symbol.names[index] {
                                Text(name)
                                    .foregroundStyle(index == symbol.names.count - 1 ? .primary : .secondary)
                                    .fontWeight(index == symbol.names.count - 1 ? .bold : .regular)
                            }
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
    }
}

#Preview {
    OptionsView()
}
