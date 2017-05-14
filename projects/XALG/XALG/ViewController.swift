//
//  ViewController.swift
//  XALG
//
//  Created by Juguang Xiao on 07/05/2017.
//  Copyright © 2017 Juguang Xiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label : UILabel = {
       let l = UILabel()
        l.text = "For usage on XALG framework\nPlease check XALGTests\n\nhttps://github.com/between40and2/XALG"
        l.numberOfLines = -1
        l.textAlignment = .center
        l.textColor = UIColor.darkGray
        l.backgroundColor = UIColor.lightGray
        return l
    }()
    override func loadView() {
        view = label
    }
  
}

