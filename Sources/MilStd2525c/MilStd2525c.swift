//
//  MilStd2525c.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/11/24.
//

import Foundation

public struct MilStd2525c: Codable {
    public let warfighting: Warfighting
    public let tacticalGraphics: TacticalGraphics
    public let emergencyManagementSymbols: EmergencyManagementSymbols
    public let stabilityOperations: StabilityOperations
    public let signalsIntelligence: SignalsIntelligence

    enum CodingKeys: String, CodingKey {
        case warfighting = "WAR"
        case tacticalGraphics = "TACGRP"
        case emergencyManagementSymbols = "EMS"
        case stabilityOperations = "STBOPS"
        case signalsIntelligence = "SIGINT"
    }
}
