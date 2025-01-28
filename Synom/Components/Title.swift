import SwiftUI

struct Title: View {
    let text: String
    let fontSize: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: .light))
            .tracking(2)
    }
}

#Preview {
    Title(text: "text", fontSize: 15)
}
