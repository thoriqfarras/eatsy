import SwiftUI

struct ProfileView: View {
    var body: some View {
        Spacer()
        VStack {
            HStack(){
                Image(systemName: "minus")
                    .padding(.trailing, 12)
                VStack (alignment: .leading) {
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                Spacer()
                Image(systemName: "plus")
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 8)
            .padding()
            
            VStack (alignment: .leading) {
                Text("Personal Information")
                    .padding([.horizontal, .top])
                VStack(){
                    HStack {
                        Text("🎯 Goal Weight")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.bottom)
                    ProfileItem(title: "Age")
                    ProfileItem (title: "Weight")
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)
                .padding()
            }
            Spacer()
        }
    }
    func ProfileItem(title: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.bottom)
    }
}
#Preview {
    ProfileView()
}

//struct ProfileItem: View {
//    var title: String
//    var body: some View {
//        HStack {
//            Text(title)
//            Spacer()
//            Image(systemName: "chevron.right")
//        }
//        .padding(.bottom)
//    }
//}
