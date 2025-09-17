import SwiftUI

struct DateSegmentBar: View {
    @Binding var selectedIndex: Int
    let titles: [String]
    private let userViewModel: UserViewModel = UserViewModel()

    var body: some View {
        if userViewModel.user.isSetUp {
            VStack {
                Picker("", selection: $selectedIndex) {
                    ForEach(0..<titles.count, id: \.self) { i in
                        Text(titles[i]).tag(i)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.systemGray6))
            )
        }
        
        
        
    }
}
