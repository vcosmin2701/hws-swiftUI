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

// conforms Codable
struct Company: Codable {
    let company_name: String
    let address: Address
}

struct Address: Codable {
    let city: String
    let country: String
}

struct ContentView: View {
    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
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
            List(0..<5) { row in
                NavigationLink("Row \(row)"){
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
            
            Button("DECODE JSON") {
                let input = """
                                {
                                    "company_name": "Agile Freaks",
                                    "address": {
                                        "city": "Sibiu",
                                        "country": "Romania"
                                    }
                                }
                                """
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                
                if let company = try? decoder.decode(Company.self, from: data) {
                    print(company.company_name)
                } else {
                    print("Failed to decode JSON")
                }
            }
            
            ScrollView(){
                LazyVGrid(columns: layout) {
                    ForEach(0..<100) {
                        Text("Item \($0)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
