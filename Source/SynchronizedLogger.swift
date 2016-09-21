//
//  SynchronizedLogger.swift
//  RASCOcloud
//
//  Created by Robin Oster on 15/10/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

open class SynchronizedLogger {
    
    var dateFormatter = DateFormatter()
    
    public init() {
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.short
    }
    
    open func log(_ message:String) -> () {
        Lock.synchronize(self) {
            let date = Date()
            print("\(self.dateFormatter.string(from: date)) - \(message)")
        }
    }
    
    // PRAGMA MARK: - Singleton -
    open class var sharedInstance: SynchronizedLogger {
        struct Singleton {
            static let instance = SynchronizedLogger()
        }
        
        return Singleton.instance
    }
}
