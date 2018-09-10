//
//  ScanText.swift
//  todo-app
//
//  Created by kacalek on 10/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class ScanText: UILabel {
    var wroteFlag = false
    
    func getText() -> String {
        return self.text ?? "-"
    }
    
    func setText(text: String) {
        self.wroteFlag = true
        self.text = text
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
