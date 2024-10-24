import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                }
                
                Section {
                    Text("Hello World 2!")
                    Text("Hello World 2!")
                    Text("Hello World 2!")
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
