//
//  ReposListViewModel.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import Foundation

class ReposListViewModel: ObservableObject {
    let fetcher = GithubFetcher()
    @Published var reposData: [Repo] = []
    @Published var isShowIndicator = true
    @Published var languagesData: [Languages] = []

    init() {
        self.fetcher.repos { (repos) in
            //sleep(1)
            self.reposData = repos
            self.isShowIndicator = false
        }
    }
    
    func selectedRepoLanguagesData(repoName: String) {
        self.fetcher.languages(repoName: repoName) { (languages) in
            //sleep(1)
            self.languagesData = languages
            self.isShowIndicator = false
        }
    }
}
