//
//  TaskOperation.swift
//  RoadTripcaster
//
//  Created by Kranthion 5/11/18.
//  Copyright © 2018 Kranthi. All rights reserved.
//

import UIKit

class TaskOperation: Operation {
    let task: URLSessionTask
    
    init(task: URLSessionTask) {
        self.task = task
        
        // Start the task
        task.resume()
        super.init()
    }

}
