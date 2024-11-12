import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(1..<1000){ i in
                NavigationLink("Tap Me") {
                    DetailView(number: i)
                }
            }
        }
    }
}


struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    ContentView()
}
