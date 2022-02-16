//
//  RepoDetailLabelView.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import SwiftUI

struct RepoDetailLabelView: View {
    var labelText: String
    var iconName: String
    var colorType: Color

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .imageScale(.medium)
                .foregroundColor(colorType)
            if labelText == "" {
                Text("not_found")
                    .font(.footnote)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                Text(labelText)
                    .font(.footnote)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }.padding(.bottom, 6.0)
    }
}

struct RepoDetailLabelView_Previews: PreviewProvider {
    static var previews: some View {
        let mock = mock()
        RepoDetailLabelView(labelText: mock.repos[0].language ?? "",
                            iconName: "circle.fill",
                            colorType: .githubC)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
