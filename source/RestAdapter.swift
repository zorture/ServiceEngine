//
//  RestAdapter.swift
//  RoadTripcaster
//
//  Created by Kranthion 5/11/18.
//  Copyright © 2018 Kranthi. All rights reserved.
//

import Foundation

enum ExecutionExceptions: Error {
    case InvalidURLString
    case InvalidURL
}

typealias TaskSuccessHandler = (_ response: Data) -> Void
typealias TaskFailureHandler = (_ error: Error) -> Void
typealias ResponseType = (successHandler: TaskSuccessHandler?, failureHandler: TaskFailureHandler?)

class RestAdapter {
    
    static let sharedRestAdapter = RestAdapter()
    let session = URLSession.shared
    private let sessionQueue = OperationQueue.main
    
    private init() {
        sessionQueue.maxConcurrentOperationCount = 5
    }
}

extension RestAdapter {
    
    static let sharedInstance = RestAdapter()
    func getSession() -> URLSession {
        return session
    }
    
    // Add the Data Task Operation
    func addData(withTaskOperation taskOperation :TaskOperation) {
        sessionQueue.addOperation(taskOperation)
    }
    
}

