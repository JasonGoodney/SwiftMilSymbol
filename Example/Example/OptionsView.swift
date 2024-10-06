//
//  Untitled.swift
//  Example
//
//  Created by Jason Goodney on 10/6/24.
//

import SwiftUI
import SwiftMilSymbol

struct OptionsView: View {
    let milSymbol = MilSymbol.shared
    
    var body: some View {
        if let image = milSymbol.image("sfgpewrh--mt", options: [
            "size": 35,
            "quantity": 200,
            "staffComments": "for reinforcements".uppercased(),
            "additionalInformation": "added support for JJ".uppercased(),
            "direction": (750 * 360) / 6400,
            "type": "machine gun".uppercased(),
            "dtg": "30140000ZSEP97",
            "location": "0900000.0E570306.0N"
        ]) {
            Image(uiImage: image)
        }
    }
}

#Preview {
    OptionsView()
}
