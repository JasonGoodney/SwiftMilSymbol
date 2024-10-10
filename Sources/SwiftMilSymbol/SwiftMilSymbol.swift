// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import JavaScriptCore
import SwiftDraw
import UIKit

public struct Symbol {
    public let sidc: String
    public let image: UIImage
    public let metadata: [AnyHashable: Any]?
}

public class MilSymbol {
    public static let shared = MilSymbol()
    
    private let vm = JSVirtualMachine()
    private var context: JSContext?
    
    private init() {
        if let resourceURL = Bundle.module.url(forResource: "SwiftMilSymbol.bundle", withExtension: "js") {
            let jsCode = try? String.init(contentsOf: resourceURL)
            context = JSContext(virtualMachine: vm)
            context?.evaluateScript(jsCode)
        }
    }
    
    public func image(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> UIImage? {
        guard let result = milSymbolResult(code, options: options) else { return nil }
        guard let dataURL = result["dataURL"] as? String else { return nil }
        return svg(dataURL)?.rasterize()
    }
    
    public func symbol(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> [AnyHashable: Any]? {
        milSymbolResult(code, options: options)
    }
    
    public func symbol(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> Symbol? {
        guard let result = milSymbolResult(code, options: options) else { return nil }
        guard let dataURL = result["dataURL"] as? String else { return nil }
        guard let image = image(dataURL: dataURL) else { return nil }
        
        let metadata = result["metadata"] as? [AnyHashable: Any]
        
        return Symbol(sidc: code, image: image, metadata: metadata)
    }
    
//    public func milStd2525c() -> [AnyHashable: Any]? {
//        guard let result = invoke("MilStd2525", "milStd2525c", withArguments: nil) else { return nil }
//        guard let resultDictionary = result.toDictionary() else { return nil }
//        return resultDictionary
//    }
    
    public func milStd2525c() throws -> MilStd2525c? {
        guard let result = invoke("MilStd2525", "milStd2525c", withArguments: nil) else { return nil }
        guard let resultDictionary = result.toDictionary() else { return nil }
        guard let json = resultDictionary.jsonData else { return nil }
        let symbolSet = try JSONDecoder().decode(MilStd2525c.self, from: json)
        return symbolSet
    }
}

extension Dictionary {
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
    }
    
    func toJSONString() -> String? {
        if let jsonData = jsonData {
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        }
        
        return nil
    }
}

extension MilSymbol {
    private func invoke(_ `class`: String, _ method: String, withArguments arguments: [Any]?) -> JSValue? {
        let jsModule = context?.objectForKeyedSubscript("SwiftMilSymbol")
        let jsAnalyzer = jsModule?.objectForKeyedSubscript(`class`)
        return jsAnalyzer?.invokeMethod(method, withArguments: arguments)
    }
    
    private func invokeMethod(_ method: String, withArguments arguments: [Any]) -> JSValue? {
        let jsModule = context?.objectForKeyedSubscript("SwiftMilSymbol")
        let jsAnalyzer = jsModule?.objectForKeyedSubscript("MilSymbol")
        return jsAnalyzer?.invokeMethod(method, withArguments: arguments)
    }
    
    private func milSymbolResult(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> [AnyHashable: Any]? {
        var args: [Any] = [code]
        if let options {
            args.append(options)
        }
        
        guard let result = invokeMethod("symbol", withArguments: args) else { return nil }
        guard let resultDictionary = result.toDictionary() else { return nil }
        guard let isValid = resultDictionary["isValid"] as? Bool, isValid else { return nil }
        
        return resultDictionary
    }
    
    private func svg(_ dataURL: String) -> SVG? {
        guard let url = URL(string: dataURL) else { return nil }
        return SVG(fileURL: url)
    }
    
    private func image(dataURL: String) -> UIImage? {
        guard let svg = svg(dataURL) else { return nil }
        return svg.rasterize()
    }
}

public protocol SymbolSet: Codable {
    var name: String { get }
    var mainIcon: [MainIcon] { get }
}

public struct MilStd2525c: Codable {
    public let war: War
    public let tacticalGraphics: TacticalGraphics
    public let emergencyManagementSymbols: EmergencyManagementSymbols
    public let stabilityOperations: StabilityOperations
    public let signalsIntelligence: SignalsIntelligence

    enum CodingKeys: String, CodingKey {
        case war = "WAR"
        case tacticalGraphics = "TACGRP"
        case emergencyManagementSymbols = "EMS"
        case stabilityOperations = "STBOPS"
        case signalsIntelligence = "SIGINT"
    }
}

public struct TacticalGraphics: SymbolSet {
    public let name: String
    public let mainIcon: [MainIcon]
}

public struct EmergencyManagementSymbols: SymbolSet {
    public let name: String
    public let mainIcon: [MainIcon]
}

public struct StabilityOperations: SymbolSet {
    public let name: String
    public let mainIcon: [MainIcon]
}

public struct SignalsIntelligence: SymbolSet {
    public let name: String
    public let mainIcon: [MainIcon]
}

// MARK: - War
public struct War: Codable {
    public let name: String
    public let seaSurface: SeaSurface
    public let air: Air
    public let sof: SpecialOperationsForces
    public let groundEquipment: GroundEquipment
    public let groundInstallation: GroundInstallation
    public let groundUnit: GroundUnit
    public let space: Space
    public let subSurface: SubSurface
    
    public var icons: [MainIcon] {
        return seaSurface.mainIcon + air.mainIcon + sof.mainIcon + groundUnit.mainIcon + groundEquipment.mainIcon + groundInstallation.mainIcon + space.mainIcon + subSurface.mainIcon
    }

    enum CodingKeys: String, CodingKey {
        case name
        case seaSurface = "SSUF"
        case air = "AIRTRK"
        case sof = "SOFUNT"
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

// MARK: - MainIcon
public struct MainIcon: Codable {
    public let status, codingscheme, name, remarks: String
    public let functionid, battledimension, affiliation, hierarchy: String
    public let names: [String?]
    
    public func sidc(_ affiliation: Affiliation) -> String {
        return codingscheme + affiliation.rawValue + battledimension + status + functionid
    }
}

public enum Affiliation: String, Codable, CaseIterable, Identifiable {
    public var id: Affiliation { self }
    
    case p = "P"
    case u = "U"
    
    case f = "F"
    case n = "N"
    case h = "H"
    case a = "A"
    case s = "S"
    
    case g = "G"
    case w = "W"
    case d = "D"
    case l = "L"
    case m = "M"
    
    case j = "J"
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
}
