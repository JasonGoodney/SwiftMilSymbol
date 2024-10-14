//
//  GridView.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol
import MilStd2525c

struct MilStd2525CView: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
    var battleDimensions: [BattleDimension: [MainIcon]] = [:]
    
    init() {
       let warfighting = MilStd2525.ms2525c()!.warfighting
        for bd in BattleDimension.allCases {
            battleDimensions[bd] = warfighting.mainIcon.filter { $0.battledimension.uppercased() == bd.rawValue }
        }
    }
    
    @State private var searchQuery = ""
    @State private var affiliation: StandardIdentity = .f
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders]) {
                ForEach(BattleDimension.allCases) { bd in
                    Section {
                        let codes = battleDimensions[bd]!.filter {
                            if searchQuery.isEmpty {
                                return true
                            } else {
                                return $0.name.lowercased().contains(searchQuery.lowercased())
                            }
                        }
                        .map { icon in icon.sidc(affiliation) }
                        
                        ForEach(codes, id: \.self) { sidc in
                            if let image = MilSymbol.image(sidc) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
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
    MilStd2525CView()
}
