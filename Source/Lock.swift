//
//  Lock.swift
//  RASCOcloud
//
//  Created by Robin Oster on 15/10/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

public class Lock {
    
    public class func synchronize(lock: AnyObject, closure: () -> ()) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }
}