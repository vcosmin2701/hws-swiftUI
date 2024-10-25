struct Convertor {
    func convert(from: TemperatureType, to: TemperatureType, value: Double) -> Double {
        switch from {
        case .celsius:
            return fromCelsius(to: to, value: value)
        case .fahrenheit:
            return fromFahrenheit(to: to, value: value)
        case .kelvin:
            return fromKelvin(to: to, value: value)
        }
    }
    
    private func fromCelsius(to: TemperatureType, value: Double) -> Double {
        switch to {
        case .fahrenheit:
            return (value * 9/5.0) + 32
        case .kelvin:
            return value + 273.15
        default:
            return value
        }
    }
    
    private func fromFahrenheit(to: TemperatureType, value: Double) -> Double {
        switch to {
        case .celsius:
            return (value - 32) * 5/9.0
        case .kelvin:
            return (value - 32) * 5/9.0 + 273.15
        default:
            return value
        }
    }
    
    private func fromKelvin(to: TemperatureType, value: Double) -> Double {
        switch to {
        case .celsius:
            return value - 273.15
        case .fahrenheit:
            return (value - 273.15) * 9/5.0 + 32
        default:
            return value
        }
    }
}
