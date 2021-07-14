//
//  OTPTimer.swift
//  Quick Fill
//
//  Created by Naveed-IOS on 28/10/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation

class OTPTimer {
    
    var timer: Timer?
    var totalTime = 60
    var didUpdateTime: ((String) -> Void)?
    var OnCompletion: (() -> Void)?
    private var currentRepeat = 0
    private var totalRpeats = 2
    
    func startOtpTimer() {
        self.totalTime = 60
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        print(self.totalTime)
        //self.lblTimer.text = self.timeFormatted(self.totalTime) // will show timer
        didUpdateTime?(self.timeFormatted(self.totalTime))
        
        if totalTime != 0 {
            totalTime -= 1  // decrease counter timer
        }
        else {
            
            //if currentRepeat == 2 {

                if let timer = self.timer {
                    timer.invalidate()
                    self.timer = nil
                    self.OnCompletion?()
                }
//            }
//            else {
//
//            }
            
         //   self.currentRepeat += 1
        }
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}
