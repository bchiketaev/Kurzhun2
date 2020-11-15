//
//  DataFromUrl.swift
//  Kurzhun2
//
//  Created by abc on 15/11/2020.
//

import Foundation

class DataFromUrl {
    
   public var category = [Category]()
    
    func getAndParseData (completed: @escaping () -> ()) {
            //Hit the API endpoint
    
    
            let urlString = "https://kurjun.herokuapp.com/api/item/getcategory/?format=json"
    
            let url = URL(string: urlString)
    
            guard url != nil else {
                return
            }
    
            let session = URLSession.shared
    
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
    
                //Check for errors
                if error == nil && data != nil {
    
                    // Parse JSON
                    let decoder = JSONDecoder()
    
                    do {
    
                    self.category = try decoder.decode([Category].self, from: data!)
                        
                        DispatchQueue.main.async {
                            completed()
                        }
                    }
                    catch {
                        print("Error in JSON parsing")
                    }
                }
            }
    
            // Make the API Call
            dataTask.resume()
        }
    
}
