//
//  RequestAdapter.swift
//  RoadTripcaster
//
//  Created by Kranthion 5/11/18.
//  Copyright © 2018 Kranthi. All rights reserved.
//

import Foundation


class RequestAdapter {
    
    fileprivate var urlString : String!
    
    fileprivate init(withURL url: String, successHandler: @escaping TaskSuccessHandler, failureHandler: @escaping TaskFailureHandler) {
        self.urlString = url
        let task =  DataTask.init()
        do {
            _ = try task.createRequestWith(urlString: url)
        } catch  ExecutionExceptions.InvalidURLString {
            print("URL Sring is not correct")
        } catch  ExecutionExceptions.InvalidURL {
            print("URL is not valid")
        } catch {
            print(error.localizedDescription)
        }
        task.executeTaskWithResponse(successHandler: successHandler, failureHandler: failureHandler)
    }
    
}

extension RequestAdapter {
    
    class func request(withURL urlString: String,
                       successHandler success: @escaping TaskSuccessHandler,
                       failureHandler failure: @escaping TaskFailureHandler) {
        _ = RequestAdapter.init(withURL: urlString,
                                   successHandler: success,
                                   failureHandler: failure)
    }
    
}
