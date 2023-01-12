//
//  Hits.swift
//  HackerNewsSwiftUI
//
//  Created by GGS-BKS on 11/01/23.
//

import Foundation

class Api : ObservableObject{
    @Published var hitsArray : [Hits] = []
    
    func loadData(completion:@escaping (NewsModel) -> ()) {
        guard let serverURL = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {
            print("Server URL is not correct, Kindly recheck")
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) {data, response, error in
            
            if error != nil{
                print ("Unable to fetch data from server , encontered error")
                return
            }
            //Convert data to model
            do{
                let hackerNewsList = try JSONDecoder().decode(NewsModel.self , from: data!)
                print(hackerNewsList)
                DispatchQueue.main.async {
                    completion(hackerNewsList)
                            }
                
            } catch{
                print(error)
            }
        }.resume()
        
    }
}
