//
//  SegmentPickerPageViewModel.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/09/01.
//

import SwiftUI
import Combine

final class SegmentPickerPageViewModel: ObservableObject {
    var state: MyState
    var anyCancellables: [AnyCancellable] = []
    init() {
        state = MyState(selectionIndex: .one)
        state.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &anyCancellables)
    }
}

extension SegmentPickerPageViewModel {
    final class MyState: ObservableObject {
        @Published var selectionIndex: PageIndex
        @Published var isDrag: Bool = true
        init(selectionIndex: PageIndex) {
            self.selectionIndex = selectionIndex
        }
    }
    
    func changeState(new: MyState) {
        state.selectionIndex = new.selectionIndex
    }
}
