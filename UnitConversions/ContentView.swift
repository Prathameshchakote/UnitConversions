//
//  ContentView.swift
//  UnitConversions
//
//  Created by Prathamesh on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input = 0.0
    @State private var initialUnit = ""
    @State private var outputUnit = ""

    var units = ["meters", "kilometers", "feet", "yards", "miles"]
    var output : Double {
        return input
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            
            Form {
                Section {
                    TextField("Enter value", value: $input, format: .number)
                    
                    Picker("Unit 1", selection: $initialUnit) {
                        ForEach(units , id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Unit 2", selection: $outputUnit) {
                        ForEach(units , id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Change")
                    
                    
                    
                    }
                }
                .navigationTitle("COnvert")
            }
            
        }
    }
    
    #Preview {
        ContentView()
    }
