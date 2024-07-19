//
//  DetailView.swift
//  NewsLetter-SwiftUI
//
//  Created by 윤진영 on 7/19/24.
//

import SwiftUI


struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}



