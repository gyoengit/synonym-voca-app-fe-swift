import SwiftUI

struct LoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("welcome to synom")
                .font(.system(size: 15, weight: .light))
                .tracking(2)
                .padding(.top, 40)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 5) {
               Text("name")
                   .font(.system(size: 11, weight: .light))
                   .foregroundColor(.black)
               
               TextField("", text: $username).textFieldStyle(PlainTextFieldStyle())
                   .padding()
                   .frame(width: 400, height: 40)
                   .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                   .overlay(
                       RoundedRectangle(cornerRadius: 10)
                           .stroke(Color.accentColor, lineWidth: 0.3)
                   )
           }
           .padding(.horizontal, 40)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("password")
                    .font(.system(size: 11, weight: .light))
                    .foregroundColor(.black)
                
                HStack {
                    if isPasswordVisible {
                        TextField("",	 text: $password)
                    } else {
                        SecureField("", text: $password)
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .frame(width: 400, height: 40)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.accentColor, lineWidth: 0.3)
                )
                
                
            }
            .padding(.horizontal, 40)
            
            
            Button(action: {
                print("로그인 시도")
            }) {
                Text("log in")
                    .font(.system(size: 11, weight: .light))
                    .tracking(2)
                    .foregroundColor(.black)
                    .frame(width: 400, height: 30)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.top, 10)
            
            
            Button(action: {
                print("회원가입 화면으로 이동")
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
        .padding(.top, 30)
    }
}

#Preview {
    LoginPage()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
}
