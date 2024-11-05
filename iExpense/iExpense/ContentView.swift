import SwiftUI
import Observation

// @Observable
class User: ObservableObject{
    @Published var firstName = "Bruno"
    @Published var lastName = "Bruce"
    
    func getFullName() -> String{
        "\(firstName) \(lastName)"
    }
}

struct Freak: Codable {
    let name: String
    let team: String
}

struct ContentView: View {
    @StateObject private var user = User()
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    // @AppStorage("tapCount") private var tapCount = 0
    
    @State private var freak = Freak(name: "Cosmo", team: "Apple Team")
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Your name is: \(user.getFullName())")
                
                TextField("name", text: $user.firstName)
                
                Button("Show Sheet"){
                    showingSheet.toggle()
                }.sheet(isPresented: $showingSheet) {
                    SecondView(name: "Cosmo")
                }
                
                Button("Save freak to DB") {
                    let encoder = JSONEncoder()
                    
                    if let data = try? encoder.encode(freak) {
                        UserDefaults.standard.set(data, forKey: "FreakData")
                    }
                }
                
                VStack {
                    List {
                        ForEach(numbers, id: \.self) {
                            Text("Row \($0)")
                        }
                        .onDelete(perform: removeRows)
                    }
                    
                    Button("Add Number") {
                        numbers.append(currentNumber)
                        currentNumber += 1
                    }
                }
                
                VStack {
                    Button("Tap count: \(tapCount)") {
                        tapCount += 1
                        UserDefaults.standard.set(tapCount, forKey: "Tap")
                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ContentView()
}
