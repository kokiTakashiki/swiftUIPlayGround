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
    @StateObject private var viewModel = ReposListViewModel()
    func reload() {
        self.viewModel.selectedRepoLanguagesData(repoName: repoData.name)
        print("repoData \(repoData.name)")
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
                    if let description = repoData.description {
                        Text(description)
                    } else {
                        Text("not_found")
                    }
                    
                }
                
                Group {
                    Divider()
                    Text("language")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onAppear { reload() }
                    Spacer()
                    
                    if viewModel.languagesData.count == 0 {
                        Text("not_found")
                    } else {
                        ForEach(RepoDetailView.languagesKeys(viewModel.languagesData), id: \.self) { data in
                            Divider()
                            LanguageLabelView(labelText: data,
                                              iconName: "circle.fill",
                                              colorType: data)
                        }
                    }
                }
            }
            .padding()
            if self.viewModel.isShowIndicator {
                AnyView(ProgressView("Loading..."))
            }
        }
        .navigationBarTitle("details", displayMode: .inline)
    }
    
    private static func languagesKeys(_ target: [Languages]) -> [String] {
        var result = [String]()
        for i in target {
            let keys = i.keys
            result = result + keys
        }
        return result
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mock = mock()
        ForEach([ColorScheme.light, ColorScheme.dark], id: \.self) { colorScheme in
            ForEach(["iPhone 12", "iPod touch (7th generation)"], id: \.self) { deviceName in
                ForEach(["en_US", "ja_JP"], id: \.self) { id in
                    RepoDetailView(repoData: mock.repos[0])
                        .environment(\.locale, .init(identifier: id))
                        .preferredColorScheme(colorScheme)
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
                }
            }
        }
    }
}
