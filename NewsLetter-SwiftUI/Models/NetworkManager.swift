//
//  NetworkManager.swift
//  NewsLetter-SwiftUI
//
//  Created by 윤진영 on 7/18/24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post] ()
    
    func fetchData() {
        //만약 이 string으로 유효한 url 을 생성할 수 있다면
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, URLResponse, error) in
                //error가 없다면
                if error == nil {
                    //데이터를 디코딩해서 가져온다
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            
            task.resume()
        }
    }
}

