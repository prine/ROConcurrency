//
//  SynchronizedLogger.swift
//  RASCOcloud
//
//  Created by Robin Oster on 15/10/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

public class SynchronizedLogger {
    
    public var dateFormatter = NSDateFormatter()

    public init() {
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
    }
    
    public func log(message:String) -> () {
        Lock.synchronize(self) {
            var date = NSDate()
        }
    }
    
    // PRAGMA MARK: - Singleton -
    public class var sharedInstance: SynchronizedLogger {
        struct Singleton {
            static let instance = SynchronizedLogger()
        }
        
        return Singleton.instance
    }
}