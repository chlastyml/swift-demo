//
//  CrossroadsTableViewController.swift
//  todo-app
//
//  Created by kacalek on 07/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class CrossroadsTableViewController: UITableViewController {

    @IBOutlet weak var darkSwitch: UISwitch!
    var darkColor: UIColor? = nil
    @IBAction func darkSwitchClick(_ sender: UISwitch) {
        if(sender.isOn){
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.barTintColor = UIColor.darkGray
        }else{
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
            self.navigationController?.navigationBar.barTintColor = UIColor.white
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    @IBAction func navigateToCook(_ sender: Any){
        print("COOK")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
