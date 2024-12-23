//
//  CardView.swift
//  NextUp
//
//  Created by Yonatan Tussa on 12/23/24.
//

import SwiftUI

struct CardView: View {
    let content: String
    let type: String
    let imageUrl: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Image at the top of the card
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipped()
            } placeholder: {
                Color.gray
                    .frame(height: 120)
            }
            
            // Title and description at the bottom of the card
            VStack(alignment: .leading, spacing: 5) {
                Text(type)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(content)
                    .font(.headline)
                    .padding(.bottom, 2)

            }
            .frame(width: 200, height: 50)
            .background(Color(hex: "#F8F9FE"))
            /*
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "#D3D3D3"), lineWidth: 1)
            )
             */
        }
        .frame(width: 200, height: 170)
        .cornerRadius(10)

    }
}
