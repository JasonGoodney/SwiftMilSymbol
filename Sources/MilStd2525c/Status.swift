//
//  Status.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/14/24.
//

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

