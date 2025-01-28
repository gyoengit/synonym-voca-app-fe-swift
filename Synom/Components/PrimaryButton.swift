import SwiftUI

struct PrimaryButton: View {
    let action: () -> Void
    let title: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.system(size: 11, weight: .light))
                .tracking(2)
                .foregroundColor(.black)
                .frame(width: width, height: height)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.top, 10)
    }
}

#Preview {
    PrimaryButton(action: {print("clicked")}, title: "click", width: 400, height: 30)
}
