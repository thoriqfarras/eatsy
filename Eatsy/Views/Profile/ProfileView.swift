import SwiftUI

struct ProfileView: View {
    
    @State private var selectedHeight: Int = 160
    @State private var selectedWeight: Int = 60
    @State private var selectedAge: Int = 21
    
    @State private var activePicker: PickerType? = nil
    
    var body: some View {
        VStack {
            HStack(){
                Text("🏆")
                    .font(.largeTitle)
                    .padding(.trailing, 8)
                VStack (alignment: .leading) {
                    Text("Goal")
                        .font(.caption)
                        .foregroundStyle(Color (.systemGray2))
                    Text("Lose Weight")
                        .font(.headline)
                }
                Spacer()
                Button("Change") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
            
            VStack (alignment: .leading) {
                Text("Personal Information")
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding([.horizontal, .top])
                VStack(spacing: 16) {
                    ProfileItem(title: "📏 Height", value: "\(selectedHeight) cm")
                                            .onTapGesture { activePicker = .height }
                                        
                                        ProfileItem(title: "⚖️ Weight", value: "\(selectedWeight) kg")
                                            .onTapGesture { activePicker = .weight }
                                        
                                        ProfileItem(title: "🎂 Age", value: "\(selectedAge) yo")
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
                        height: $selectedHeight,
                        weight: $selectedWeight,
                        age: $selectedAge
                    )
                    .presentationDetents([.fraction(0.5)])
                    .presentationDragIndicator(.visible)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
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
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("PrimaryGreen"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
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
