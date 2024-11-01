import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var resultMessage = ""
    
    private var calculatedTime: String {
        if let result = calculateBedtime() {
            result.formatted(date: .omitted, time: .shortened)
        }else{
            "Error"
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    
    private var pluralCoffee: String {
        coffeeAmount > 1 ? "cups" : "cup"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Sleep amount") {
                    Text("When do you want to wake up ?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Picker("Hours", selection: $sleepAmount) {
                        ForEach(Array(stride(from: 4.0, through: 12.0, by: 1.0)), id: \.self) { hour in
                            Text("\(hour, specifier: "%.0f") hours")
                        }
                    }
                }

                Section("Daily Coffee Intake"){
                    Stepper("\(coffeeAmount) \(pluralCoffee)", value: $coffeeAmount, in: 1...20)
                }
                
                Section("Your ideal time to go to sleep"){
                    Text("\(calculatedTime)")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedtime() -> Date? {
        var result: Date
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            result = sleepTime
            return result
            
        } catch {
            resultMessage = "Error trying to predict the time."
            return nil
        }
    }
}

#Preview {
    ContentView()
}
