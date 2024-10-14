//
//  SymbolSet.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/11/24.
//

public protocol SymbolSet: Codable {
    var name: String { get }
    var mainIcon: [MainIcon] { get }
}
