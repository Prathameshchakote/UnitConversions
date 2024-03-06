//
//  ContentView.swift
//  UnitConversions
//
//  Created by Prathamesh on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var inputIsFocused: Bool
    @State private var input = 0.0
    @State private var initialUnit = ""
    @State private var outputUnit = ""
    @State private var conversionType = ""
    
    let typeOfConversion = ["Temperature","Length","Time","Volume"]
    
    var units:[String] {
        switch conversionType {
        case "Temperature":
            return ["Celsius", "Fahrenheit", "Kelvin"]
        case "Length":
            return ["meters", "kilometers", "feet", "yards", "miles"]
        case "Time":
            return ["seconds", "minutes", "hours", "days"]
        case "Volume":
            return ["milliliters", "liters", "cups", "pints", "gallons"]
        default:
            return []
        }
        
    }
    
    var output : Double {
        var unitIntMeter = 0.0
        var out = 0.0
        
        if(conversionType == "Length") {
            switch initialUnit {
            case "meters":
                unitIntMeter = input
            case "kilometers":
                unitIntMeter = input * 1000.0
            case "feet":
                unitIntMeter = input * 0.3048
            case "yards":
                unitIntMeter = input * 0.9144
            case "miles":
                unitIntMeter = input * 1609.34
            default:
                unitIntMeter = input
            }
            
            switch outputUnit {
            case "meters":
                out = unitIntMeter
            case "kilometers":
                out = unitIntMeter / 1000.0
            case "feet":
                out = unitIntMeter / 0.3048
            case "yards":
                out = unitIntMeter / 0.9144
            case "miles":
                out = unitIntMeter / 1609.34
            default:
                out = unitIntMeter
            }
        } else if (conversionType == "Temperature") {
            var unitIntCelsius = 0.0
            switch initialUnit {
            case "Celsius":
                unitIntCelsius = input
            case "Fahrenheit":
                unitIntCelsius = (input * 32.0) / 1.80
            case "Kelvin":
                unitIntCelsius = input - 273.15
            default:
                unitIntMeter = input
            }
            
            switch outputUnit {
            case "Celsius":
                out = unitIntCelsius
            case "Fahrenheit":
                out = (unitIntCelsius * 1.80) + 32.0
            case "Kelvin":
                out = unitIntCelsius + 273.15
            default:
                out = unitIntCelsius
            }
        } else if (conversionType == "Time") {
            var unitInseconds = 0.0
            switch initialUnit {
            case "seconds":
                unitInseconds = input
            case "minutes":
                unitInseconds = input * 60
            case "hours":
                unitInseconds = input * 60 * 60
            case "days":
                unitInseconds = input * 60 * 60 * 24
            default:
                unitInseconds = input
            }
            
            switch outputUnit {
            case "seconds":
                out = unitInseconds
            case "minutes":
                out = unitInseconds / 60.0
            case "hours":
                out = unitInseconds / (60.0 * 60.0)
            case "days":
                out = unitInseconds / (60.0 * 60.0 * 24)
            default:
                out = unitInseconds
            }
        } else if (conversionType == "Volume") {
            var unitInMiLi = 0.0
            switch initialUnit {
            case "milliliters":
                unitInMiLi = input
            case "liters":
                unitInMiLi = input * 1000
            case "cups":
                unitInMiLi = input * 236.58
            case "pints":
                unitInMiLi = input * 473.16
            case "gallons":
                unitInMiLi = input * 3785.41
            default:
                unitInMiLi = input
            }
            
            switch outputUnit {
            case "milliliters":
                out = unitInMiLi
            case "liters":
                out = unitInMiLi / 1000.0
            case "cups":
                out = unitInMiLi / 236.58
            case "pints":
                out = unitInMiLi / 473.16
            case "gallons":
                out = unitInMiLi / 3785.41
            default:
                out = unitInMiLi
            }
        }
        
        return out
    }
    
    var body: some View {
        NavigationStack {
            
            Form() {
                Section("Choose Type of Conversion") {
                    Picker("Choose from", selection: $conversionType) {
                        ForEach(typeOfConversion , id: \.self) {
                            Text("\($0)")
                        }
                        
                    }
                }
                
                Section("\(conversionType) Conversion") {
                    TextField("Enter value", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                    Picker("Unit 1 = \(initialUnit)", selection: $initialUnit) {
                        ForEach(units , id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Unit 2 = \(outputUnit)", selection: $outputUnit) {
                        ForEach(units , id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                    
                }
                
                Section("\(conversionType) in \(outputUnit)") {
                    Text("\(output)")
                }
            }
            .navigationTitle("Convert")
            .toolbar {
                if(inputIsFocused) {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
        
    }
}
    
    #Preview {
        ContentView()
    }
