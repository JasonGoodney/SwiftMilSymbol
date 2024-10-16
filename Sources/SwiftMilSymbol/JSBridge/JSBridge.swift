//
//  JSBridge.swift
//  SwiftMilSymbol
//
//  Created by Jason Goodney on 10/11/24.
//

import JavaScriptCore

package class JSBridge {
    enum Error: Swift.Error {
        case invoke(String, String, String)
    }
    
    package static let shared = JSBridge()
    
    private let vm = JSVirtualMachine()
    private var context: JSContext!
    
    private init() {
        guard
            let resourceURL = Bundle.module.url(forResource: "SwiftMilSymbol.bundle", withExtension: "js"),
            let jsCode = try? String.init(contentsOf: resourceURL)
        else {
            fatalError("Resource not found: SwiftMilSymbol.bundle.js")
        }
        
        context = JSContext(virtualMachine: vm)
        context.evaluateScript(jsCode)
    }
    
    package func invoke(`class`: String, method: String, withArguments arguments: [Any]?) throws -> JSValue {
        guard
            let jsModule = context.objectForKeyedSubscript("SwiftMilSymbol"),
            let jsAnalyzer = jsModule.objectForKeyedSubscript(`class`),
            let jsValue = jsAnalyzer.invokeMethod(method, withArguments: arguments)
        else {
            throw JSBridge.Error.invoke("SwiftMilSymbol", `class`, method)
        }
        
        return jsValue
    }
}
