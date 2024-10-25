import SwiftUI

struct ContentView: View {
    @State private var inputType: TemperatureType = .celsius
    @State private var outputType: TemperatureType = .fahrenheit
    @State private var inputValue = 0.0
    @FocusState private var hideKeyboard: Bool
    
    let units: [TemperatureType] = [.celsius, .fahrenheit, .kelvin]
    
    let convertor = Convertor()
    
    var outputValue: Double {
        convertor.convert(from: inputType, to: outputType, value: inputValue)
    }
    
    var tempSign: String {
        switch outputType {
        case .celsius:
            "°C"
        case .fahrenheit:
            "°F"
        case .kelvin:
            "°K"
        }
    }
    
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
                    TextField(
                        "Input value to convert",
                        value: $inputValue,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                    .focused($hideKeyboard)
                    .toolbar {
                        if hideKeyboard {
                            Button("Done") {
                                hideKeyboard = false
                            }
                        }
                    }
                }
                
                Section("Conversion value") {
                    Text("\(outputValue, format: .number.rounded(increment: 0.01)) \(tempSign)")
                }
            }
            .navigationTitle("Conversion App")
        }
    }
}

#Preview {
    ContentView()
}
