//
//  ObservableScrollView.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/10.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGPoint
    static var defaultValue = CGPoint.zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}

struct ObservableScrollView<Content> : View where Content : View {

    var content: Content

    var axes: Axis.Set

    var showsIndicators: Bool

    init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.axes = axes
        self.showsIndicators = showsIndicators
    }

    var body: some View {
        GeometryReader { outerGeometry in
            ScrollView(self.axes, showsIndicators: self.showsIndicators) {
                ZStack(alignment: self.axes == .vertical ? .top : .leading) {
                    GeometryReader { innerGeometry in
                        Color.green
                            .preference(key: ScrollOffsetPreferenceKey.self, value: CGPoint(x: (outerGeometry.frame(in: .global).minX - innerGeometry.frame(in: .global).minX), y: (outerGeometry.frame(in: .global).minY - innerGeometry.frame(in: .global).minY)))
                            .p("innerGeometry minY: \(innerGeometry.frame(in: .global).midY), h: \(innerGeometry.frame(in: .global).height)")
                            .p("outerGeometry minY: \(outerGeometry.frame(in: .global).midY), h: \(outerGeometry.frame(in: .global).height)")
                    }
                    VStack {
                        self.content
                    }
                }
            }
        }
    }
}

struct ObservableInfiniteListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel

    var axes: Axis.Set
    var showsIndicators: Bool
    
    @State var lastItemHeight: CGFloat = 0.0

    init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true) {
        self.axes = axes
        self.showsIndicators = showsIndicators
    }

    var body: some View {
        GeometryReader { outerGeometry in
            ZStack(alignment: self.axes == .vertical ? .top : .leading) {
                ScrollView(self.axes, showsIndicators: self.showsIndicators) {
                    GeometryReader { innerGeometry in
                        Color.green
                            .frame(height: lastItemHeight)
                            .preference(key: ScrollOffsetPreferenceKey.self, value: CGPoint(x: (outerGeometry.frame(in: .global).minX - innerGeometry.frame(in: .global).minX), y: (outerGeometry.frame(in: .global).minY - innerGeometry.frame(in: .global).minY)))
                            .p("innerGeometry minY: \(innerGeometry.frame(in: .global).midY), h: \(innerGeometry.frame(in: .global).height)")
                    }
                }
                .frame(height: lastItemHeight)
                InfiniteList(data: $viewModel.items,
                             isLoading: $viewModel.isLoading,
                             loadMore: viewModel.loadMore) { item, firstItem, lastItem in
                    GeometryReader { innerGeometry in
                        Text(item.text)
                        
                        if item == firstItem {
                            EmptyView()
                                .p("InfiniteList first item: \(item.text + " \(String(describing: firstItem?.text))") , midY: \(innerGeometry.frame(in: .global).midY)")
                                .onChange(of: innerGeometry.frame(in: .global).midY) { value in
                                    self.lastItemHeight = value
                                }
                        }
                        
                        if item == lastItem {
                            EmptyView()
                                .p("InfiniteList last item: \(item.text + " \(String(describing: lastItem?.text))") , midY: \(innerGeometry.frame(in: .global).midY)")
                                .onChange(of: innerGeometry.frame(in: .global).midY) { value in
                                    self.lastItemHeight = value
                                }
                                
                        }
                    }
                }
            }
            //.p("outerGeometry midX: \(outerGeometry.frame(in: .global).midX), midY: \(outerGeometry.frame(in: .global).midY)")
        }
    }
}

extension ObservableInfiniteListView {
    func onScroll(_ onScroll: @escaping (CGPoint) -> ()) -> some View {
        self.onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: onScroll)
    }
}

extension ObservableScrollView {
    func onScroll(_ onScroll: @escaping (CGPoint) -> ()) -> some View {
        self.onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: onScroll)
    }
}
