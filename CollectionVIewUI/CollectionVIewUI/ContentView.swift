//
//  ContentView.swift
//  CollectionVIewUI
//
//  Created by 武田孝騎 on 2021/05/16.
//

import SwiftUI

struct ContentView: View {
    // cellに相当
    private var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 10), spacing: CGFloat(0.0) ), count: 4)
    var body: some View {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
                    ForEach((1...50), id: \.self) { num in
                        ZStack {
                            Rectangle().foregroundColor(.white)
                                .aspectRatio(1,contentMode: .fill)
                                .border(Color.black)
                            Text("\(num)")
                        }
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
