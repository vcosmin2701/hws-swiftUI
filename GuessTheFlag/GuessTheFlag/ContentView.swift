import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Color. : .primary, .secondary -> semantic colors
            // Custom color: Color(red: 1, green: 0.8, blue: 0)
            
            // Color.yellow // will be treated as a view, whole content will be red
                //.frame(width: 200, height: 200)
                // .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial) // vibrancy
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
