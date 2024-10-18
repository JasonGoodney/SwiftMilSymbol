//
//  WarfightingSymbols.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol

typealias BattleDimension = MilStd2525c.BattleDimension
typealias Symbol = MilStd2525c.Symbol
typealias StandardIdentity = MilStd2525c.StandardIdentity

struct WarfightingSymbols: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    var battleDimensions: [BattleDimension: [Symbol]] = [:]
    
    init() {
       let warfighting = MilStd2525.ms2525c()!.warfighting
        for bd in BattleDimension.allCases {
            battleDimensions[bd] = warfighting.symbols.filter { $0.battledimension.uppercased() == bd.rawValue }
        }
    }
    
    @State private var searchQuery = ""
    @State private var affiliation: StandardIdentity = .f
    
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
    WarfightingSymbols()
}
