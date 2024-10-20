// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftDraw
import UIKit

/// Available symbol options: https://github.com/spatialillusions/milsymbol/blob/master/src/ms/symbol.js
public typealias SymbolOptions = [AnyHashable: Any]

public typealias SymbolMetadata = [AnyHashable: Any]

public enum MilSymbol {
    
    public static func image(
        _ code: String,
        options: SymbolOptions? = nil
    ) -> UIImage? {
        guard let result = milSymbolResult(code, options: options) else { return nil }
                
        return image(dataURL: result["dataURL"] as? String)
    }
    
    public static func symbol(
        _ code: String,
        options: SymbolOptions? = nil
    ) -> Symbol? {
        guard let result = milSymbolResult(code, options: options) else { return nil }

        return Symbol(
            sidc: result["sidc"] as? String ?? code,
            svg: result["svg"] as? String,
            dataURL: result["dataURL"] as? String,
            metadata: result["metadata"] as? SymbolMetadata,
            options: result["options"] as? SymbolOptions
        )
    }
    
    public static func symbolDictionary(
        _ code: String,
        options: SymbolOptions? = nil
    ) -> [AnyHashable: Any]? {
        milSymbolResult(code, options: options)
    }
}

extension MilSymbol {
    public struct Symbol {
        public let sidc: String
        public let svg: String?
        public let dataURL: String?
        public let metadata: SymbolMetadata?
        public let options: SymbolOptions?
        
        public var image: UIImage? {
            guard let dataURL else { return nil }
            guard let url = URL(string: dataURL) else { return nil }
            guard let svg =  SVG(fileURL: url) else { return nil }
            return svg.rasterize()
        }
    }
}

extension MilSymbol {
    private static func milSymbolResult(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> [AnyHashable: Any]? {
        var args: [Any] = [code]
        if let options {
            args.append(options)
        }
        
        do {
            let result = try JSBridge.shared.invoke(class: "MilSymbol", method: "symbol", withArguments: args)
            guard let resultDictionary = result.toDictionary() else { return nil }
            guard let isValid = resultDictionary["isValid"] as? Bool, isValid else { return nil }
            
            return resultDictionary
        } catch {
            print(error)
            return nil
        }
    }

    private static func svg(_ dataURL: String?) -> SVG? {
        guard let dataURL else { return nil }
        guard let url = URL(string: dataURL) else { return nil }
        return SVG(fileURL: url)
    }
    
    private static func image(dataURL: String?) -> UIImage? {
        guard let svg = svg(dataURL) else { return nil }
        return svg.rasterize()
    }
}
