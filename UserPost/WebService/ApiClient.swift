//
//  ApiClient.swift
//  UserPost
//
//  Created by Luis Santana on 17/9/22.
//

import Foundation
class ApiClient<Element: Codable>{
    
    
    static func getConfiguration() -> URLSession{
             let sessionConfig = URLSessionConfiguration.default
             sessionConfig.timeoutIntervalForRequest = 0.0
             sessionConfig.timeoutIntervalForResource = 0.0
             return URLSession(configuration: sessionConfig)
    }
    
    static func fetchListData(url: String ,completion: @escaping ([Element]?, Error?)-> Void) {
        var elementList: [Element] = [Element]()
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let dataTask = self.getConfiguration().dataTask(with: request) { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode >= 200 && response.statusCode <= 299{
                    
                    if let data = data {
                        DispatchQueue.main.async {
                            do {
                                let userPostResult =   try JSONDecoder().decode([Element].self, from: data)
                                elementList = userPostResult
                                print("Data fetched")
                                completion(elementList, nil)
                            } catch let error as NSError {
                                print(error.localizedDescription)
                                completion(nil, error)
                            }
                        }
                    }
                }
            }else{
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            
            
            
        }
        dataTask.resume()
    }
 
}
