//
//  SeguePushViewController.swift
//  ScreenTransition
//
//  Created by mac on 2022/09/27.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        // self.navigationController?.popToRootViewController(animated: true) 이걸 하면 네비게이션 스택 가장 밑바닥, 첫 번째 화면 루트 뷰 컨트롤러로 이동
    }
    
 
}
