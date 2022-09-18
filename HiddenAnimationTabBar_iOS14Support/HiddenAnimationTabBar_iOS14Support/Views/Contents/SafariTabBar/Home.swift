//
//  Home.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/13.
//

import SwiftUI

struct Home: View {
    
    var proxy: GeometryProxy
    @StateObject var viewModel = BottomBarViewModel()
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 15) {
                    ForEach(1...6, id: \.self) { index in
                        MatrixView()
                            .frame(width: proxy.size.width - 30, height: 250)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .padding(.bottom,70)
                .modifier(OffsetModifier())
                .environmentObject(viewModel)
            }
            .coordinateSpace(name: "TabScroll")
            .p("\(viewModel.offset)")
            
            BottomBar()
                .environmentObject(viewModel)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        SafariTabBar()
    }
}

struct BottomBar: View {
    @EnvironmentObject var viewModel: BottomBarViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle_iOS14
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                .padding(.trailing,10)
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                
                Image(systemName: "magnifyingglass")
                    .font(.callout)
                    .foregroundColor(.primary)
                
                TextField("", text: $viewModel.searchText)
                
                lockIcon
                
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "square.on.square")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
            }
            .colorScheme(.dark)
            .padding(.horizontal)
        }
        .frame(height: 60)
        .padding([.horizontal])
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

extension BottomBar {
    @ViewBuilder
    var RoundedRectangle_iOS14: some View {
        if #available(iOS 15.0, *) {
            RoundedRectangle(cornerRadius: 12)
                .fill(.regularMaterial)
                .colorScheme(.dark)
        } else {
            RoundedRectangle(cornerRadius: 12)
                .fill(.gray)
        }
    }
    
    @ViewBuilder
    var lockIcon: some View {
        if #available(iOS 15.0, *) {
            Image(systemName: "lock")
                .symbolVariant(.fill)
                .font(.callout)
                .foregroundColor(.primary)
        } else {
            Image(systemName: "lock.fill")
                .font(.callout)
                .foregroundColor(.primary)
        }
    }
}

struct OffsetModifier: ViewModifier {
    @EnvironmentObject var model: BottomBarViewModel
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .named("TabScroll")).minY
                    Task {
                        
                        model.offset = minY
                    }
                    return Color.clear
                }
                ,alignment: .top
            )
    }
}
