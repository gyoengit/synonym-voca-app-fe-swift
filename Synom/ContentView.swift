import SwiftUI

enum SelectedTabOption {
    case home
    case user
}

struct ContentView: View {
    @State private var selectedTab = SelectedTabOption.home
    
    var body: some View {
        VStack (spacing: 0){
            // tab
            TabBar(selectedTab: $selectedTab)
                .frame(maxWidth: .infinity)
            
            // contents
            Group {
                switch(selectedTab) {
                case .home:
                    // HomePage()
                    Text("home")
                case .user:
                    // UserPage()
                    Text("user")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }
        .padding()
        .frame(minWidth: 600, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}

struct TabBar: View {
    @Binding var selectedTab: SelectedTabOption
    
    var body: some View {
        HStack {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .padding(8)
                .padding(.leading, 5)
                .onTapGesture {
                    selectedTab = .home
                }
            Spacer()
            Image(systemName: "person.circle")
                .padding(.trailing, 10)
                .onTapGesture {
                    selectedTab = .user
                }
        }
        .background(.white)
        .foregroundStyle(.tint)
        .frame(maxHeight: 25)
    }
}
