//
//  MilStd2525.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/11/24.
//

import Foundation
import Shared
import MilStd2525c

public struct MilStd2525 {
    public static func ms2525c() -> MilStd2525c? {
        do {
            let json = try JSONSerialization.data(withJSONObject: ms2525cDictionary(), options: [.prettyPrinted])
            let symbolSet = try JSONDecoder().decode(MilStd2525c.self, from: json)
            return symbolSet
        } catch {
            print(error)
            return nil
        }
    }
    
    public static func ms2525cDictionary() -> [AnyHashable: Any]? {
        do {
            let result = try JSBridge.shared.invoke(class: "MilStd2525", method: "milStd2525c", withArguments: nil)
            return result.toDictionary()
        } catch {
            print(error)
            return nil
        }
    }
}
