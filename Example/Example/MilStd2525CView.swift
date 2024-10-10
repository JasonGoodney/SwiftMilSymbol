//
//  GridView.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol

struct MilStd2525CView: View {
    let milSymbol = MilSymbol.shared
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
    
    var codes: [String] {
        Affiliation.allCases.flatMap { aff in
            try! milSymbol.milStd2525c()!.war.icons.map { icon in icon.sidc(aff)
            }
        }
        
    }
    
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: [.sectionHeaders]) {
                    ForEach(Affiliation.allCases) { aff in
                        Section {
                            let codes = try! milSymbol.milStd2525c()!.war.icons.filter {
                                if searchQuery.isEmpty {
                                    return true
                                } else {
                                    return $0.name.lowercased().contains(searchQuery.lowercased())
                                }
                            }
                            .map { icon in icon.sidc(aff) }
                            
                            ForEach(codes, id: \.self) { sidc in
                                if let image = milSymbol.image(sidc) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                }
                            }
                        } header: {
                            HStack {
                                Text(aff.name)
                                Spacer()
                            }
                            .padding()
                            .background(.gray)
                        }
                    }
                }
            }
            .searchable(text: $searchQuery)
        }
    }
}

#Preview {
    GridView()
}
