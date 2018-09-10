//
//  SecondViewController.swift
//  navigation
//
//  Created by kacalek on 05/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var objectId: String?
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) { }
    
    @IBAction func forwardBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "fromSecondToThirdScreen", sender: nil)
    }
    
    @IBAction func takeMeBackBtnClick(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
