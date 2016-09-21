//
//  Task.swift
//  RASCOcloud
//
//  Created by Robin Oster on 20/11/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

open class Task {
    
    var taskUUID:String
    var executionBlock:() -> ()
    
    public init(executionBlock:@escaping () -> ()) {
        self.taskUUID = UUID().uuidString
        self.executionBlock = executionBlock
    }
    
    open func execute(_ finished:() -> ()) {
        executionBlock()
        finished()
    }
}
