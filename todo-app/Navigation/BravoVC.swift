//
//  BravoVC.swift
//  navigation
//
//  Created by kacalek on 05/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class BravoVC: UIViewController {
    @IBOutlet weak var subDetailLabel: UILabel!
    
    var data: DataObject?
    
    @IBAction func gotoNavigationBtnClick(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "navigation") as! UINavigationController
        
        present(nextVC, animated: true, completion: nil)
    }
    @IBAction func backBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let subdetail = self.data?.text ?? "Undefined"
        self.subDetailLabel.text = subdetail
        print(subdetail)
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
