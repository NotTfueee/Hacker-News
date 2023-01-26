//
//  DetailView.swift
//  Hacker News
//
//  Created by Anurag Bhatt on 24/01/23.
//

import SwiftUI


struct DetailView: View {
    
    let url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

