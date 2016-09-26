//
//  TaskComplex.swift
//  RASCOcloud
//
//  Created by Robin Oster on 20/11/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

open class TaskComplex {
    
    var taskUUID:String
    var executionBlock:(_ finished: @escaping () -> ()) -> ()
    
    public init(executionBlock:@escaping (_ finished: @escaping () -> ()) -> ()) {
        self.taskUUID = NSUUID().uuidString
        self.executionBlock = executionBlock
    }
    
    open func execute(_ finished: @escaping () -> ()) {
        executionBlock(finished)
    }
}
