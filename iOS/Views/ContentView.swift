//
//  ContentView.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

struct ContentView: View {
    
    // Because the properties have no default values, the call site must provide arguments to populate them
    @ObservedObject var viewModel: WeatherViewModel
    
    @State var temperature: Double = 0.0
    
    @State var feel: String = ""

    @State var conditions: String = ""

    var body: some View {

        VStack {
            
            Spacer()
            
            Text("\(conditions)")
                .font(.title)

            Text("\(String(format: "%.1f", arguments: [temperature])) °C")
                .font(.largeTitle)
                .bold()
            
            Text("\(feel)")
                .font(.title3)
            
            Spacer()
            
            Button {
                
                // Get a new prediction from the view model
                let prediction = viewModel.providePrediction()
                
                // Populate state variables so the user interface updates
                temperature = prediction.temperature
                feel = "That's \(prediction.feel.lowercased())."
                conditions = prediction.condition.description
                
            } label: {
                Text("Get New Prediction")
            }
            
            Spacer()

            
        }
        .navigationTitle("Current")
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
