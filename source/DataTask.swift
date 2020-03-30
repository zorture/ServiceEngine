//
//  DataTask.swift
//  RoadTripcaster
//
//  Created by Kranthion 5/11/18.
//  Copyright © 2018 Kranthi. All rights reserved.
//

import Foundation

class DataTask {
    
    fileprivate var successHandler: TaskSuccessHandler?
    fileprivate var failureHandler: TaskFailureHandler?
    fileprivate let restAdapter = RestAdapter.sharedRestAdapter
    
    func createRequestWith(urlString: String) throws {
        
        // Set String
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { throw  ExecutionExceptions.InvalidURLString }
        
        // Set URL
        guard let url = URL.init(string: urlString) else { throw ExecutionExceptions.InvalidURL }
        
        // Execute the data Task
        let task = restAdapter.session.dataTask(with: url) { (data, response, error) in
            self.processResponse(data: data, response: response, error: error)
        }
        
        // Add task to operation Q
        let taskOperation = TaskOperation.init(task: task)
        restAdapter.addData(withTaskOperation: taskOperation)
    }
    
    func executeTaskWithResponse( successHandler: @escaping TaskSuccessHandler, failureHandler: @escaping TaskFailureHandler) {
        self.successHandler = successHandler
        self.failureHandler = failureHandler
    }
    
    private func processResponse(data: Data?, response: URLResponse?, error: Error?) {
        
        guard let data = data else {
            guard let error = error else {
                return
            }
            failureHandler?(error)
            return
        }
        successHandler?(data)
    }
}

