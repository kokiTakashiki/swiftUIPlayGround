//
//  HeaderView.swift
//  webViewTest
//
//  Created by 武田孝騎 on 2022/04/03.
//

import SwiftUI

struct HeaderView: View {
    @State var selectedIndex = 0
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 0) {
            MainHeaderView(selectedIndex: $selectedIndex)
            TabView(selection: $selectedIndex) {
                ZStack {
                    Color.blue.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                    Text("HTML")
                }
                .tag(0)
                ZStack {
                    Color.yellow.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                    Text("Second")
                }
                .tag(1)
                ZStack {
                    Color.green.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                    Text("Third")
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
        }
    }
}

struct HighlightedMenuItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 4)
            .foregroundColor(Color(UIColor.black))
    }
}

struct UnhighlightedMenuItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 4)
    }
}

extension View {
    func highlighted() -> some View {
        self.modifier(HighlightedMenuItem())
    }
    
    func unhighlighted() -> some View {
        self.modifier(UnhighlightedMenuItem())
    }
}

struct MainHeaderView: View {
    @Binding var selectedIndex: Int
    @Environment(\.colorScheme) var colorScheme
    @Namespace private var tabSelection

    var body: some View {
        HStack{
            Spacer()
            if selectedIndex == 0 {
                Text("HTML")
                    .underline()
                    .highlighted()
                    //.background(menuCapsule)
            } else {
                Text("HTML")
                    .unhighlighted()
                    .onTapGesture {selectedIndex = 0 }
            }
            Spacer()
            if selectedIndex == 1 {
                Text("Second")
                    .underline()
                    .highlighted()
                    //.background(menuCapsule)
            } else {
                Text("Second")
                    .unhighlighted()
                    .onTapGesture {selectedIndex = 1 }
            }
            Spacer()
            if selectedIndex == 2 {
                Text("Third")
                    .underline()
                    .highlighted()
                    //.background(menuCapsule)
            } else {
                Text("Third")
                    .unhighlighted()
                    .onTapGesture {selectedIndex = 2 }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .font(.subheadline)
        .foregroundColor(colorScheme == .dark ? Color(UIColor.lightText) : Color(UIColor.darkGray))
        //.animation(.easeOut(duration: 0.2), value: selectedIndex)
    }
    var menuCapsule: some View {
        Capsule()
            .foregroundColor(.yellow)
            .matchedGeometryEffect(id: "capsule", in: tabSelection)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
