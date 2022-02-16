//
//  LanguageLabelView.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import SwiftUI

struct LanguageLabelView: View {
    var labelText: String
    var iconName: String
    var colorType: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .imageScale(.medium)
                .foregroundColor(LanguageLabelView.selectColor(type: colorType))
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

// MARK: Private
extension LanguageLabelView {
    private static func selectColor(type: String) -> Color {
        switch type {
        case "C":
            return .githubC
        case "Swift":
            return .githubSwift
        case "ShaderLab":
            return .githubShaderLab
        case "JavaScript":
            return .githubJavaScript
        case "C#":
            return .githubCSharp
        case "HTML":
            return .githubHTML
        default:
            return .clear
        }
    }
}

struct LanguageLabelView_Previews: PreviewProvider {
    static var previews: some View {
        let mock = mock()
        LanguageLabelView(labelText: mock.repos[0].language ?? "",
                            iconName: "circle.fill",
                            colorType: mock.repos[0].language ?? "")
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
