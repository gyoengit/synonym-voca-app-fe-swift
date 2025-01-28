import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack (spacing: 0){
            // tab
            TabBar(selectedTab: $selectedTab)
                .frame(maxWidth: .infinity)
            
            // contents
            Group {
                switch(selectedTab) {
                case 0:
                    // HomePage()
                    Text("home")
                case 1:
                    // UserPage()
                    Text("user")
                default:
                    // NotFoundPage()
                    Text("not found")
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
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .padding(8)
                .padding(.leading, 5)
                .onTapGesture {
                    selectedTab = 0
                }
            Spacer()
            Image(systemName: "person.circle")
                .padding(.trailing, 10)
                .onTapGesture {
                    selectedTab = 1
                }
        }
        .background(.white)
        .foregroundStyle(.tint)
        .frame(maxHeight: 25)
    }
}
