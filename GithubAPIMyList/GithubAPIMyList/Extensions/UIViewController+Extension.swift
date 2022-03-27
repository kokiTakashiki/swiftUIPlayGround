//
//  UIViewController+Extension.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/17.
//

import UIKit

extension UIAlertController{
    static func showAPIErrorAlert(error: APIError, _ viewController: UIViewController){
        let title = error.title
        let message = error.description
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
