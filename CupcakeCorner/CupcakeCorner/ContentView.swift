import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

@Observable
class User: Codable {
    
    // without codingkey -> leak
    enum CodingKeys: String, CodingKey {
        case _name = "name" // will give the name instead of _name
    }
    
    var name = "LinkinPark"
}

struct ContentView: View {
    @State private var results = [Result]()
    
    @State private var username = ""
    @State private var email = ""
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
            }
        }.task {
            // await loadData()
        }
        
        // with image from closure
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        
        // with phase in closure which provides also the image and error
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 50, height: 50)
        
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
//            .disabled(username.isEmpty || email.isEmpty)
            .disabled(disabledForm)
        }
        
        Button("Encode", action: encodeBand)
        
    }
    
    // load tracks from iTunes
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=linkin+park&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
    
    func encodeBand() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView()
}
