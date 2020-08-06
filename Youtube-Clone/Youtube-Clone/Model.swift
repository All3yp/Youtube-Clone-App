//
//  Model.swift
//  Youtube-Clone
//
//  Created by Alley Pereira on 05/08/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //Create a URL Object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        //Get a URLSession object
        let session = URLSession.shared
        
        //Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any erros
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            catch {
                
            }
            
        }
        
        //Kick off the task
        dataTask.resume()
    }
}
