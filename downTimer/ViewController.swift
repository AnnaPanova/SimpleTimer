//
//  ViewController.swift
//  downTimer
//
//  Created by Анна on 21.06.18.
//  Copyright © 2018 Анна. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    @IBAction func actionSlider(_ sender: UISlider) {
        time = Int(sender.value)
        myLabel.text = "\(time) Seconds"
        switch time {
        case 0: myLabel.textColor = .red
        case 1...6: myLabel.textColor = .orange
        default: myLabel.textColor = .green
        }
        buttonForStart.isEnabled = true
    }
    
    @IBOutlet weak var buttonForStart: UIButton!
    
    var time = 0
    var timer = Timer()
    
    @IBAction func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(goTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        timer.invalidate()
        time = 0
        mySlider.setValue(0, animated: true)
        myLabel.textColor = UIColor.black
        myLabel.text = "\(time) Seconds"
        buttonForStart.isEnabled = false
    }
    
    @objc func goTimer(){
        if time == 0 {
            timer.invalidate()
            myLabel.textColor = UIColor.red
            myLabel.text = "Time is over"
            buttonForStart.isEnabled = true
        } else {
            if time <= 6 {
                time -= 1
                mySlider.setValue(Float(time), animated: true)
                myLabel.text = "\(time) Seconds"
                myLabel.textColor = UIColor.orange
                buttonForStart.isEnabled = false
            } else {
                time -= 1
                mySlider.setValue(Float(time), animated: true)
                myLabel.textColor = UIColor.green
                myLabel.text = "\(time) Seconds"
                buttonForStart.isEnabled = false
            }
        }
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        timer.invalidate()
        buttonForStart.isEnabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "\(time) Seconds"
        buttonForStart.isEnabled = false
    }
    
    
    
    
}

