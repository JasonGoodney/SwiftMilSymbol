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
    private init() {}
    
    public static func ms2525c() -> MilStd2525c? {
        do {
            guard let jsonObject = ms2525cDictionary() else { return nil }
            let json = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
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
