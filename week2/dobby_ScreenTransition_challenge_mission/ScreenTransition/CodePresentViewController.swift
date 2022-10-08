//
//  CodePresentViewController.swift
//  ScreenTransition
//
//  Created by mac on 2022/09/27.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

   
}
