import SwiftUI

struct ProfileView: View {
    
    @StateObject var userViewModel = UserViewModel()
    
    @State private var activePicker: PickerType? = nil
    
    var body: some View {
        VStack {
            HStack(){
                GoalCardView()
            }
            
            VStack (alignment: .leading) {
                Text("Personal Information")
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding([.horizontal, .top])
                VStack(spacing: 16) {
                    ProfileItem(title: "📏 Height", value: userViewModel.user.isSetUp ? "\(userViewModel.user.height) cm" : "Not set")
                                            .onTapGesture { activePicker = .height }
                                        
                                        ProfileItem(title: "⚖️ Weight", value: userViewModel.user.isSetUp ? "\(userViewModel.user.weight) cm" : "Not set")
                                            .onTapGesture { activePicker = .weight }
                                        
                                        ProfileItem(title: "🎂 Age", value: userViewModel.user.isSetUp ? "\(userViewModel.user.age) cm" : "Not set")
                                            .onTapGesture { activePicker = .age }
                }
                .eatsyCard()
                .padding(.horizontal)
            }
            Spacer()
        }
        .sheet(item: $activePicker) { picker in
                    PickerSheet(
                        pickerType: picker,
                        height: $userViewModel.user.height,
                        weight: $userViewModel.user.weight,
                        age: $userViewModel.user.age
                    )
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("defaultBackground"))
    }}
#Preview {
    ProfileView()
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
    @Binding var height: Int
    @Binding var weight: Int
    @Binding var age: Int
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Select \(title)")
                .bold()
            Picker("", selection: binding) {
                ForEach(range, id: \.self) { value in
                    Text("\(value) \(unit)")
                        .tag(value)
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
    
    private var binding: Binding<Int> {
        switch pickerType {
        case .height: return $height
        case .weight: return $weight
        case .age: return $age
        }
    }
    
    private var range: Range<Int> {
        switch pickerType {
        case .height: return 130..<221
        case .weight: return 30..<201
        case .age: return 18..<100
        }
    }
    
    private var unit: String {
        switch pickerType {
        case .height: return "cm"
        case .weight: return "kg"
        case .age: return "yo"
        }
    }
    
    private var title: String {
        switch pickerType {
        case .height: return "Height"
        case .weight: return "Weight"
        case .age: return "Age"
        }
    }
}

struct GoalCardView: View {
    @State private var selectedGoal: Goal?
    @State private var showModal = false
        @Environment(\.dismiss) var dismiss
        
        @State private var tempSelectedGoal: Goal? = nil // state sementara
    
    var body: some View {
        HStack {
            Text("🏆")
                .font(.largeTitle)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text("Goal")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray2))
                
                Text(selectedGoal?.title ?? "Select Goal")
                    .font(.headline)
            }
            
            Spacer()
            
            Button("Change") {
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
                    .padding(.bottom)
                
                GoalRadioButtonsGroup(selectedButton: $tempSelectedGoal)
                    .onAppear {
                        tempSelectedGoal = selectedGoal // mulai dari current goal
                    }
                
                Button("Done") {
                    selectedGoal = tempSelectedGoal // apply ke main state
                    showModal = false // tutup modal
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
    }
}
