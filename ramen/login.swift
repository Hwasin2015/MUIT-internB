//
//  login.swift
//  ramen
//
//  Created by Stanley-Robins-Hwasin on 2021/1/5.
//

import UIKit

class loginController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var phonenum: UITextField!
    
    override func   viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 251/255, green: 210/255, blue: 107/255, alpha: 100/100)
    }
}
