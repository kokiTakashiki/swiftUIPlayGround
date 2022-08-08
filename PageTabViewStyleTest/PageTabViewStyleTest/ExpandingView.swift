//
//  ExpandingView.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

struct ExpandingView: View {
    
    @State var isExpanded = false
    var id: Int
    var proxy: ScrollViewProxy
    var body: some View {
        VStack {
            Text("Hello!")
            if isExpanded {
                Text("World")
            }
        }
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
                proxy.scrollTo(id, anchor: .center)
            }
        }
    }
}

struct TestScrollView: View {
    var body: some View {
        ScrollViewReader { view in
            Text("Title")
            ScrollView {
                ForEach(0...100, id: \.self) { id in
                    ExpandingView(id: id, proxy: view)
                        .id(id)
                        .padding()
                }
            }
        }
    }
}

struct TestScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TestScrollView()
    }
}
