//
//  AlarmViewController.swift
//  AppLeo
//
//  Created by Iskander Valiev on 7/17/17.
//  Copyright © 2017 ITIS Team #3. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

let requestIdentifier = "SampleRequest"

class AlarmViewController: UIViewController {
    
    var timerAppLeo: Timer?
    var seconds: Double = 1
    @IBOutlet weak var currentTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        
        var date = Date()
        var calendar = Calendar.current
        var hours =    calendar.component(.hour, from: date)
        var minutes = calendar.component(.minute, from: date)
        var seconds = calendar.component(.second, from: date)
        
        
            scheduleNotification(inSeconds: 10, completion: {(success) in
                if success {
                    print("success")
                } else {
                    print("fail")
                }
            })
        
        
    }
    
    func startTimer() {
        
        if timerAppLeo == nil {
            timerAppLeo = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.loop), userInfo: nil, repeats: seconds > 0)
        }
        else{
            print(seconds)
        }
    }
    
    
    func loop() {
        //        if seconds>0{
        //        seconds += 0.1
        //            seconds = Double(round(10*seconds)/10)
        //        timerView.text = "\(seconds)"
        //        print(seconds)
        //        }
        var date = Date()
        var calendar = Calendar.current
        var hours =    calendar.component(.hour, from: date)
        var minutes = calendar.component(.minute, from: date)
        var seconds = calendar.component(.second, from: date)
        currentTime.text = "\(hours) : \(minutes) : \(seconds)"
        currentTime.sizeToFit()
        
    }
    
    func showNotification() {
        
    }
    
    func scheduleNotification(inSeconds seconds: TimeInterval, completion: (Bool) -> ()) {
        
        removeNotifications(withIdentifiers: ["notification"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        
        let content = UNMutableNotificationContent()
        content.title = "you should go to sleep in 10 minutes"
        content.body = "you should go to sleep in 10 minutes"
        content.sound = UNNotificationSound.default()
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
    
    func removeNotifications(withIdentifiers identifiers: [String]) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
}


