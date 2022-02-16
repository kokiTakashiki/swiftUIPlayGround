//
//  RepoDetailView.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import SwiftUI

struct RepoDetailView: View {
    var repoData: Repo
    
    // Languages用
    @ObservedObject private var viewModel = ReposListViewModel()
    func reload() {
        self.viewModel.selectedRepoLanguagesData(repoName: repoData.name)
        print(repoData.name)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: リポジトリ名
                Group {
                    HStack {
                        if repoData.name == "" {
                            Text("not_found")
                                .font(.title)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                        } else {
                            Text(repoData.name)
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        RepoDetailLabelView(labelText:String(repoData.fullName),
                                             iconName: "person.fill",
                                             colorType: .blue)
                        Spacer()
                        LanguageLabelView(labelText: String(repoData.language ?? ""),
                                             iconName: "circle.fill",
                                            colorType: repoData.language ?? "")
                        Spacer()
                        Spacer()
                    }

                    RepoDetailLabelView(labelText: String(repoData.htmlUrl),
                                         iconName: "ellipsis.curlybraces",
                                         colorType: .blue)
                    
                    RepoDetailLabelView(labelText: String(repoData.license?.name ?? ""),
                                         iconName: "person.text.rectangle.fill",
                                         colorType: .blue)
                    Divider()
                    Text(repoData.description ?? "not_found")
                    Divider()
                }

                
            }
            .padding()
            if self.viewModel.isShowIndicator {
                AnyView(ProgressView("Loading..."))
            }
        }
        .navigationBarTitle("details", displayMode: .inline)
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mock = mock()
        RepoDetailView(repoData: mock.repos[0])
    }
}
