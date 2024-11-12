import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Tap me") {
                        // something goes here
                    }
                }
                
                ToolbarItemGroup(placement: .destructiveAction){
                    Button("1") {
                        //
                    }
                    
                    Button("2") {
                        //
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
