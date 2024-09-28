//
//  NotificationManager.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 23/9/24.
//

import Foundation
import UserNotifications

public class NotificationManager {
   
    
    init(){
        
    }
 
    public func scheduleNotification(title: String, subtitle: String, hour: Int, minute: Int){
        
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
    
        var dateComp = DateComponents()
        dateComp.hour = hour
        dateComp.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
