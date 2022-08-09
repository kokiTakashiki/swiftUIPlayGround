//
//  PushDetailView.swift
//  FirebaseCloudMessagingTest
//
//  Created by 武田孝騎 on 2022/08/09.
//

import SwiftUI

struct PushDetailView: View {
    @EnvironmentObject var viewModel: PushDetailViewModel
    
    var body: some View {
        WebView(urlString: viewModel.urlString)
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear(perform: {
                viewModel.isActivePushDetailView = false
            })
    }
}

struct PushDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PushDetailView()
    }
}
