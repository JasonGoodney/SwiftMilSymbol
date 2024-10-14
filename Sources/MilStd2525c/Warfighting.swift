//
//  Warfighting.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/13/24.
//

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
    
    public var mainIcon: [MainIcon] {
        seaSurface.mainIcon
        + air.mainIcon
        + specialOperationsForces.mainIcon
        + groundUnit.mainIcon
        + groundEquipment.mainIcon
        + groundInstallation.mainIcon
        + space.mainIcon
        + subSurface.mainIcon
    }

    enum CodingKeys: String, CodingKey {
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
        public let mainIcon: [MainIcon]
        
    }
    
    public struct SubSurface: SymbolSet {
        public let name: String
        public let mainIcon: [MainIcon]
        
    }
    
    public struct Air: SymbolSet {
        public let name: String
        public let mainIcon: [MainIcon]
        
    }
    
    public struct SpecialOperationsForces: SymbolSet {
        public let name: String
        public let mainIcon: [MainIcon]
        
    }
    
    public struct Space: SymbolSet {
        public let name: String
        public let mainIcon: [MainIcon]
        
    }
    
    public struct GroundEquipment: SymbolSet {
        public let name: String
        public let mainIcon: [MainIcon]
        
    }
    
    public struct GroundInstallation: SymbolSet {
        public let name: String
        public let mainIcon: [MainIcon]
        
    }
    
    public struct GroundUnit: SymbolSet {
        public let name: String
        public let mainIcon: [MainIcon]
        
    }
}
