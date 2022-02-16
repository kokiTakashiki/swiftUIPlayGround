//
//  Repos.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import Foundation
import SwiftUI

// https://api.github.com/users/kokiTakashiki/repos

struct Repo: Decodable, Identifiable {
    var id: Int
    var name: String
    var fullName: String
    var htmlUrl: String
    var description: String?
    var language: String?
    var license: LicenseType?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case fullName = "full_name"
        case htmlUrl = "html_url"
        case description = "description"
        case language = "language"
        case license = "license"
    }
}

struct LicenseType: Decodable, Hashable {
    var name: String
    var url: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
