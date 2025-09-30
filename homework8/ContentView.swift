//
//  ContentView.swift
//  homework8
//
//  Created by cisstudent on 9/29/25.
//

import SwiftUI

let menu: [MenuSection] = Bundle.main.decode([MenuSection].self, from: "MyData")

struct MenuItemDetail: View {

    @State private var isHovering = false

    let menuItem: MenuItem
    var body: some View {
        VStack {
            Image(menuItem.mainImage)
                .resizable()
                .scaledToFit()
            Text("Photo Credit: " + menuItem.photoCredit)
                .padding(.vertical)
            Text(menuItem.description).multilineTextAlignment(.leading)
        }.padding()
        Spacer()

    }
}

struct FoodDetail: View {
    var body: some View {
        List { // Use a List view for standard iOS list behavior
            ForEach(menu) { section in
                // Standard list item for the section name
                Text(section.name).font(.headline)

                // The sub-items can go directly in the ForEach for the list
                ForEach(section.items) { item in
                    NavigationLink(destination: MenuItemDetail(menuItem: item)) {
                        HStack {
                            Image(item.thumbnailImage)
                            Text(item.name)
                        }
                    }
                }
            }
        }
        .listStyle(.grouped) // Or another list style to control appearance
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
