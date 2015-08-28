//
//  SynchronizedLogger.swift
//  RASCOcloud
//
//  Created by Robin Oster on 15/10/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

class SynchronizedLogger {
    
    var dateFormatter = NSDateFormatter()
    
    init() {
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
    }
    
    func log(message:String) -> () {
        Lock.synchronize(self) {
            let date = NSDate()
            print("\(self.dateFormatter.stringFromDate(date)) - \(message)")
        }
    }
    
    // PRAGMA MARK: - Singleton -
    class var sharedInstance: SynchronizedLogger {
        struct Singleton {
            static let instance = SynchronizedLogger()
        }
        
        return Singleton.instance
    }
}