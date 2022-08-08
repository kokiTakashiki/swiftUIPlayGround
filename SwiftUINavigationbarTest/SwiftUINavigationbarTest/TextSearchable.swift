//
//  TextSearchable.swift
//  SwiftUINavigationbarTest
//
//  Created by 武田孝騎 on 2022/07/21.
//

import SwiftUI

struct TextSearchable: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    "Destination Page",
                    destination: DestinationPageView()
                )
            }
            Text("Select a destination")
        }
    }
}

struct DestinationPageView: View {
    @State private var text = ""
    var body: some View {
        Text("Destination Page")
            .searchable(text: $text)
    }
}

struct TextSearchable_Previews: PreviewProvider {
    static var previews: some View {
        TextSearchable()
    }
}
