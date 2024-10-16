//
//  MilStd2525c.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/11/24.
//

import Foundation

public struct MilStd2525c: MilStd2525c.SymbolSet {
    public let name = "MIL-STD-2525C"
    public let warfighting: Warfighting
    public let tacticalGraphics: TacticalGraphics
    public let emergencyManagementSymbols: EmergencyManagementSymbols
    public let stabilityOperations: StabilityOperations
    public let signalsIntelligence: SignalsIntelligence
    
    public var symbols: [Symbol] {
        warfighting.symbols
        + tacticalGraphics.symbols
        + emergencyManagementSymbols.symbols
        + stabilityOperations.symbols
        + signalsIntelligence.symbols
    }

    enum CodingKeys: String, CodingKey {
        case warfighting = "WAR"
        case tacticalGraphics = "TACGRP"
        case emergencyManagementSymbols = "EMS"
        case stabilityOperations = "STBOPS"
        case signalsIntelligence = "SIGINT"
    }
}

extension MilStd2525c {
    public protocol SymbolSet: Codable {
        var name: String { get }
        var symbols: [Symbol] { get }
    }
}

// MARK: - Warfighting

extension MilStd2525c {
    
    /// Warfighting (WAR)
    ///
    ///  Symbology used to plan and execute military operations in support of C2 functions.
    ///  These symbols fall into two basic categories: tactical symbols and tactical graphics.
    public struct Warfighting: SymbolSet {
        public let name: String
        public let seaSurface: SeaSurface
        public let air: Air
        public let specialOperationsForces: SpecialOperationsForces
        public let groundEquipment: GroundEquipment
        public let groundInstallation: GroundInstallation
        public let groundUnit: GroundUnit
        public let space: Space
        public let subSurface: SubSurface
        
        public var symbols: [Symbol] {
            seaSurface.symbols
            + air.symbols
            + specialOperationsForces.symbols
            + groundUnit.symbols
            + groundEquipment.symbols
            + groundInstallation.symbols
            + space.symbols
            + subSurface.symbols
        }
        
        private enum CodingKeys: String, CodingKey {
            case name
            case seaSurface = "SSUF"
            case air = "AIRTRK"
            case specialOperationsForces = "SOFUNT"
            case groundEquipment = "GRDTRK_EQT"
            case groundInstallation = "GRDTRK_INS"
            case groundUnit = "GRDTRK_UNT"
            case space = "SPC"
            case subSurface = "SBSUF"
        }
        
        /// Sea Surface (SSUF)
        public struct SeaSurface: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        /// Subsurface (SBSUF)
        public struct SubSurface: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        /// Air (AIRTRK)
        public struct Air: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        /// Special Operations Forces (SOFUNT)
        public struct SpecialOperationsForces: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        /// Space (SPC)
        public struct Space: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        /// Ground Equipment (GRDTRK_EQT)
        public struct GroundEquipment: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        /// Ground Installation (GRDTRK_INS)
        public struct GroundInstallation: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        
        /// Ground Unit (GRDTRK_UNT)
        public struct GroundUnit: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
    }
}

// MARK: - Tactical Graphics

extension MilStd2525c {
    
    /// Tactical Graphics (TACGRP)
    ///
    /// A category of warfighting symbology that provides
    /// information about objects necessary for battlefield
    /// planning and management.
    public struct TacticalGraphics: SymbolSet {
        public let name: String
        public let symbols: [Symbol]
        
        private enum CodingKeys: String, CodingKey {
            case name
            case symbols = "mainIcon"
        }
    }

}

// MARK: - Stability Operations

extension MilStd2525c {

    /// Stability Operations (STBOPS)
    ///
    /// An overarching term encompassing various military
    /// missions, tasks, and activities conducted outside
    /// the United States in coordination with other instruments
    /// of national power to maintain or reestablish a safe and
    /// secure environment, provide essential governmental services,
    /// emergency infrastructure reconstruction, and humanitarian relief.
    public struct StabilityOperations: SymbolSet {
        public let name: String
        public let symbols: [Symbol]
        
        private enum CodingKeys: String, CodingKey {
            case name
            case symbols = "mainIcon"
        }
    }

}

// MARK: - Signals Intelligence

extension MilStd2525c {
    
    /// Signals Intelligence (SIGNIT)
    ///
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
        public let symbols: [Symbol]
        
        private enum CodingKeys: String, CodingKey {
            case name
            case symbols = "mainIcon"
        }
    }

}

// MARK: - Emergency Management Symbols

extension MilStd2525c {
    
    /// Emergency Management Symbols (EMS)
    public struct EmergencyManagementSymbols: SymbolSet {
        public let name: String
        public let symbols: [Symbol]
        
        private enum CodingKeys: String, CodingKey {
            case name
            case symbols = "mainIcon"
        }
    }

}

// MARK: - Symbol

extension MilStd2525c {
    
    public struct Symbol: Codable, CustomStringConvertible {
        public let status, codingscheme, name, remarks: String
        public let functionid, battledimension, affiliation, hierarchy: String
        public let names: [String?]
        
        /// Symbol identification code
        ///
        /// An alphanumeric code based on a database structure
        /// that provides the minimum elements required to construct
        /// the basic icon and/or a complete symbol.
        ///
        /// Also called SIDC. (JP 1-02)
        public var sidc: String {
            (codingscheme + affiliation + battledimension + status + functionid).uppercased()
        }
        
        public func sidc(_ standardIdentity: StandardIdentity, status: Status = .p) -> String {
            (codingscheme + standardIdentity.rawValue + battledimension + status.rawValue + functionid).uppercased()
        }
        
