//
//  SignalsIntelligence.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/13/24.
//

/// 1. A category of intelligence comprising either individually
/// or in combination all communications intelligence, electronics
/// intelligence, and foreign instrumentation signals intelligence,
/// however transmitted.
///
/// 2. Intelligence derived from communications, electronics, and
/// foreign instrumentation signals.
///
/// Also called SIGINT. (JP 1-02. Source: JP 2-0)
public struct SignalsIntelligence: SymbolSet {
    public let name: String
    public let mainIcon: [MainIcon]
}
