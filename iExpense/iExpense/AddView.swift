import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var currentCurrency = "RON"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    let currencies = ["RON", "EUR", "USD"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name",text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $currentCurrency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currentCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
