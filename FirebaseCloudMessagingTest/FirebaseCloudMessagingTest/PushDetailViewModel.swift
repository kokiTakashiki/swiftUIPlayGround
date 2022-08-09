//
//  PushDetailViewModel.swift
//  FirebaseCloudMessagingTest
//
//  Created by 武田孝騎 on 2022/08/09.
//

import SwiftUI
import Combine

class PushDetailViewModel: ObservableObject {
    // プッシュ通知選択時にPushDetailViewへの画面遷移を実行するためのプロパティ
    @Published var isActivePushDetailView = false
    // PushDetailViewのタイトル
    var title = ""
    // PushDetailViewに表示するページのURL
    var urlString = ""
    
    var cancellable: AnyCancellable?
    
    init() {
        // プッシュ通知選択時に通知を受け取る
        // PushDetailViewに表示するタイトルとページのURLを取得
        // 変数isActivePushDetailViewの値を変更することでPushDetailViewへの画面遷移処理を発火させる
        cancellable = NotificationCenter.default
            .publisher(for: Notification.Name("didReceiveRemoteNotification"))
            .sink { notification in
                if let userInfo = notification.userInfo, let aps = userInfo["aps"] as? [AnyHashable: Any], let alert = aps["alert"] as? [AnyHashable: Any], let title = alert["title"], let urlString = userInfo["url"] {
                    self.title = title as? String ?? ""
                    self.urlString = urlString as? String ?? ""
                    self.isActivePushDetailView = true
                }
            }
    }
}
