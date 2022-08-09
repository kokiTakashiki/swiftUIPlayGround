//
//  RootViewModel.swift
//  FirebaseCloudMessagingTest
//
//  Created by 武田孝騎 on 2022/08/09.
//

import SwiftUI
import Combine

class RootViewModel: ObservableObject {
    // 選択しているタブを保持するための変数
    @Published var selection = 1
    
    var cancellable: AnyCancellable?
    
    init() {
        // プッシュ通知選択時に通知を受け取る
        cancellable = NotificationCenter.default
            .publisher(for: Notification.Name("didReceiveRemoteNotification"))
            .sink { _ in
                // 「ホーム」タブを表示する
                self.selection = 1
            }
    }
}
