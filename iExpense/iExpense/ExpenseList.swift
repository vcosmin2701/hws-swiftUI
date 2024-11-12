import SwiftUI
import Foundation

struct ExpenseList: View {
    @ObservedObject var expenses = Expenses()

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
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
            .toolbar {
                NavigationLink(destination: AddView(expenses: expenses)) {
                    Label("Add Expense", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    ExpenseList(expenses: Expenses())
}
