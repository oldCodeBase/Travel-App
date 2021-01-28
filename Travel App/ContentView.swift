//
//  ContentView.swift
//  Travel App
//
//  Created by Ibragim Akaev on 28/01/2021.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y: 400)
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }.font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(8)
                    
                    DiscoverCategoriesView()
                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                        
                    }.background(Color.init(white: 0.95, opacity: 1))
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
