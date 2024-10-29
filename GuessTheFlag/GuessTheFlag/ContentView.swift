import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button1") { }
                .buttonStyle(.bordered)
            
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            
            Button("Edit", systemImage: "pencil.circle") {
                print("Button was pressed!")
            }
            
            Button {
                print("Button was tapped")
            } label: {
                Label("Edit 2", systemImage: "pencil") // better than HStack in this case
            }
            
            // Image(decorative: "singapore") -> decorative for screen readers
            Image(systemName: "pencil.circle")
                .foregroundStyle(.red)
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
