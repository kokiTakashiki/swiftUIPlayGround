//
//  APIError.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/17.
//

import UIKit

enum APIError: Error{
    case networkError(_ error: Error)
    case jsonParse(_ error: Error)
    case unknown(error: String)

    var title: String{
        switch self{
        case .networkError:
            return "ネットワークエラー"
        case .jsonParse:
            return "JSONパースエラー"
        case .unknown:
            return "不明なエラー"
        }
    }

    var description: String{
        switch self {
        case .networkError(let error):
            return "接続環境の良いところでもう一度お試しください。\(error.localizedDescription)"
        case .jsonParse(let error):
            return "jsonParseに失敗しました。。\(error.localizedDescription)"
        case .unknown(let error):
            return "不明なエラーです。\(error)"
        }
    }

    func showAlert(from: UIViewController){
        UIAlertController.showAPIErrorAlert(error: self, from)
    }
}
