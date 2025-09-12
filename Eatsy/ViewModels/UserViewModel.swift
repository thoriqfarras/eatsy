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

    func calculateTargetCalories(userData: User) -> Int {
        var bmr: Double = 0
        
        if userData.gender == .m {
            bmr = 88.362
                + (13.397 * Double(userData.weight))
                + (4.799 * Double(userData.height))
                - (5.677 * Double(userData.age))
        } else {
            bmr = 447.593
                + (9.247 * Double(userData.weight))
                + (3.098 * Double(userData.height))
                - (4.330 * Double(userData.age))
        }
        
        // TDEE dengan faktor aktivitas 1.2 (sedentary)
        let tdee = bmr * 1.2
        
        // Selisih berat dalam kg
        let weightDiff = Double(userData.weight - userData.targetWeight)
        
        // Total kalori yg harus di-defisit/surplus (1 kg ≈ 7700 kcal)
        let totalCalorieChange = weightDiff * 7700
        
        // Per hari selama 1 tahun
        let dailyCalorieChange = totalCalorieChange / 365.0
        
        // Target kalori harian
        let targetCalories = tdee - dailyCalorieChange
        
        return Int(targetCalories.rounded())
    }

}
