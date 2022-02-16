//
//  GithubFetcher.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import Foundation

class GithubFetcher {
    private let urlLink = "https://api.github.com"    
    func repos(completion: @escaping ([Repo]) -> Void) {
        let reputationsUrl = urlLink + "/users/kokiTakashiki/repos"
        URLSession.shared.dataTask(with: URL(string: reputationsUrl)!) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedResultData = try decoder.decode([Repo].self, from: data)
                DispatchQueue.main.async {
                    completion(searchedResultData.reversed())
                }
            } catch {
                print("json convert failed in JSONDecoder. ")
                print(error)
            }
        }.resume()
    }
    
    func languages(repoName: String, completion: @escaping (Languages) -> Void) {
            let reputationsUrl = urlLink + "/repos/kokiTakashiki/\(repoName)/languages"
            URLSession.shared.dataTask(with: URL(string: reputationsUrl)!) { (data, response, error) in
                guard let data = data else { return }
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    let searchedResultData = try decoder.decode(Languages.self, from: data)
                    DispatchQueue.main.async {
                        print(searchedResultData)
                        completion(searchedResultData)//.reversed())
                    }
                } catch {
                    print("json convert failed in JSONDecoder. ")
                    print(error)
                }
            }.resume()
        }
}
