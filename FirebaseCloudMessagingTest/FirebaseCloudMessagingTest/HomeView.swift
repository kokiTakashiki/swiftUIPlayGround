//
//  HomeView.swift
//  FirebaseCloudMessagingTest
//
//  Created by 武田孝騎 on 2022/08/09.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var pushDetailViewModel: PushDetailViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: PushDetailView(),
                    isActive: .constant(pushDetailViewModel.isActivePushDetailView),
                    label: {
                        EmptyView()
                    }
                )
                
                Text("Home")
            }
            .navigationTitle("HOME")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
