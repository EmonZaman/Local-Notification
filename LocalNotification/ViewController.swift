//
//  ViewController.swift
//  LocalNotification
//
//  Created by Twinbit Limited on 9/11/22.
//

import UIKit

import UserNotifications
class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notification"
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    @IBAction func btnLocalNotification(_sender: UIButton){
        print("Button Is Taped")
        //content
        let content = UNMutableNotificationContent()
        
        content.categoryIdentifier = "My Category Identifier"
        content.badge = 1
        content.title = "Category title"
        content.body = "This is body part"
        
        content.sound = UNNotificationSound.default
        //content Image
        let url = Bundle.main.url(forResource: "test1", withExtension: "jpg")
        
        let attachment = try! UNNotificationAttachment(identifier: "image", url: url!, options: [:])
        
        content.attachments = [attachment]
        //trigger time
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1, repeats: false)
        let identifier = "main identifier"
        //request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        //add request ot notification center
        notificationCenter.add(request){
             (error) in
            print("\(error?.localizedDescription)")
        }
        
        //notification action
        
        let like = UNNotificationAction.init(identifier: "Like", title: "Like", options: .foreground)
        
        let delete = UNNotificationAction.init(identifier: "Delete", title: "Delete", options: .destructive)
        
        let category = UNNotificationCategory(identifier: content.categoryIdentifier, actions: [like, delete], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
            
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .badge, .alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    
    
}

