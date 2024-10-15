//
//  BattleDimension.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/14/24.
//


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
