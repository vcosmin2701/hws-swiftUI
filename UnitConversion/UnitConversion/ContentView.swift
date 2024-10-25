import SwiftUI

enum TemperatureType {
    case celsius, fahrenheit, kelvin
}

struct ContentView: View {
    @State private var inputType: TemperatureType = .celsius
    @State private var outputType: TemperatureType = .fahrenheit
    @State private var inputValue = 0.0
    @State private var outputValue = 0.0
    
    let units: [TemperatureType] = [.celsius, .fahrenheit, .kelvin]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input type") {
                    Picker("From", selection: $inputType) {
                        ForEach(units,  id: \.self) { unit in
                            Text("\(unit)")
                        }
                    }
                }
                
                Section("Output type") {
                    Picker("To", selection: $outputType) {
                        ForEach(units, id: \.self) { unit in
                            Text("\(unit)")
                        }
                    }
                }
                
                Section("Initial value") {
                    Text("Value: ")
                }
                
                Section("Conversion value") {
                    Text("Value:")
                }
            }
            .navigationTitle("Conversion App")
        }
    }
}

#Preview {
    ContentView()
}
