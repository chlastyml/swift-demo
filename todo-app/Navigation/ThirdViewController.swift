//
//  ThirdViewController.swift
//  navigation
//
//  Created by kacalek on 05/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func BackBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "unwindToHome", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func totalBackBtnClick(_ sender: Any) {
        let controllerName = "main_navigation"
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: controllerName)
        
        if let next = nextVC {
            present(next, animated: true, completion: nil)
        }else{
            print("Not found: ", controllerName)
        }
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
