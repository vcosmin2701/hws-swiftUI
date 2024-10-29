import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Text("Hello, this is a text")
            Text("This is another text")
            
            Spacer()
        }
        
        HStack(spacing: 20) {
            Text("Apple")
            Text("Team")
        }
        
        ZStack {
            Text("⛅️")
                .font(.system(size: 30))
            Text("🦊")
        }
    }
}

#Preview {
    ContentView()
}
