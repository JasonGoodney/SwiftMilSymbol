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
}

extension MilSymbol {
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
