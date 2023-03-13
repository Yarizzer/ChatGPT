//
//  Logger.swift
//  ChatGPT
//
//  Created by Yaroslav Abaturov on 20.01.2023.
//

import Foundation

enum LogMessageType {
    case info, debug, warning, error, coreDataError
    
    var value: String {
        switch self {
        case .info: return "Info"
        case .debug: return "Debug"
        case .warning: return "Warning"
        case .error: return "Error"
        case .coreDataError: return "CoreData Error"
        }
    }
}

func writeLog(type: LogMessageType, message: String, functionName:  String = #function, fileNameWithPath: String = #file, lineNumber: Int = #line ) {
    let fileNameWithoutPath = (fileNameWithPath as NSString).lastPathComponent
    let functionName = functionName
    let type = type.value
    let message = message
    let lineNumber = lineNumber
    NSLog("\(type): [\(functionName) in file \(fileNameWithoutPath) line: \(lineNumber)] \(message)")
}

