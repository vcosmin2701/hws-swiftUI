import SwiftUI
import Foundation

struct ExpenseList: View {
    @State private var showingAddExpense = false
    
    @ObservedObject var expenses = Expenses()
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal"{
                            ExpenseListItem(item: item)
                        }
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets)
                    }
                }
                
                Section("Business") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            ExpenseListItem(item: item)
                        }
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
