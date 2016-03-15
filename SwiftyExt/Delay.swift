//
//  Delay.swift
//  SwiftyExt
//
//  Created by awd on 16/3/15.
//  Copyright © 2016年 awd. All rights reserved.
//

import Foundation
typealias Task = (cancle:Bool) -> Void

func delay(time:NSTimeInterval, task:()->()) -> Task? {
    func dispatch_later(block:()->()) {
        let dis_time = dispatch_time(DISPATCH_TIME_NOW, Int64(time*Double(NSEC_PER_SEC)))
        dispatch_after(dis_time, dispatch_get_main_queue(), block)
    }
    
    var closure:dispatch_block_t? = task
    var result: Task?
    
    let delayedClosure: Task = { cancel in
        if let internalClosure = closure {
            if cancel == false {
                dispatch_async(dispatch_get_main_queue(), internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(cancle: false)
        }
    }
    return result
}

func cancle (task:Task?) {
    task?(cancle:true)
}

