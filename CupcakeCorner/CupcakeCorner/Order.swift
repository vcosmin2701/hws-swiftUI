import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 0
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFroasting = false
                addSprinkles = false
            }
        }
    }
    var extraFroasting = false
    var addSprinkles = false
}
