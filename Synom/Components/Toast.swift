import SwiftUI

struct Toast: View {
    var message: String
    
    var body: some View {
        Text(message)
            .font(.caption)
            .foregroundColor(.accent)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.white.opacity(0.9))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(.accent, lineWidth: 0.5))
            .padding(.bottom, 50)
            .transition(.opacity)
    }
}

#Preview {
    Toast(message: "toast alert !")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
