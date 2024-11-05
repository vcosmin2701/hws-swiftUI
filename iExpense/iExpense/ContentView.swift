import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    //@State private var expenses = Expenses() iOS 17+
    @State private var showingAddExpense = false
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func styleAmount(_ value: Double) -> Color {
        var currentStyle: Color
        if value < 10 {
            currentStyle = .red
        }else if value > 10 && value < 100 {
            currentStyle = .green
        }else{
            currentStyle = .indigo
        }
        return currentStyle
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(styleAmount(item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense){
            AddView(expenses: expenses)
        }
    }
}

#Preview {
    ContentView()
}
