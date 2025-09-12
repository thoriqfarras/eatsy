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
            let encodedData = try JSONEncoder().encode(userData)
            // Save the encoded data to UserDefaults using the designated key.
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
            print("User data successfully saved.")
        } catch {
            // Log any errors that occur during encoding.
            print("Error saving user data: \(error.localizedDescription)")
        }
    }
    
    // Example of a method to update a specific user property.
    func updateWeight(newWeight: Int) {
        self.user.weight = newWeight
        // Now calling the new saveData method.
        self.saveData(userData: self.user)
    }
}
