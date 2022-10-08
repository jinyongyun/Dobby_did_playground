//
//  OutcomeViewController.swift
//  Basic Calculator


import UIKit

class OutcomeViewController: UIViewController {
    var result = ""
    @IBOutlet weak var outcomelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outcomelabel.text = result
     
    }
    

    @IBAction func tapbackbutton(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
}
