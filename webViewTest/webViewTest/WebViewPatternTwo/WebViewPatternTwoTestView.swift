//
//  WebViewPatternTwoTestView.swift
//  webViewTest
//
//  Created by 武田孝騎 on 2022/04/02.
//

import SwiftUI

struct WebViewPatternTwoTestView: View {
    @State private var action = WebViewAction.idle
    @State private var state = WebViewState.empty
    @State private var address = "https://www.google.com"
    @State var isShowHalfModal = false
    
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            titleView
            navigationToolbar
            errorView
            Divider()
            WebView(action: $action,
                    state: $state,
                    restrictedPages: ["apple.com"],
                    htmlInState: true)
            Spacer()
        }
    }
    
    private var titleView: some View {
        HStack {
            Spacer()
            Text(state.pageTitle ?? "Load a page")
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {
                isShowHalfModal.toggle()
            }) {
                Image(systemName: "chevron.left.forwardslash.chevron.right").renderingMode(.original)
            }.halfModal(isShow: $isShowHalfModal, sheet: {
                VStack(spacing: 0) {
                    Spacer()
                    MainHeaderView(selectedIndex: $selectedIndex)
                    TabView(selection: $selectedIndex) {
                        ZStack {
                            Color.black.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                            Text(state.pageHTML ?? "")
                                .lineLimit(nil)
                                .foregroundColor(.white)
                                .background(.black)
                        }
                        .tag(0)
                        ZStack {
                            Color.yellow.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                            Text(state.pageScript ?? "")
                                .lineLimit(nil)
                                .foregroundColor(.white)
                                .background(.black)
                        }
                        .tag(1)
                        ZStack {
                            Color.green.frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
                            Text(state.pageStyleSheets ?? "")
                                .lineLimit(nil)
                                .foregroundColor(.white)
                                .background(.black)
                        }
                        .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .ignoresSafeArea()
                }
            }, onEnd: {
                
            })
            Spacer()
            Spacer()
        }
    }
    
    private var navigationToolbar: some View {
        HStack(spacing: 10) {
            Button("Test HTML") {
                action = .loadHTML("<html><body><b>Hello World!</b></body></html>")
            }
            TextField("Address", text: $address)
            if state.isLoading {
                if #available(iOS 14, macOS 11, *) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Text("Loading")
                }
            }
            Spacer()
            Button("Go") {
                if let url = URL(string: address) {
                    action = .load(URLRequest(url: url))
                }
            }
            Button(action: {
                action = .reload
            }) {
                if #available(iOS 14, macOS 11, *) {
                    Image(systemName: "arrow.counterclockwise")
                        .imageScale(.large)
                } else {
                    Text("Reload")
                }
            }
            if state.canGoBack {
                Button(action: {
                    action = .goBack
                }) {
                    if #available(iOS 14, macOS 11, *) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                    } else {
                        Text("<")
                    }
                }
            }
            if state.canGoForward {
                Button(action: {
                    action = .goForward
                }) {
                    if #available(iOS 14, macOS 11, *) {
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                    } else {
                        Text(">")
                    }
                }
            }
        }.padding()
    }
    
    private var errorView: some View {
        Group {
            if let error = state.error {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
            }
        }
    }
}

struct WebViewPatternTwoTestView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewPatternTwoTestView()
    }
}
