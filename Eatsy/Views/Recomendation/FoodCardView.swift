//
//  FoodCardView.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

//import Foundation
import SwiftUI

struct FoodCardView: View {
    var food: Food
    
    var body: some View {
        HStack() {
            // Gambar makanan
            Image(food.imageName)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 8) {
                // Nama makanan
                Text(food.name)
                    .font(.subheadline)
                    .bold(true)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(food.nutritions) { nutrition in
                        HStack() {
                            Image(systemName: nutrition.icon)
                                .foregroundColor(Color(.systemGray2))
                                .font(.footnote)
                            
                            Text(nutrition.text)
                                .foregroundColor(Color(.systemGray2))
                                .font(.footnote)
                        }
                    }
                }
            }
            
            Spacer()
            VStack {

                Text("\(food.calories)kcal")
                    .font(.caption)
                    .bold()
                    .padding(10)
                    .background(Color("secondary"))
                    .foregroundColor(Color("PrimaryGreen"))
                    .cornerRadius(8)
                Spacer()
            }
        }
        .padding(-10)
        .modifier(SelectableCard(isSelected: food.isSelected))
    }
}
