import SwiftUI

struct LabeledTextField: View {
    var label: String
    @Binding var text: String
    var isSecure: Bool = false
    var showToggle: Bool = false
    var borderColor: Color = .gray
    @State private var isTextVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.system(size: 11, weight: .light))
                .foregroundColor(.black)
            
            HStack {
                if isSecure && !isTextVisible {
                    SecureField("", text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                } else {
                    TextField("", text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                
                if showToggle {
                    Button(action: {
                        isTextVisible.toggle()
                    }) {
                        Image(systemName: isTextVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
            .frame(height: 40)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 0.3)
            )
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    LabeledTextField(label: "user", text: $text, isSecure: false, showToggle: false)
}
