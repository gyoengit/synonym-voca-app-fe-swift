import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @Binding var selectedTab: SelectedTabOption
    
    var body: some View {
        VStack {
            Spacer()
            
            Title(text: "welcome to synom", fontSize: 15)
                .padding(.top, 20)
                .padding(.bottom, 20)
            
            LabeledTextField(label: "name", text: $username)
                .frame(width: 400, height: 40)
                .padding(.horizontal, 40)
                .padding(.bottom, 15)
            
            LabeledTextField(label: "password", text: $password, isSecure: true, showToggle: true)
                .frame(width: 400, height: 40)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
            
            PrimaryButton(action: {
                print("로그인 시도")
            }, title: "log in", width: 400, height: 30)
            
            
            Button(action: {
                print("회원가입 화면으로 이동")
                selectedTab = .signup
            }) {
                Text("Create Account")
                    .font(.system(size: 11, weight: .light))
                    .tracking(1)
                    .underline()
                    .foregroundColor(.black)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.top, 20)
            
            Spacer()
        }
//        .padding(.top, 30)
    }
}

#Preview {
    @Previewable @State var selectedTab = SelectedTabOption.login;
    LoginPage(selectedTab: $selectedTab)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
}
