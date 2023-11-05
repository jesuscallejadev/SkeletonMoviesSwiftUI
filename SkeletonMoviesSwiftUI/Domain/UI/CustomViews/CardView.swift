//
//  CardView.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import SwiftUI

struct CardView: View {
    
    var card : Card
    var body: some View {
        
        VStack(spacing: 0) {
            Text(self.card.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .padding(.bottom, 24)

            Text(self.card.description)
                .disabled(true)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .frame(width: 300, height: 150)
                .padding(.bottom, 32)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            
            
        }.padding()
            .offset(x: 0, y: 100)
    }
}

#Preview {
    CardView(card: Card(title: "", description: ""))
}

