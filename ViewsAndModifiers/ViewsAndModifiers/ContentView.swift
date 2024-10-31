import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, world!"){
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
        
        VStack {
            Text("Sometext")
                .blur(radius: 2.0)
            Text("Sometext")
            Text("Sometext")
            Text("Sometext")
            Text("Sometext")
        }
        .blur(radius: 10.0)
        
    }
}

#Preview {
    ContentView()
}
