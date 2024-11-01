enum ChoiceType: String {
    case rock = "🪨"
    case paper = "📄"
    case scissors = "✂️"
    
    func beats(_ other: ChoiceType) -> Bool {
        switch (self, other) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return true
        default:
            return false
        }
    }
}
