//
//  Delay.swift
//  ROConcurrency
//
//  Created by Robin Oster on 11/12/15.
//  Copyright © 2015 Rascor International AG. All rights reserved.
//

import Foundation

public typealias dispatch_cancelable_closure = (cancel:Bool) -> ()

/**
 Provides helper methods for delaying closures
*/
public class Delay {
    
    /**
     Delay a call for a given time (The call is during that wait cancable)
    
     - parameters: 
        - time it is delayed (in seconds, default 0.5 seconds)
        - closure block which will be executed
     
     - returns: cancelable closure block
    
    */
    public static func delayCall(time:NSTimeInterval = 0.5, closure:()->()) ->  dispatch_cancelable_closure? {
        func dispatch_later(clsr:()->()) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(time * Double(NSEC_PER_SEC))
                ),
                dispatch_get_main_queue(), clsr)
        }
        
        var closure:dispatch_block_t? = closure
        var cancelableClosure:dispatch_cancelable_closure?
        
        let delayedClosure:dispatch_cancelable_closure = { cancel in
            if closure != nil {
                if (cancel == false) {
                    dispatch_async(dispatch_get_main_queue(), closure!);
                }
            }
            closure = nil
            cancelableClosure = nil
        }
        
        cancelableClosure = delayedClosure
        
        dispatch_later {
            if let delayedClosure = cancelableClosure {
                delayedClosure(cancel: false)
            }
        }
        
        return cancelableClosure;
    }
    
    /**
     Cancel the referenced closure block
     
     - parameters:
     - closure block which is currently in wait
     
     */
    public static func cancelDelayCall(closure:dispatch_cancelable_closure?) {
        if closure != nil {
            closure!(cancel: true)
        }
    }

}