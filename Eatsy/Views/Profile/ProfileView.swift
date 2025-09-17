import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel  // Changed from @StateObject
    @Environment(\.dismiss) var dismiss
    @State private var activePicker: PickerType? = nil
    
    var body: some View {
        VStack {
            HStack {
                GoalCardView()
                    .environmentObject(userViewModel)  // Pass the environment object
            }
            
            VStack(alignment: .leading) {
                Text("Personal Information")
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding([.horizontal, .top])
                VStack(spacing: 16) {
                    ProfileItem(title: "🎂 Age",
                                value: userViewModel.user.age != nil ? "\(userViewModel.user.age!) yo" : "Not set")
                    .onTapGesture { activePicker = .age }
                    
                    ProfileItem(title: "📏 Height",
                                value: userViewModel.user.height != nil ? "\(userViewModel.user.height!) cm" : "Not set")
                    .onTapGesture { activePicker = .height }
                    
                    ProfileItem(title: "⚖️ Weight",
                                value: userViewModel.user.weight != nil ? "\(userViewModel.user.weight!) kg" : "Not set")
                    .onTapGesture { activePicker = .weight }
                    
                    ProfileItem(title: "🎯 Goal Weight",
                                value: userViewModel.user.targetWeight != nil ? "\(userViewModel.user.targetWeight!) kg" : "Not set")
                    .onTapGesture { activePicker = .targetWeight }
                }
                .eatsyCard()
                .padding(.horizontal)
            }
            
            HStack {
                PreferenceView(selectedRestrictions: $userViewModel.user.dietRestrictions)
            }
            
            Spacer()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $activePicker) { picker in
            PickerSheet(
                pickerType: picker,
                height: $userViewModel.user.height,
                weight: $userViewModel.user.weight,
                age: $userViewModel.user.age,
                targetWeight: $userViewModel.user.targetWeight
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
        .background(Color("defaultBackground"))
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserViewModel())
}

struct ProfileItem: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
            Spacer()
            Text(value)
                .font(.footnote)
                .bold()
                .foregroundStyle(Color(.systemGray2))
            Image(systemName: "chevron.right")
                .foregroundColor(Color(.systemGray2))
                .font(.caption2)
        }
        .contentShape(Rectangle())
    }
}

struct PickerSheet: View {
    let pickerType: PickerType
    @Binding var height: Int?
    @Binding var weight: Int?
    @Binding var age: Int?
    @Binding var targetWeight: Int?

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text("Select \(title)")
                .bold()
            
            Picker("", selection: binding) {
                ForEach(range, id: \.self) { value in
                    Text("\(value) \(unit)").tag(Optional(value))
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()
            
            Button("Done") {
                dismiss()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }

    private var binding: Binding<Int?> {
        switch pickerType {
        case .height: return $height
        case .weight: return $weight
        case .age: return $age
        case .targetWeight: return $targetWeight
        }
    }

    private var range: [Int] {
        switch pickerType {
        case .height: return Array(130...220)
        case .weight, .targetWeight: return Array(30...200)
        case .age: return Array(18...100)
        }
    }

    private var unit: String {
        switch pickerType {
        case .height: return "cm"
        case .weight, .targetWeight: return "kg"
        case .age: return "yo"
        }
    }

    private var title: String {
        switch pickerType {
        case .height: return "Height"
        case .weight: return "Weight"
        case .targetWeight: return "Goal Weight"
        case .age: return "Age"
        }
    }
}

struct GoalCardView: View {
    @EnvironmentObject var userViewModel: UserViewModel  // Changed to EnvironmentObject
    @State private var showModal = false
    @State private var tempSelectedGoal: Goal? = nil
    
    var body: some View {
        HStack {
            Text(userViewModel.user.goal?.emoji ?? "🏆")
                .font(.largeTitle)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text("Goal")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray2))
                
                Text(userViewModel.user.goal?.title ?? "Select Goal")
                    .font(.headline)
            }
            
            Spacer()
            
            Button("Change") {
                tempSelectedGoal = userViewModel.user.goal // set current goal as temp
                showModal.toggle()
            }
            .font(.caption)
            .bold()
            .foregroundColor(.white)
            .padding(12)
            .background(Color("PrimaryGreen"))
            .clipShape(Capsule())
        }
        .eatsyCard()
        .padding()
        .sheet(isPresented: $showModal, onDismiss: {
            tempSelectedGoal = nil
        }) {
            VStack {
                Text("Select Your Goal")
                    .bold()
                    .padding(.top, 40)
                    .padding(.bottom)
                
                GoalRadioButtonsGroup(selectedButton: $tempSelectedGoal)
                
                Spacer()
                
                Button("Done") {
                    if let newGoal = tempSelectedGoal {
                        userViewModel.user.goal = newGoal
                        userViewModel.saveDefaults()
                        // Optionally recalculate target calories if goal affects it
//                        userViewModel.setDailyTargetCalories()
                        
                    }
                    showModal = false
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(tempSelectedGoal == nil)
            }
            .presentationDetents([.fraction(0.55)])
            .presentationDragIndicator(.visible)
        }
    }
}

struct PreferenceView: View {
    @Binding var selectedRestrictions: Set<DietRestriction>
    @State private var showModal = false
    @State private var tempSelection: Set<DietRestriction> = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Preferences")
                .font(.callout)
                .fontWeight(.medium)
                .padding([.horizontal, .top])
            
            VStack(spacing: 16) {
                HStack {
                    Text("Allergies")
                        .font(.subheadline)
                        .padding(.vertical, 4)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(.systemGray2))
                        .font(.caption2)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    tempSelection = selectedRestrictions // copy state
                    showModal = true
                }
            }
            .eatsyCard()
            .padding(.horizontal)
        }
        .sheet(isPresented: $showModal) {
            VStack() {
                Text("Select Allergies")
                    .bold()
                    .padding(.top, 40)
                    .padding(.bottom)
                
                VStack (spacing:10) {
                    ForEach(DietRestriction.allCases, id: \.self) { restriction in
                        DietRestrictionCheckbox(
                            restriction: restriction,
                            selectedRestrictions: $tempSelection
                        )
                    }
                }
                
                Spacer()
                
                Button("Done") {
                    selectedRestrictions = tempSelection
                    showModal = false
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            .background(Color("defaultBackground"))
            .presentationDetents([.fraction(0.65)])
            .presentationDragIndicator(.visible)
        }
    }
}
