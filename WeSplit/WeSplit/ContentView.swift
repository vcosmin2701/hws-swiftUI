import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    var bill: (Double, Double) {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        
        let tipAmount = checkAmount * (tipSelection / 100)
        let totalAmount = checkAmount + tipAmount
        
        let amountPerPerson = totalAmount / peopleCount
        
        return (totalAmount, amountPerPerson)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(0..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip ?") {
                    Picker("Tip amount", selection: $tipPercentage){
                        ForEach(Array(stride(from: 0, to: 101, by: 5)), id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Total bill") {
                    Text(bill.0, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person") {
                    Text(bill.1, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
