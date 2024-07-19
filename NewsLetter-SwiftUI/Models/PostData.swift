//
//  PostData.swift
//  NewsLetter-SwiftUI
//
//  Created by 윤진영 on 7/18/24.
//

import Foundation

struct Results: Decodable {
    
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
