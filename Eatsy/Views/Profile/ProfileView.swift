import SwiftUI

struct ProfileView: View {
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
                .background(.green)
                .clipShape(Capsule())
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Color.black.opacity(0.08), radius: 6)
            .padding([.horizontal, .top])
            
            VStack (alignment: .leading) {
                Text("Personal Information")
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding([.horizontal, .top])
                VStack(spacing: 16){
                    ProfileItem(title: "🎯 Goal Weight", val: "100kg")
                    ProfileItem (title: "🎂 Age", val: "21yo")
                    ProfileItem (title: "⚖️ Weight", val: "60kg")
                    ProfileItem (title: "📏 Height", val: "162.3cm")
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Color.black.opacity(0.08), radius: 6)
                .padding(.horizontal)
            }
            Spacer()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }}
#Preview {
    ProfileView()
}

struct ProfileItem: View {
    var title: String
    var val: String
    var body: some View {
        HStack {
            Text(title)
                .font(.footnote)
            Spacer()
            Text(val)
                .font(.caption)
                .foregroundStyle(Color (.systemGray2))
            Image(systemName: "chevron.right")
                .foregroundColor(Color (.systemGray2))
                .font(.caption2)
        }
    }
}
