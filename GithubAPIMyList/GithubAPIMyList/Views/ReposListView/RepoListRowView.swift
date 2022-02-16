//
//  RepoListRowView.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import SwiftUI

struct RepoListRowView: View {
    var repoData: Repo
        
        var body: some View {
            VStack(alignment: .leading) {
                if repoData.name == "" {
                    Text("not_found")
                        .font(.headline)
                } else {
                    Text(repoData.name)
                        .font(.headline)
                }
                LanguageLabelView(labelText: String(repoData.language ?? ""),
                                     iconName: "circle.fill",
                                    colorType: repoData.language ?? "")
            }
            
        }
}

struct RepoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let mock = mock()
        ForEach(["en_US", "ja_JP"], id: \.self) { id in
            Group {
                RepoListRowView(repoData: mock.repos[0])
                    .environment(\.locale, .init(identifier: id))
                RepoListRowView(repoData: mock.repos[2])
                    .environment(\.locale, .init(identifier: id))
            }
            .previewLayout(.fixed(width: 300, height: 100))
        }
    }
}
