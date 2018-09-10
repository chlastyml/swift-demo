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
        if (!isTimeRunning){
            runTimer()
        }
    }
    @IBAction func pauseBtnClick(_ sender: Any) {
        isTimeRunning = !isTimeRunning
    }
    @IBAction func resetBtnClick(_ sender: Any) {
        timeLabel.text = "01:00"
        timer = Timer()
        seconds = 60
        isTimeRunning = false
    }
    
    var seconds = 60
    var timer = Timer()
    var isTimeRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "01:00"
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
        isTimeRunning = true
    }
    
    @objc func updateTimer() {
        if(seconds <= 0){
            print("Konec")
            timeLabel.text = "KONEC"
        }else if(isTimeRunning){
            seconds -= 1
            timeLabel.text = "\(seconds)"
        }
    }
}
