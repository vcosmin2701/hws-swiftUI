import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(stops: [
            Gradient.Stop(color: .white, location: 0.45),
            Gradient.Stop(color: .black, location: 0.55)
        ], startPoint: .top, endPoint: .bottom)
        
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.indigo.gradient)
    }
}

#Preview {
    ContentView()
}
