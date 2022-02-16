//
//  mock.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

final class mock {
    let repos: [Repo]
    = [
        Repo(id: 991,
             name: "mock1",
             fullName: "kokiTakashiki/mock1",
             htmlUrl: "dummy_url",
             description: "test,test,test",
             language: "C",
             license: LicenseType(name: "mit", url: "dummy_license_url")
            ),
        Repo(id: 992,
             name: "mock2",
             fullName: "kokiTakashiki/mock2",
             htmlUrl: "dummy_url",
             description: "test,test,test",
             language: "Swift",
             license: LicenseType(name: "mit", url: "dummy_license_url")
            ),
        Repo(id: 993,
             name: "mock3",
             fullName: "kokiTakashiki/mock3",
             htmlUrl: "dummy_url",
             description: nil,
             language: nil,
             license: nil
            )
    ]
}
