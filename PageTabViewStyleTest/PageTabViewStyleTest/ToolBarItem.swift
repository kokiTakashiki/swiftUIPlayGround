//
//  ToolBarItem.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

//import SwiftUI
//
//struct ToolBarItem: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
struct ToolBarItem_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarItem()
    }
}

import SwiftUI

struct ToolBarItem: View {

    let contents: [String] = ["トップ", "経済・政治", "ビジネス", "マーケット", "テクノロジー", "国際・アジア", "スポーツ", "社会", "地域"]

    @State private var isPresented = false

    @State private var navTitle = "トップ"

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                Text("コンテンツ")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("速報")
                            .font(.headline)
                        Button {
                            isPresented.toggle()
                        } label: {
                            HStack {
                                Text(navTitle)
                                Image(systemName: "arrowtriangle.down.fill")
                            }
                            .font(.subheadline)
                            .foregroundColor(.primary)
                        }
                    }
                }

            }
            .fullScreenCover(isPresented: $isPresented) {
                NavigationView {
                    List {
                        ForEach(contents, id: \.self) { content in
                            Button {
                                isPresented.toggle()
                                navTitle = content
                            } label: {
                                HStack {
                                    Image(systemName: "arrowtriangle.down.fill")
                                    Text(content)
                                }
                            }
                        }
                    }
                    .navigationBarTitle("速報", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isPresented.toggle()
                            } label: {
                                Image(systemName: "xmark")
                            }
                        }
                    }

                }
            }
        }
            
    }
}
