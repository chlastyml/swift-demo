//
//  TimerViewController.swift
//  todo-app
//
//  Created by kacalek on 10/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBAction func playBtnClick(_ sender: Any) {
    }
    @IBAction func pauseBtnClick(_ sender: Any) {
        
    }
    @IBAction func resetBtnClick(_ sender: Any) {
        
    }
    
    var timer: MyTimer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = MyTimer(label: timeLabel)
    }
    
    func runTimer() {
        if let time = timer {
            time.start()
        }
    }
}

class MyTimer {
    var seconds = 60
    var timer: Timer? = nil
    var isRuning = false
    var outputLabel: UILabel? = nil
    
    init(label: UILabel) {
        outputLabel = label
    }
    
    func start() {
        if (!isRuning){
            isRuning = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MyTimer.updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTimer() {
        if(seconds <= 0){
            if let label = outputLabel {
                label.text = "KONEC"
            }
        }else {
            seconds -= 1
            if let label = outputLabel {
                label.text = "\(seconds)"
            }
        }
    }
}











