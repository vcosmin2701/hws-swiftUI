import SwiftUI

struct ExpenseListItem: View {
    var item: ExpenseItem
    
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
}
