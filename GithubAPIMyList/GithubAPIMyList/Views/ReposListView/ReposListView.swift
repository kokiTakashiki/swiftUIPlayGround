//
//  ReposListView.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import SwiftUI

struct ReposListView: View {
    @ObservedObject private var viewModel = ReposListViewModel()
        
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    List(viewModel.reposData) { repo in
                        NavigationLink(destination: RepoDetailView(repoData: repo)) {
                            RepoListRowView(repoData: repo)
                        }
                    }
                    if self.viewModel.isShowIndicator {
                        AnyView(ProgressView("loading"))
                    }
                }
            }
            .navigationBarTitle(Text("title"))
        }
    }
}

struct ReposListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en_US", "ja_JP"], id: \.self) { id in
            ReposListView()
                .environment(\.locale, .init(identifier: id))
                //.environment(\.colorScheme, .dark)
        }
    }
}
