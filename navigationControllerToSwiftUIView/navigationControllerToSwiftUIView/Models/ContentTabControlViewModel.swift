//
//  ContentTabControlViewModel.swift
//  navigationControllerToSwiftUIView
//
//  Created by 武田孝騎 on 2022/10/21.
//

import SwiftUI
import Combine

final class ContentTabControlViewModel: ObservableObject {
    var state: MyState
    var anyCancellables: [AnyCancellable] = []
    init() {
        state = MyState(selectionItem: .house)
        state.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &anyCancellables)
    }
}

extension ContentTabControlViewModel {
    final class MyState: ObservableObject {
        @Published var selectionItem: TabBarItem
        init(selectionItem: TabBarItem) {
            self.selectionItem = selectionItem
        }
    }
    
    func changeState(new: MyState) {
        state.selectionItem = new.selectionItem
    }
}
