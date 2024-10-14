//
//  StandardIdentity.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/11/24.
//

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
        }
    }
    
    public var description: String {
        "\(name) (\(rawValue))"
    }
}
