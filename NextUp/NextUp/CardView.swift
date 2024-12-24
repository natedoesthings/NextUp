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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image at the top of the card
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.1)
                    .frame(maxWidth: .infinity, minHeight: 120)
                    .clipped()
            } placeholder: {
                Color.gray
                    .frame(maxWidth: .infinity, minHeight: 120)
            }
            
            // Title and description at the bottom of the card
            VStack(alignment: .leading, spacing: 5) {
                Text(type)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(content)
                    .font(.headline)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(colorScheme == .dark ? Color(hex: "#2D2D2D") : Color(hex: "#F8F9FE"))
            /*
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "#D3D3D3"), lineWidth: 1)
            )
             */
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(colorScheme == .dark ? Color(hex: "#1A1A1A") : Color.white)
        .cornerRadius(10)
        .shadow(color: colorScheme == .dark ? Color.black.opacity(0.3) : Color.gray.opacity(0.2), radius: 5, x: 0, y:2)
    }
}
