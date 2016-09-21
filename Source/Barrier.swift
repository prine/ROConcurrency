//
//  Barrier.swift
//  RASCOcloud
//
//  Created by Robin Oster on 15/10/14.
//  Copyright (c) 2014 Robin Oster. All rights reserved.
//

import Foundation

open class Barrier {
    
    var tasks:[Task]
    var afterTask:Task
    
    var taskStatus:[String : Bool]
    
    var logger = SynchronizedLogger.sharedInstance
    
    var verbose:Bool
    
    public init(tasks:[Task], afterTask:Task, verbose:Bool = false) {
        self.tasks = tasks
        self.afterTask = afterTask
        self.verbose = verbose
        
        // Initialize the taskStatus, mark everyone as false (unfinished)
        self.taskStatus = [String : Bool]()
        
        for task in self.tasks {
            self.taskStatus[task.taskUUID] = false
        }
    }
    
    open func startTasks() -> () {
        
        // Start executing all tasks asynchrously and monitor their finish status
        for task in self.tasks {
            
            DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.background).async(execute: {
                
                if self.verbose { self.logger.log("Execute Task: \(task.taskUUID)") }
                
                // Execute asynchronously
                task.execute({() -> () in
                    
                    if self.verbose { self.logger.log("TASK finished: \(task.taskUUID)") }
                    
                    // Mark task as finished
                    self.taskStatus[task.taskUUID] = true
                    
                    // Check if all tasks are finished
                    if self.allTasksFinished() {
                        self.afterTask.execute({() -> () in
                            if self.verbose { self.logger.log("After tasked finished!") }
                        })
                    }
                })
                
            })
        }
    }
    
    open func allTasksFinished() -> Bool {
        return Array(self.taskStatus.values).filter{$0 == false}.count == 0
    }
}
