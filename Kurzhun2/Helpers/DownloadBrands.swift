//
//  DownloadBrands.swift
//  Kurzhun2
//
//  Created by abc on 16/11/2020.
//

import Foundation

class DownloadBrands {
    
   public var brandsArray = [MyResult]()
    func getAndParseData (type: Int, completed: @escaping () -> ()) {
            //Hit the API endpoint
    
    
        let urlString = "https://kurjun.herokuapp.com/api/user/getuser/?category=\(type)"
    
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
    
                    let check = try decoder.decode(Brands.self, from: data!)
                        self.brandsArray = check.results
                        //print(self.brandsArray)

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


