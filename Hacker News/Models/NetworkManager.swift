//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Anurag Bhatt on 23/01/23.
//

import Foundation

class NetworkManager : ObservableObject
{
    
    @Published  var posts = [Post]()
    
    func fetchData()
    {
        // 1. create a URL
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")
        {
            // 2. create a url session
            let session = URLSession(configuration: .default)
            
            // 3. give the session a task
            
            let task = session.dataTask(with: url) { data, response , error in
                
                // check whether there were errors or not
                
                if error == nil
                {
                    // if no errors create a decoder
                    let decoder = JSONDecoder()
                    
                    // create a structure telling the compiler how the data is present in the JSON format after creating the struct then only we decode the data
                    
                    if let safeData = data{
                        do {
                            
                            let decodedData = try decoder.decode(Result.self , from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = decodedData.hits
                            }
                            
                            
                        }catch{
                            
                            print (error)
                            
                        }
                    }
                    
                }
            }
            
            // 4. start the task
            
            task.resume()
            
        }
    }
}
