import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
        NavigationStack{
            List(0..<100) { row in
                NavigationLink("Row \(row)"){
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
        
        
    }
}

#Preview {
    ContentView()
}
