import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    //@State private var expenses = Expenses() iOS 17+
    
    var body: some View {
        ExpenseList(expenses: expenses)
    }
}

#Preview {
    ContentView()
}
