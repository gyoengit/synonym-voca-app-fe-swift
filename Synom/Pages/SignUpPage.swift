import SwiftUI

struct SignUpPage: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isNotValid: Bool = false
    @State private var isShowingAlert: Bool = false
    @Binding var selectedTab: SelectedTabOption
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .padding(10)
                        .onTapGesture {
                            selectedTab = .login
                        }
                        
                    Spacer()
                }
                Spacer()
            }
            VStack {
                Spacer()
                
                VStack {
                    Title(text: "sign up", fontSize: 15)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                    
                    LabeledTextField(label: "name", text: $username, borderColor: isNotValid ? Color.red : Color.gray)
                        .frame(width: 350, height: 40)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 15)
                        
                    
                    LabeledTextField(label: "email", text: $email, borderColor: isNotValid ? Color.red : Color.gray)
                        .frame(width: 350, height: 40)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 15)
                    
                    LabeledTextField(label: "password", text: $password, isSecure: true, showToggle: true, borderColor: isNotValid ? Color.red : Color.gray)
                        .frame(width: 350, height: 40)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 30)
                    
                    PrimaryButton(action: {
                        print("회원가입 완료")
                        AuthService.signup(username: username, password: password) { result in
                        switch result {
                        case .success():
                            isNotValid = false
                            isShowingAlert = true
                        case .failure(let error):
                            print("Sign up failed: \(error.localizedDescription)")
                            isNotValid = true
                        }
                        }
                    }, title: "confirm", width: 350, height: 30)
                    .alert(isPresented: $isShowingAlert) {
                        Alert(title: Text("Account created"), message: Text("go to login page"), dismissButton: .default(Text("ok"), action: {
                            selectedTab = .login
                        }))
                    }
                }
                .frame(width: 430, height: 350)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.05)))
                
                Spacer()
            }
        }
    }
}
#Preview {
    @Previewable @State var selectedTab = SelectedTabOption.signup;
    SignUpPage(selectedTab: $selectedTab)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
}
