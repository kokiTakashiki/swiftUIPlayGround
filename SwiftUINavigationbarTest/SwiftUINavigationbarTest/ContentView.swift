//
//  ContentView.swift
//  SwiftUINavigationbarTest
//
//  Created by 武田孝騎 on 2022/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var queryString: String = ""
    var body: some View {
        NavigationView {
            List {
                Text("test")
                Text("test")
                NavigationLink(
                    "Destination Page",
                    destination: DestinationPageView()
                )
            }
            .listStyle(.plain)
            //.navigationTitle("SwiftUI")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Text("test")
                    Button("About") {
                        print("About tapped!")
                    }

                    Button("Help") {
                        print("Help tapped!")
                    }
                }
            }
        }
        .searchable(text: $queryString, placement: .navigationBarDrawer(displayMode: .always)) {
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
