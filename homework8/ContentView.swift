//
//  ContentView.swift
//  homework8
//
//  Created by cisstudent on 9/29/25.
//

import SwiftUI

let menu = Bundle.main.decode([MenuSection].self, from: "MyData")

struct FoodDetail: View {
    var body: some View {
        ForEach(menu) { section in
            NavigationLink(destination: {
                VStack(alignment: .leading) {
                    ForEach(section.items) { item in
                        
                        HStack {
                            Image(item.thumbnailImage)
                            Text(item.name)
                        }
                    }
                    
                }})
            {
                Text(section.name)
            }

        }
    }
}
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Image(systemName: "car.fill")
                    Text("Cars")
                }
                HStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                HStack {
                    Image(systemName: "figure.run")
                    Text("Fitness")
                }
                NavigationLink(destination: FoodDetail()) {
                    HStack {
                        Image(systemName: "fork.knife")
                        Text("Food")
                    }
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
