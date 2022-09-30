//
//  PagerView.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/09/29.
//

import SwiftUI

struct PagerView<Content>: View
where
Content: View {
    
    @Binding private var index: Int
    @State private var offset: CGFloat = 0
    @State private var show: Bool = true
    private let content: Content
    private let endIndex: Int
    
    init(index: Binding<Int>,
         endIndex: Int,
         @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self._index = index
        self.endIndex = endIndex
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    content
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .content.offset(x: self.offset)
            .frame(width: geometry.size.width, height: nil, alignment: .leading)
            .onChange(of: index) { value in
                self.show = false
                withAnimation {
                    self.offset = -geometry.size.width * CGFloat(self.index)
                    self.show = true
                }
            }
            .allowsHitTesting(true)
            .blur(radius: show ? 0 : 1)
            .gesture(DragGesture()
                .onChanged({ value in
                    self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                })
                .onEnded({ value in
                    let scrollThreshold = geometry.size.width / 2
                    if value.predictedEndTranslation.width < -scrollThreshold {
                        self.index = min(self.index + 1, endIndex - 1)
                    } else if value.predictedEndTranslation.width > scrollThreshold {
                        self.index = max(self.index - 1, 0)
                    }

                    withAnimation {
                        self.offset = -geometry.size.width * CGFloat(self.index)
                    }
                })
            )
        }
    }
}
