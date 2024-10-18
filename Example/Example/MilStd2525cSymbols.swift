//
//  MilStd2525cSymbols.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol

private typealias BattleDimension = MilStd2525c.BattleDimension
private typealias Symbol = MilStd2525c.Symbol
private typealias StandardIdentity = MilStd2525c.StandardIdentity

struct MilStd2525cSymbols: View {
    @State private var searchQuery = ""
    @State private var affiliation: StandardIdentity = .friend
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    private var battleDimensions: [BattleDimension: [Symbol]] = [:]
    
    let symbolSet: MilStd2525c.SymbolSet
    
    init(symbolSet: MilStd2525c.SymbolSet) {
        self.symbolSet = symbolSet
        
        for bd in BattleDimension.allCases {
            battleDimensions[bd] = symbolSet.symbols.filter { $0.battleDimension.uppercased() == bd.rawValue }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders]) {
                ForEach(BattleDimension.allCases) { bd in
                    let codes = battleDimensions[bd]!.filter {
                        if searchQuery.isEmpty {
                            return true
                        } else {
                            return $0.name.lowercased().contains(searchQuery.lowercased())
                        }
                    }
                    .map { icon in icon.sidc(affiliation) }
                    
                    if !codes.isEmpty {
                        Section {
                            ForEach(codes, id: \.self) { sidc in
                                if let image = MilSymbol.image(sidc) {
                                    VStack(alignment: .center) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 35)
                                        Text(sidc)
                                            .font(.caption2)
                                    }
                                }
                            }
                        } header: {
                            HStack {
                                Text(bd.description)
                                Spacer()
                            }
                            .padding(10)
                            .background(Color(uiColor: .systemBackground))
                        }
                    }
                }
            }
        }
        .navigationTitle(symbolSet.name)
        .searchable(text: $searchQuery)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Picker(selection: $affiliation) {
                        ForEach(StandardIdentity.allCases) { aff in
                            let image = MilSymbol.image("S\(aff.rawValue)G---------")!
                            HStack {
                                Text(aff.description)
                                Spacer()
                                Image(uiImage: image)
                            }
                        }
                    } label: {
                        Text("Standard Identity")
                    }
                } label: {
                    let image = MilSymbol.image("S\(affiliation.rawValue)G---------")!
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
            }
        }
    }
}

#Preview {
    MilStd2525cSymbols(symbolSet: MilStd2525.ms2525c()!.warfighting)
}
