//
//  TaskComplex.swift
//  RASCOcloud
//
//  Created by Robin Oster on 20/11/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

public class TaskComplex {
    
    var taskUUID:String
    var executionBlock:(finished:() -> ()) -> ()
    
    public init(executionBlock:(finished:() -> ()) -> ()) {
        self.taskUUID = NSUUID().UUIDString
        self.executionBlock = executionBlock
    }
    
    public func execute(finished:() -> ()) {
        executionBlock(finished: finished)
    }
}
