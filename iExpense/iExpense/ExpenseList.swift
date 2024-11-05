import SwiftUI
import Foundation

struct ExpenseList: View {
    @State private var showingAddExpense = false
    
    var expenses = Expenses()
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                        ExpenseListItem(item: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets)
                    }
                }
                
                Section("Business") {
                    ForEach(expenses.items.filter { $0.type == "Business" }) { item in
                        ExpenseListItem(item: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets)
                    }
                }
            }
            .navigationTitle("iExpense")
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
    }
}

#Preview {
    ExpenseList(expenses: Expenses())
}
