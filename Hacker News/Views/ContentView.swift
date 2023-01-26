//
//  ContentView.swift
//  Hacker News
//
//  Created by Anurag Bhatt on 23/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView{
            VStack {
                PointView()
                List(networkManager.posts){ post in
                    NavigationLink(destination: DetailView(url : post.url)) {
                        
                        HStack(spacing: 20) {
                            Text(String(post.points))
                            
                            Text(post.title)
                        }
                    }
                    
                    
                }
                .navigationBarTitle("Hacker News")
            }
        }
        .onAppear{
            self.networkManager.fetchData()
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
//
//    Post(objectID: <#T##String#>, points: <#T##Int#>, title: <#T##String#>, url: <#T##String#>)
//]
