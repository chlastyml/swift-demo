//
//  ChameleonViewController.swift
//  todo-app
//
//  Created by kacalek on 11/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit
import ChameleonFramework

class ChameleonViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = label.textColor
        let bgColor = ContrastColorOf(color!, returnFlat: true)
        print(bgColor)
        self.view.backgroundColor = bgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
