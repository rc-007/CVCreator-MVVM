//
//  File.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 17/07/19.
//  Copyright © 2019 Rahul Chouhan. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    var block : CompletionHandler!
    func requestForWriteData(_ baseUrl: URL, parameters: [String: Any], completion: @escaping CompletionHandler) {
        block = completion
        Request().saveData(url: baseUrl, dataDict: parameters) { (success, response) in
            self.block(success,response)
        }
    }
    
    func loadingForCV(url:URL, completion:@escaping(CompletionHandler)) {
        block = completion
        Request().retrieveData(url: url) { (success, response) in
            self.block(success,response)
        }
    }
}
