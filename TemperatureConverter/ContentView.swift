//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Angelique Lau on 27/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tempValue = 0.0;
    @State private var convertedResult = 0.0;
    @State private var selection = "Celsius";
    let options = ["Fahrenheit", "Celsius"];
    
    var body: some View {
        
        VStack {
            //show the title of the app
            Text("Temperature Converter")
                .font(.title2)
                .bold()
            
            //layout for user input for the degrees and the dropdown menu for selecting the conversion
            HStack {
                
                VStack(alignment: .leading) {
                    Text("Degrees")
                        .font(.subheadline)
                        .bold()
                    TextField("Degrees", value: $tempValue, format: .number)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Spacer()
                
                //dropdown menu
                VStack(alignment: .trailing) {
                    Text("Convert to")
                        .font(.subheadline)
                        .bold()
                    Picker("Select a conversion", selection: $selection) {
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(.gray.opacity(0.2), lineWidth: 1))
                }
                
            }
            .padding()
            
            //showing results
            VStack(alignment: .center) {
                Text("Result")
                    .font(.headline)
                if(selection == "Celsius") {
                    Text(String(format: "%.2f", convertedResult) + " °C")
                        .padding()
                }
                else {
                    Text(String(format: "%.2f", convertedResult) + " °F")
                        .padding()
                }
            }
            
            Button("Convert") {
                if(selection == "Celsius") {
                    convertedResult = fahrenheitToCelsius(fahrenheit: tempValue)
                }
                else if(selection == "Fahrenheit") {
                    convertedResult = celsiusToFahrenheit(celsius: tempValue)
                }
               
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            
            Spacer()
        }
        .padding()
    }
}

//convert fahrenheit to celsius
func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    let celsius = (fahrenheit - 32) / 1.8
    
    return celsius;
}

//convert celsius to fahrenheit
func celsiusToFahrenheit(celsius: Double) -> Double {
    let fahrenheit = celsius * 1.8 + 32
    
    return fahrenheit;
}

#Preview {
    ContentView()
}
