//
//  News.swift
//  First
//
//  Created by Owen Henley on 22/11/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import Foundation

class News {
    var url: URL
    var stories = ""
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(using session: URLSessionProtocol = URLSession.shared, completionHandler: @escaping () -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                self.stories = String(decoding: data, as: UTF8.self)
            }
            completionHandler()
        }
        task.resume()
    }
}

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
