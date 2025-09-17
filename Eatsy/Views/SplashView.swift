import SwiftUI

// Extension biar bisa pakai hex code
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // buang simbol #
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(hex: "#f5fdd7") // pakai hex di sini
                .ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Eatsy")
                    .font(.title)
                    .bold()
                    .padding(.top, 12)
            }
        }
    }
}
#Preview {
    SplashView()
}