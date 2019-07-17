//
//  Request.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 17/07/19.
//  Copyright © 2019 Rahul Chouhan. All rights reserved.
//

import Foundation


class Request: NSObject {
    
    //Saving data
    func saveData(url:URL,dataDict:[String:Any],completionHandler:@escaping(CompletionHandler)) {
        
        var jsonData:Data
        do{
            jsonData = try JSONSerialization.data(withJSONObject: dataDict, options: .init(rawValue:0)) as Data
            writeFileData(url: url,data: jsonData,completionHandler: completionHandler)
        }
        catch
        {
            print("Error while saving!!")
        }
    }
    //Writing data to URL
    fileprivate func writeFileData(url:URL,data:Data,completionHandler:@escaping(CompletionHandler)) {
        //To write to local file
        do {
            try data.write(to: url)
            completionHandler(true,nil)
        } catch {
            let error = NSError()
            completionHandler(false,error.localizedDescription)
        }
    }
    
    //Retrieving data from URL
    func retrieveData(url:URL,completionHandler: @escaping(CompletionHandler)) {
        
        //Retrieve from local disk
        let request = NSURLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) {(data, response, error) in
            if let dataObj = data{
                //Parsing the retrieved Data
                self.parseRespponse(data: dataObj,response:response,error: error,completionHandler: completionHandler)
            }
            else{
                completionHandler(false, error?.localizedDescription)
            }
        }
        task.resume()
    }
    
    //Write to path url
    func writeNow(arg:URL,data:Data,completionHandler:CompletionHandler)  {
        // does the URL exist? ask to create it
        let url: NSURL! = arg as NSURL
        if !url.checkResourceIsReachableAndReturnError(nil) {
            print("File doesn't exist: \(arg)\n Create it now? [y/n] ")
            do{
                try data.write(to:arg)
                print("File Created \(url.path!)")
                completionHandler(true, nil)
            }
            catch{
                let error = NSError()
                completionHandler(false,error.localizedDescription)
            }
        }
    }
    
    //Retrieve using session & URL request
    func retrieveUsingSession(url:URL,completionHandler:@escaping (CompletionHandler)) {
        // Set up the URL request
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            //Parse the received data
            self.parseRespponse(data: responseData, response: response, error: error, completionHandler: completionHandler)
        }
        task.resume()
    }
    
    //Parsing the data after retrieving
    fileprivate func parseRespponse(data:Data,response:URLResponse?,error:Error?,completionHandler:@escaping(CompletionHandler)) {
        var dict:[String:Any] = [:]
        do{
            dict = try JSONSerialization.jsonObject(with: data) as! Dictionary
            completionHandler(true,dict)
        }
        catch{
            let error = NSError()
            completionHandler(false, error.localizedDescription)
        }
    }
}
