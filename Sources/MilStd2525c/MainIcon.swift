//
//  Symbol.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/13/24.
//

import Foundation
import UIKit

public struct MainIcon: Codable, CustomStringConvertible {
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
