//
//  HomeView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TabView {
            Tab("Weather", systemImage: "square.grid.2x2.fill") {
                DashboardView()
            }
            
            Tab("Weather", systemImage: "magnifyingglass") {
                CitySearchView()
            }
           
            Tab("Weather", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    HomeView()
}
