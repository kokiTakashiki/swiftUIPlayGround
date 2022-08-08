//
//  ContentView.swift
//  PageTabViewStyleTest
//
//  Created by 武田孝騎 on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                SegmentedPickerExample(titles: ["Page1","Page2","Page3","Page4","page5"], selectedIndex: $selection)
                
                TabView(selection: $selection) {
                    Text("Page 1")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.red)
                        .tag(0)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(0, anchor: .trailing)
                            }
                        }
                    Text("Page 2")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green)
                        .tag(1)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(1, anchor: .trailing)
                            }
                        }
                    Text("Page 3")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue)
                        .tag(2)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(2, anchor: .trailing)
                            }
                        }
                    Text("Page 4")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.yellow)
                        .tag(3)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(3, anchor: .trailing)
                            }
                        }
                    Text("Page 5")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange)
                        .tag(4)
                        .onAppear{
                            withAnimation {
                                scrollView.scrollTo(4, anchor: .trailing)
                            }
                        }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
