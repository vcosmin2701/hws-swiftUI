import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: [Int]
    
    // or
    // @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                    
                    // or
                    
                    // path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    // in this case if we want to go to the
    // very first view, we can removeAll()
    // because is an array of ints
    @State private var path = [Int]()
    
    // or
    
    // @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
