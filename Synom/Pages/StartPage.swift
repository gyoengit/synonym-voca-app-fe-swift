import SwiftUI

struct StartPage: View {
    @State private var isPressed = false
    @Binding var selectedTab: SelectedTabOption
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 50)
            
            Text("synom : the synonym voca app")
                .font(.system(size: 12, weight: .light, design: .default))
                .tracking(3)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            
            Button(action: {
                withAnimation(.easeOut(duration: 0.1)) {
                    isPressed.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        selectedTab = .login
                    }
                }
            
            }) {
                Text("start")
                    .font(.system(size: 12, weight: .light))
                    .tracking(3)
                    .foregroundColor(.black)
                    .frame(width: 120, height: 30)
                    .background(
                        Capsule()
                            .fill(Color.gray.opacity(0.3))
                    )
                    .scaleEffect(isPressed ? 0.9 : 1.0)
            }
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
    }
}

#Preview {
    StartPage(
        selectedTab: .constant(.start)
    )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
}
