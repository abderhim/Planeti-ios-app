//
//  OddsViewController.swift
//  planeti
//
//  Created by Sim1718 on 4/13/18.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData
class OddsViewController: UIViewController {

   
    @IBOutlet weak var team2name: UILabel!
    @IBOutlet weak var team1name: UILabel!
 
    
    
    
    var localIp = ""
    var teamonename = ""
    var teamtwoname = ""
    var seguename = ""
   
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImage(named: "vidic")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        team2name?.text = teamtwoname
        team1name?.text = teamonename
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "1x"{
            if let destinationVC = segue.destination as? lasx2ViewController {
                destinationVC.teamonen = self.teamonename
                destinationVC.teamtwon = self.teamtwoname
                
            }
        }
        if segue.identifier == "over"{
            if let destinationVC = segue.destination as? overViewController {
                destinationVC.teamonen = self.teamonename
                destinationVC.teamtwon = self.teamtwoname
                
            }
        }
        if segue.identifier == "ggng"{
            if let destinationVC = segue.destination as? ggngViewController {
                destinationVC.teamonen = self.teamonename
                destinationVC.teamtwon = self.teamtwoname
                
            }
        }
        
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


