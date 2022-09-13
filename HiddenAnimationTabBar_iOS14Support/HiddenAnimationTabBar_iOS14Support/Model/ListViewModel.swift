//
//  ListViewModel.swift
//  HiddenAnimationTabBar_iOS14Support
//
//  Created by 武田孝騎 on 2022/09/10.
//

import SwiftUI
import Combine

struct ListItem: Hashable {
    let text: String
}

class ListViewModel: ObservableObject {
    @Published var items = [ListItem]()
    @Published var isLoading = false
    
    @Published var isHiddenTabBar: Bool = false
    
    private var page = 1
    private var subscriptions = Set<AnyCancellable>()
    
    func loadMore() {
        guard !isLoading else { return }
        
        isLoading = true
        (1...15).publisher
            .map { index in ListItem(text: "Page: \(page) item: \(index)") }
            .collect()
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .sink { [self] completion in
                isLoading = false
                page += 1
            } receiveValue: { [self] value in
                items += value
            }
            .store(in: &subscriptions)
    }
}
