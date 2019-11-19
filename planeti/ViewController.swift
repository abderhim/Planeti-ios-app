//
//  ViewControlle/Users/admin/Downloads/planeti/planeti/headtoheadViewController.swiftr.swift
//  planeti
//
//  Created by ESPRIT on 03/04/2018.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit
import Toast_Swift
import UserNotifications
import UserNotificationsUI

class ViewController: UIViewController {
    
    
    let requestIdentifier = "SampleRequest" //identifier is to cancel the notification request


   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("notification will be triggered in one seconds..Hold on tight")
                let content = UNMutableNotificationContent()
                content.title = "New Fixtures are coming!"
                content.subtitle = ""
                content.body = ""
                content.sound = UNNotificationSound.default()
        
               
                // Deliver the notification in five seconds.
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1.0, repeats: false)
                let request = UNNotificationRequest(identifier:requestIdentifier, content: content, trigger: trigger)
        
                UNUserNotificationCenter.current().delegate = self
                UNUserNotificationCenter.current().add(request){(error) in
        
                    if (error != nil){
        
                        print(error?.localizedDescription)
                    }
                }
        
        
        var style = ToastStyle()
        
        // this is just one of many style options
        style.messageColor = .white
       //// let username = UserDefaults.standard.string(forKey: "username") as String!
       // let string2 = "Welcome   "
       // let concat = string2 + username!
        self.view.makeToast("       WELCOME       ", duration: 2.0, position: .center, style: style)
        let background = UIImage(named: "vidic")
        
       var imageView : UIImageView!
    imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
     imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
          self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "premierleague"{
            if let destinationVC = segue.destination as? MatchesViewController {
                destinationVC.seguename = "premierleague"
            }
        }
        if segue.identifier == "calcio"{
            if let destinationVC = segue.destination as? MatchesViewController {
                destinationVC.seguename = "calcio"
            }
        }
        if segue.identifier == "liga"{
            if let destinationVC = segue.destination as? MatchesViewController {
                destinationVC.seguename = "liga"
            }
        }
        if segue.identifier == "bundesliga"{
            if let destinationVC = segue.destination as? MatchesViewController {
                destinationVC.seguename = "bundesliga"
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        return true
    }

}

extension ViewController:UNUserNotificationCenterDelegate{
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Tapped in notification")
    }
    
    //This is key callback to present notification while the app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("Notification being triggered")
        //You can either present alert ,sound or increase badge while the app is in foreground too with ios 10
        //to distinguish between notifications
        if notification.request.identifier == requestIdentifier{
            
            completionHandler( [.alert,.sound,.badge])
            
        }
    }
}
