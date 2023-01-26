//
//  PointView.swift
//  Hacker News
//
//  Created by Anurag Bhatt on 23/01/23.
//

import SwiftUI

struct PointView: View {
    var body: some View {
       
        Rectangle()
            .fill(.black)
            .frame(width: 380, height: 50, alignment: .center)
            .cornerRadius(20)
            .overlay(
                HStack{
                    
                    Text("Points")
                        .padding()
                        .foregroundColor(.white)
                    Text("News")
                        .frame(maxWidth: .infinity , alignment: .center)
                        .foregroundColor(.white)
                        
                    
                })
           
            
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}
