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
    var isSelected: Bool
    
    var body: some View {
        HStack() {
            // Gambar makanan
            Image(meal.imageName)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 8) {
                // Nama makanan
                Text(meal.menuName)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                
                // Nutrisi
                VStack(alignment: .leading) {
                    HStack(spacing: 13) {
                        Image(systemName: "drop")
                            .foregroundColor(Color(.systemGray2))
                            .font(.footnote)
                        Text("\(meal.fat)g fat")
                            .font(.footnote)
                            .foregroundColor(Color(.systemGray2))
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "leaf")
                            .foregroundColor(Color(.systemGray2))
                            .font(.footnote)
                        Text("\(meal.carbs)g carbs")
                            .font(.footnote)
                            .foregroundColor(Color(.systemGray2))
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "heart")
                            .foregroundColor(Color(.systemGray2))
                            .font(.footnote)
                        Text("\(meal.protein)g protein")
                            .font(.footnote)
                            .foregroundColor(Color(.systemGray2))
                    }
                }
            }
            
            Spacer()
            
            // Kalori
            VStack {
                Text("\(meal.calories)kcal")
                    .font(.footnote)
                    .bold()
                    .padding(10)
                    .background(Color("secYellow"))
                    .foregroundColor(Color("PrimaryGreen"))
                    .cornerRadius(8)
                Spacer()
            }
                    }
                    .padding(-10)
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
