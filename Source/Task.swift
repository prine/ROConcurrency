//
//  Task.swift
//  RASCOcloud
//
//  Created by Robin Oster on 20/11/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

public class Task {
    
    var taskUUID:String
    var executionBlock:() -> ()
    
    public init(executionBlock:() -> ()) {
        self.taskUUID = NSUUID().UUIDString
        self.executionBlock = executionBlock
    }
    
    public func execute(finished:() -> ()) {
        executionBlock()
        finished()
    }
}
