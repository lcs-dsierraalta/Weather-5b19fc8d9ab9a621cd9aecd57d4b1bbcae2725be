//
//  iOSApp.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

@main
struct iOSApp: App {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                NavigationView {
                    // Call site (where you create an instance of something if you are calling the initializer)
                    ContentView(viewModel: viewModel,
                                temperature: viewModel.history.last!.temperature,
                                feel: viewModel.history.last!.feel,
                                conditions: viewModel.history.last!.feel)
                }
                .tabItem {
                    Image(systemName: "sun.haze.fill")
                    Text("Current")
                }

                NavigationView {
                    HistoryView(viewModel: viewModel)
                }
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }

            }
            
        }
    }
}
