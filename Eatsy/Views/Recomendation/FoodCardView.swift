//
//  FoodCardView.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

import Foundation
import SwiftUI

struct FoodCardView: View {
    var food: Food
    
    var body: some View {
        HStack(spacing: 16) {
            // Gambar makanan
            Image(food.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                // Nama makanan
                Text(food.name)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(food.nutritions) { nutrition in
                        HStack(spacing: 6) {
                            Image(systemName: nutrition.icon)
                                .foregroundColor(.gray)
                            
                            Text(nutrition.text)
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                    }
                }
            }
            
            Spacer()
            VStack {

                Text("\(food.calories)kcal")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.2))
                    .foregroundColor(.green)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
