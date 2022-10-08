//
//  ViewController.swift
//  every
//
//  Created by mac on 2022/09/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PASSWORDTextField: UITextField!
    @IBOutlet weak var LOGINButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        IDTextField.layer.cornerRadius = 27
        IDTextField.clipsToBounds = true
        PASSWORDTextField.layer.cornerRadius = 27
        PASSWORDTextField.clipsToBounds = true
        LOGINButton.layer.cornerRadius = 27
    }


}

