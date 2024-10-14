// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftDraw
import UIKit
import Shared

public class MilSymbol {
    private init() {}
    
    public static func image(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> UIImage? {
        guard let result = milSymbolResult(code, options: options) else { return nil }
                
        return image(dataURL: result["dataURL"] as? String)
    }
    
    public static func symbolDictionary(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> [AnyHashable: Any]? {
        milSymbolResult(code, options: options)
    }
    
    public static func symbol(
        _ code: String,
        options: [AnyHashable: Any]? = nil
    ) -> Symbol? {
        guard let result = milSymbolResult(code, options: options) else { return nil }
        guard let image = image(dataURL: result["dataURL"] as? String) else { return nil }
        
        let metadata = result["metadata"] as? [AnyHashable: Any]
        
        return Symbol(sidc: code, image: image, metadata: metadata)
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
