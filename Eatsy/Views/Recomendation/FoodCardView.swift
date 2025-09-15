//
//  FoodCardView.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

//import Foundation
import SwiftUI

struct FoodCardView: View {
    var meal: MealObject
    
    var body: some View {
        HStack(spacing: 12) {
            // Gambar makanan
            Image("nasgor")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 6) {
                // Nama makanan
                Text(meal.menuName)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                
                // Nutrisi
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "drop.fill")
                            .foregroundColor(.gray)
                            .font(.caption2)
                        Text("\(meal.fat)g fat")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.gray)
                            .font(.caption2)
                        Text("\(meal.carbs)g carbs")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                            .font(.caption2)
                        Text("\(meal.protein)g protein")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Spacer()
            
            // Kalori
            Text("\(meal.calories)kcal")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.green.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}





//struct FoodCardView: View {
//    var dummyRecomend = Recommendation(
//        date: Date(),
//        breakfasts: [
//            MealObject(id:1, mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
//            MealObject(id:2,mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
//            MealObject(id:3,mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy])
//        ],
//        lunches: [
//            MealObject(id:11,mealType: .lunch, menuName: "Nasgor Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
//            MealObject(id:12,mealType: .lunch, menuName: "Mi Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
//            MealObject(id:13,mealType: .lunch, menuName: "Ayam Bali", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy])
//        ],
//        dinners: [
//            MealObject(id:21,mealType: .dinner, menuName: "Ketoprak Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
//            MealObject(id:22,mealType: .dinner, menuName: "Mi Kuah", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
//            MealObject(id:23,mealType: .dinner, menuName: "Ayam Bakar", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy])
//        ]
//    )
//    
//    var body: some View {
//        HStack() {
//            // Gambar makanan
//            Image(dummyRecomend.breakfasts[0].imageName)
//                .resizable()
//                .aspectRatio(1, contentMode: .fit)
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//                .padding(.trailing, 8)
//            
//            VStack(alignment: .leading, spacing: 8) {
//                // Nama makanan
//                Text(dummyRecomend.breakfasts[0].menuName)
//                    .font(.subheadline)
//                    .bold(true)
//                    .foregroundColor(.black)
//            }
//            Spacer()
//            VStack {
//
//                Text("\(dummyRecomend.breakfasts[0].calories)kcal")
//                    .font(.caption)
//                    .bold()
//                    .padding(10)
//                    .background(Color("secYellow"))
//                    .foregroundColor(Color("PrimaryGreen"))
//                    .cornerRadius(8)
//                Spacer()
//            }
//        }
//        .padding(-10)
//    }
//}

//#Preview {
//    FoodCardView()
//}
