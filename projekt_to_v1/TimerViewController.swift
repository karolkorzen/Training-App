//
//  TimerViewController.swift
//  projekt_to_v1
//
//  Created by Karol Korzeń on 11/01/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onOff(_ sender: UIButton) {
        if (ison == false) {
            ison=true
            runTimer()
        } else {
            ison=false
            stopTimer()
        }
    }
    
    
    @IBOutlet weak var timerDisplay: UILabel!
    
    @IBAction func slider(_ sender: UISlider) {
        timerDisplay.text=String(Int(sender.value))
        seconds=Int(sender.value)
        slideval=Int(sender.value)
    }
    
    
    var timer = Timer()
    var ison: Bool = false
    var slideval: Int = 0
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    var seconds:Int = 120
    @objc func updateTimer() {
        if (seconds == 0){
            stopTimer();
            seconds=slideval
            timerDisplay.text=String(slideval+1)
            ison=false
        }
        seconds -= 1     //This will decrement(count down)the seconds.
        timerDisplay.text = String(seconds)
    }
    


}
