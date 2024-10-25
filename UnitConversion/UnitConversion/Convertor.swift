class Convertor {
    private var inType: TemperatureType
    private var outType: TemperatureType
    private var input: Double
    
    init(inType: TemperatureType, outType: TemperatureType, input: Double){
        self.inType = inType
        self.outType = outType
        self.input = input
    }
}