        public var description: String {
            """
            \(hierarchy)
            \(names.compactMap { $0 }.joined(separator: "\n"))
            SIDC: \(sidc.uppercased())
            """
        }
    }
}

// MARK: - Standard Identity

extension MilStd2525c {
    
    /// Standard Identity (Affiliation) refers to the threat posed by the warfighting object being represented.
    public enum StandardIdentity: String, Codable, CaseIterable, Identifiable, CustomStringConvertible {
        public var id: StandardIdentity { self }
        
        /// PENDING (P)
        ///
        /// A track which has not been subjected to the identification process. (MIL-STD-6016)
        case p = "P"
        
        /// UNKNOWN (U)
        ///
        /// An identity applied to an evaluated track which that
        /// has not been identified. (MIL-STD-6016) (JP 1-02)
        case u = "U"
        
        /// FRIEND (F)
        ///
        /// A track belonging to a declared friendly nation. (MIL-STD-6016)
        case f = "F"
        
        /// NEUTRAL (N)
        ///
        /// A track or contact whose characteristics, behavior, origin,
        /// or nationality indicate that it is neither supporting nor
        /// opposing friendly forces. (MIL-STD-6016)
        case n = "N"
        
        /// HOSTILE (H)
        ///
        /// A track declared to belong to any opposing nation, party,
        /// group, or entity, which by virtue of its behavior or information
        /// collected on it such as characteristics, origin or nationality
        /// contributes to the threat to friendly forces. (MIL-STD-6016)
        case h = "H"
        
        /// ASSUMED FRIEND (A)
        ///
        /// A track which is assumed to be a friend because of
        /// its characteristics, behavior, or origin. (MIL-STD-6016)
        case a = "A"
        
        /// SUSPECT (S)
        ///
        /// An identity applied to a track that is potentially hostile
        /// because of its characteristics, behavior, origin, or
        /// nationality. (JP 1-02; Source: JP 3-07.4)
        case s = "S"
        
        /// EXERCISE PENDING (G)
        case g = "G"
        
        /// EXERCISE UNKNOWN (W)
        case w = "W"
        
        /// EXERCISE FRIEND (D)
        case d = "D"
        
        /// EXERCISE NEUTRAL (L)
        case l = "L"
        
        /// EXERCISE ASSUMED FRIEND (M)
        case m = "M"
        
        /// JOKER (J)
        ///
        /// A friendly track as a suspect for exercise purposes. (MIL-STD-6016)
        case j = "J"
        
        /// FAKER (K)
        ///
        /// A friendly track acting as a hostile for exercise purposes. (MIL-STD-6016)
        case k = "K"
        
        public var name: String {
            switch self {
            case .p: "PENDING"
            case .u: "UNKNOWN"
            case .f: "FRIEND"
            case .n: "NEUTRAL"
            case .h: "HOSTILE"
            case .a: "ASSUMED FRIEND"
            case .s: "SUSPECT"
            case .g: "EXERCISE PENDING"
            case .w: "EXERCISE UNKNOWN"
            case .d: "EXERCISE FRIEND"
            case .l: "EXERCISE NEUTRAL"
            case .m: "EXERCISE ASSUMED FRIEND"
            case .j: "JOKER"
            case .k: "FAKER"
            }
        }
        
        public var description: String {
            "\(name) (\(rawValue))"
        }
        
        /// Basic standard identities: UNKNOWN, FRIEND, NEUTRAL, HOSTILE.
        static var basic: [StandardIdentity] {
            [.u, .f, .n, .h]
        }
    }
}

// MARK: - Battle Dimension

extension MilStd2525c {
    
    /// Battle dimension indicates the primary mission area of the object being symbolized.
    public enum BattleDimension: String, Codable, CaseIterable, Identifiable, CustomStringConvertible {
        public var id: BattleDimension { self }
        
        /// Unknown (Z)
        case z = "Z"
        
        /// Space (P)
        case p = "P"
        
        /// Air (A)
        case a = "A"
        
        /// Ground (G)
        case g = "G"
        
        /// Sea Surface (S)
        case s = "S"
        
        /// Subsurface (U)
        case u = "U"
        
        /// SOF (F)
        case f = "F"
        
        /// Other (no frame)
        case x = "X"
        
        public var name: String {
            switch self {
            case .z: "UNKNOWN"
            case .p: "SPACE"
            case .a: "AIR"
            case .g: "GROUND"
            case .s: "SEA SURFACE"
            case .u: "SEA SUBSURFACE"
            case .f: "SOF"
            case .x: "OTHER"
            }
        }
        
        public var description: String {
            "\(name) (\(rawValue))"
        }
    }

}

// MARK: - Status

extension MilStd2525c {
    
    /// Status indicates whether an object is at the portrayed location or is intended
    /// or projected to be at that location at some point in time in the future.
    public enum Status: String, Codable, CaseIterable, Identifiable, CustomStringConvertible {
        public var id: Status { self }
        
        /// ANTICIPATED/PLANNED (A)
        case a = "A"
        
        /// PRESENT (Units only) (P)
        case p = "P"
        
        /// PRESENT/FULLY CAPABLE (C)
        case c = "C"
        
        /// PRESENT/DAMAGED (D)
        case d = "D"
        
        /// PRESENT/DESTROYED (X)
        case x = "X"
        
        /// PRESENT/FULL TO CAPACITY (X)
        case f = "F"
        
        public var name: String {
            switch self {
            case .a: "ANTICIPATED"
            case .p: "PRESENT"
            case .c: "FULLY CAPABLE"
            case .d: "DAMAGED"
            case .x: "DESTROYED"
            case .f: "FULL TO CAPACITY"
            }
        }
        
        public var description: String {
            "\(name) (\(rawValue))"
        }
    }
}
