//
//  UserViewModel.swift
//  Eatsy
//
//  Created by Mac on 09/09/25.
//
import SwiftUI
import Foundation
import Combine

//class UserViewModel: ObservableObject {
//    @Published var user: User?
//    
//    func saveUser(userData: User) {
//        user = userData
//        UserDefaults.standard.set(try? JSONEncoder().encode(user), forKey: "user")
//    }
//    
//    func getUser() {
//        if let data = UserDefaults.standard.data(forKey: "user"),
//           let storedUser = try? JSONDecoder().decode(User.self, from: data)
//        {
//            user = storedUser
//        }
//    }
//}

// --- User View Model Class ---
class UserViewModel: ObservableObject {
    // The @Published property will automatically notify any views that are observing it
    // whenever the user data changes, triggering a UI update.
    @Published var user: User
    
    // Key used to store and retrieve the user data from UserDefaults.
    private let userDefaultsKey = "UserData"
    
    init() {
        // Initialize the view model by attempting to fetch existing user data.
        // If no data is found, it creates a new default User instance.
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedData) {
            self.user = decodedUser
            print("User data successfully fetched.")
        } else {
            self.user = User()
            print("No existing user data found. Creating a new user.")
        }
    }
    
    /// Saves a given User object to UserDefaults.
    /// - Parameter userData: The User object to be saved.
    func saveData(userData: User) {
        do {
            // Encode the provided User struct into Data.
            self.user = userData
            self.completeSetUp()
            let encodedData = try JSONEncoder().encode(self.user)
            // Save the encoded data to UserDefaults using the designated key.
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
            print("User data successfully saved.")
        } catch {
            // Log any errors that occur during encoding.
            print("Error saving user data: \(error.localizedDescription)")
        }
    }
    
    func completeSetUp() {
        self.user.isSetUp = true
    }
    
    func setDailyTargetCalories() -> Void {
        var dailyTargetCalories: Int;
        
        guard let gender = self.user.gender,
              let weight = self.user.weight,
              let height = self.user.height,
              let age = self.user.age,
              let targetWeight = self.user.targetWeight else {
            return
        }

        var bmr: Double = 0.0
        
        if gender == .m {
            let weightFactor = 13.397 * Double(weight)
            let heightFactor = 4.799 * Double(height)
            let ageFactor = 5.677 * Double(age)
            bmr = 88.362 + weightFactor + heightFactor - ageFactor
        } else {
            let weightFactor = 9.247 * Double(weight)
            let heightFactor = 3.098 * Double(height)
            let ageFactor = 4.330 * Double(age)
            bmr = 447.593 + weightFactor + heightFactor - ageFactor
        }
        
        // 🔥 Perhitungan TDEE
        let tdee = bmr * 1.2
        
        dailyTargetCalories = Int(self.user.goal == .lose ? tdee - 500 : tdee + 500)
        self.user.dailyTargetCalories = dailyTargetCalories
    }
    
    func setTargetDate() -> Void {
        var targetDate: Date
    
        let weightDiff = abs(self.user.targetWeight! - self.user.weight!)
        let totalCaloriesNeeded = weightDiff * 7700
        let amountOfDaysNeeded = totalCaloriesNeeded / self.user.dailyTargetCalories
        
        targetDate = Calendar.current.date(byAdding: .day, value: Int(amountOfDaysNeeded), to: Date())!
        self.user.targetDate = targetDate
}

    func calculateTargetCalories(userData: User) -> Int {
        // 🔥 Unwrap semua optional, kalau ada yang nil return 0
        guard let gender = userData.gender,
              let weight = userData.weight,
              let height = userData.height,
              let age = userData.age,
              let targetWeight = userData.targetWeight else {
            return 0
        }

        var bmr: Double = 0.0
        
        if gender == .m {
            // 🔥 Pecah jadi step
            let weightFactor = 13.397 * Double(weight)
            let heightFactor = 4.799 * Double(height)
            let ageFactor = 5.677 * Double(age)
            bmr = 88.362 + weightFactor + heightFactor - ageFactor
        } else {
            let weightFactor = 9.247 * Double(weight)
            let heightFactor = 3.098 * Double(height)
            let ageFactor = 4.330 * Double(age)
            bmr = 447.593 + weightFactor + heightFactor - ageFactor
        }
        
        // 🔥 Perhitungan TDEE
        let tdee = bmr * 1.2
        
        // 🔥 Selisih berat
        let weightDiff = Double(weight - targetWeight)
        
        // 🔥 Total kalori
        let totalCalorieChange = weightDiff * 7700
        let dailyCalorieChange = totalCalorieChange / 365.0
        
        let targetCalories = tdee - dailyCalorieChange
        return Int(targetCalories.rounded())
    }
}
