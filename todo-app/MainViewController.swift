//
//  MainViewController.swift
//  todo-app
//
//  Created by kacalek on 07/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var mainPicker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    let mathOperations: [String] = ["Karel", "Vojta", "Magdalena", "Pavel"]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let sing: String = mathOperations[row]
        label.text = sing
        print(sing)
        return sing
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let source = DataSource()
        
        mainPicker.dataSource = self
        mainPicker.delegate = self

        label.text = "S: "
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
