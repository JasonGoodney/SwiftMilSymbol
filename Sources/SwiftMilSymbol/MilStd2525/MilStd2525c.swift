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

extension MilStd2525c {
    public protocol SymbolSet: Codable {
        var name: String { get }
        var symbols: [Symbol] { get }
    }
}

// MARK: - Warfighting

extension MilStd2525c {
    
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
        
        public struct SeaSurface: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        public struct SubSurface: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        public struct Air: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        public struct SpecialOperationsForces: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        public struct Space: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        public struct GroundEquipment: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
        public struct GroundInstallation: SymbolSet {
            public let name: String
            public let symbols: [Symbol]
            
            private enum CodingKeys: String, CodingKey {
                case name
                case symbols = "mainIcon"
            }
        }
        
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

// MARK: - TacticalGraphics

extension MilStd2525c {
    
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

// MARK: - StabilityOperations

extension MilStd2525c {
    
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

// MARK: - SignalsIntelligence

extension MilStd2525c {
    
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

// MARK: - EmergencyManagementSymbols

extension MilStd2525c {
    
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
            case .p:
                "PENDING"
            case .u:
                "UNKNOWN"
            case .f:
                "FRIEND"
            case .n:
                "NEUTRAL"
            case .h:
                "HOSTILE"
            case .a:
                "ASSUMED FRIEND"
            case .s:
                "SUSPECT"
            case .g:
                "EXERCISE PENDING"
            case .w:
                "EXERCISE UNKNOWN"
            case .d:
                "EXERCISE FRIEND"
            case .l:
                "EXERCISE NEUTRAL"
            case .m:
                "EXERCISE ASSUMED FRIEND"
            case .j:
                "JOKER"
            case .k:
                "FAKER"
            }
        }
        
        public var description: String {
            "\(name) (\(rawValue))"
        }
    }
    
    static var basic: [StandardIdentity] {
        [.u, .f, .n, .h]
    }
}

// MARK: - Battle Dimension

extension MilStd2525c {
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
            case .z:
                "Unknown"
            case .p:
                "Space"
            case .a:
                "Air"
            case .g:
                "Ground"
            case .s:
                "Sea Surface"
            case .u:
                "Subsurface"
            case .f:
                "SOF"
            case .x:
                "Other"
            }
        }
        
        public var description: String {
            "\(name) (\(rawValue))"
        }
    }

}

// MARK: - Status

extension MilStd2525c {
    public enum Status: String, Codable, CaseIterable, Identifiable {
        public var id: Status { self }
        
        /// ANTICIPATED/PLANNED
        case a = "A"
        
        /// PRESENT (Units only)
        case p = "P"
        
        /// PRESENT/FULLY CAPABLE
        case c = "C"
        
        /// PRESENT/DAMAGED
        case d = "D"
        
        /// PRESENT/DESTROYED
        case x = "X"
        
        /// PRESENT/FULL TO CAPACITY
        case f = "F"
    }
}
