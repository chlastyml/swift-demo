//
//  ViewController.swift
//  navigation
//
//  Created by kacalek on 05/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func goToSecondScreenBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.objectId = "abc123"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

