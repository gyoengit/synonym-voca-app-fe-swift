import SwiftUI

struct SignUpPage: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Title(text: "sign up", fontSize: 15)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                
                LabeledTextField(label: "name", text: $username)
                    .frame(width: 350, height: 40)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 15)
                
                LabeledTextField(label: "email", text: $email)
                    .frame(width: 350, height: 40)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 15)
                
                LabeledTextField(label: "password", text: $password, isSecure: true, showToggle: true)
                    .frame(width: 350, height: 40)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
                
                PrimaryButton(action: {
                    print("회원가입 완료")
                }, title: "confirm", width: 350, height: 30)
            }
            .frame(width: 430, height: 350)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.05)))
            
            Spacer()
        }
    }
}
#Preview {
    SignUpPage()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
}
