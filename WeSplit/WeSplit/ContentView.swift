import SwiftUI

struct ContentView: View {
    let students = ["Hary", "Cosmo", "John"]
    @State private var selectedStudent = "Hary"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a student")
        }
    }
}

#Preview {
    ContentView()
}
