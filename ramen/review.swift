//
//  review.swift
//  ramen
//
//  Created by Stanley-Robins-Hwasin on 2021/1/6.
//

import UIKit

class reviewController: UIViewController {
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var review: UITextView!
    @IBOutlet weak var rule: UITextView!
    @IBOutlet weak var likeButton: UIButton!
    
    var temp_author = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        review.layer.contents = UIImage(#imageLiteral(resourceName: "sticknote.png")).cgImage
        rule.layer.contents = UIImage(#imageLiteral(resourceName: "sticknote.png")).cgImage
        author.text = temp_author
    }
    
    
    
}

