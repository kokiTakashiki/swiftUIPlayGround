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
        state = MyState(selectionIndex: .one, swipeable: false)
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
        @Published var swipeable: Bool
        init(selectionIndex: PageIndex, swipeable: Bool) {
            self.selectionIndex = selectionIndex
            self.swipeable = swipeable
        }
    }
    
    func changeState(new: MyState) {
        state.selectionIndex = new.selectionIndex
        state.swipeable = new.swipeable
    }
}
