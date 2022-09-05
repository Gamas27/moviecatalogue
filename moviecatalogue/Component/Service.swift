//
//  Service.swift
//  moviecatalogue
//
//  Created by João Gameiro on 05/09/2022.
//

import UIKit

class Service
{
    let API_KEY = "k_31cu4n60"
    let endpoint = "https://imdb-api.com/en/API/SearchMovie/"
    
    static var sharedInstance = Service()
    private init(){}
    
    func fetchFilms(for keyWordSearch: String, completionHandler: @escaping ([Result]) -> Void) {
        
        guard let endpoint = URL(string: endpoint + API_KEY + "/" + keyWordSearch) else { return }

        let task = URLSession.shared.dataTask(with: endpoint, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
              print("Error with the response, unexpected status code: \(String(describing: response))")
            return
          }

          if let data = data,
            let filmSummary = try? JSONDecoder().decode(Response.self, from: data) {
            completionHandler(filmSummary.results ?? [])
          }
        })
        task.resume()
      }
}
