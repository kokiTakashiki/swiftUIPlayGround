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
                .highPriorityGesture(TapGesture())
            }
            .content.offset(x: self.offset)
            .frame(width: geometry.size.width, height: nil, alignment: .leading)
            .onChange(of: index) { value in
                withAnimation {
                    self.offset = -geometry.size.width * CGFloat(self.index)
                }
            }
            .gesture(DragGesture()
                .onChanged({ value in
                    if abs(value.translation.width) > abs(value.translation.height) {
                        withAnimation {
                            self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                        }
                    }
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
