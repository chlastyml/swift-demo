//
//  AlphaVC.swift
//  navigation
//
//  Created by kacalek on 05/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class AlphaVC: UIViewController {
    
    @IBAction func alfaBtnClick(_ sender: Any) {
        goTo(data: DataObject(text: "Alfa"))
    }
    @IBAction func betaBtnClick(_ sender: Any) {
        goTo(data: DataObject(text: "Beta"))
    }
    @IBAction func GammaBtnClick(_ sender: Any) {
        goTo(data: DataObject(text: "Gamma"))
    }
    
    func goTo(data: DataObject) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "second_view") as! BravoVC
        
        nextVC.data = data
        
        present(nextVC, animated: true, completion: nil)
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
