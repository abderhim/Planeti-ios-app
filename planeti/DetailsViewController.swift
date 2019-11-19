//
//  DetailsViewController.swift
//  planeti
//
//  Created by Admin on 4/6/18.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var team2name: UILabel!
    @IBOutlet weak var team1name: UILabel!
   
    
    var team1n = ""
    var team2n = ""
    var seguename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "vidic.png")!)
        let background = UIImage(named: "vidic")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        team2name?.text = team2n
        team1name?.text = team1n
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "standings"{
            if let destinationVC = segue.destination as? StandingsViewController {
                destinationVC.teamonename = self.team1n
                destinationVC.teamtwoname = self.team2n
                
            }
        }
        else  if segue.identifier == "headtohead"{
            if let destinationVC2 = segue.destination as? headtoheadViewController {
                destinationVC2.teamonename = self.team1n
                destinationVC2.teamtwoname = self.team2n
                destinationVC2.seguename = self.seguename
                
            }
        }
        else  if segue.identifier == "form"{
            if let destinationVC2 = segue.destination as? FormViewController {
                destinationVC2.teamonename = self.team1n
                destinationVC2.teamtwoname = self.team2n
               // destinationVC2.seguename = self.seguename
                
            }
        }
        else  if segue.identifier == "odds"{
            if let destinationVC2 = segue.destination as? OddsViewController {
                destinationVC2.teamonename = self.team1n
                destinationVC2.teamtwoname = self.team2n
                // destinationVC2.seguename = self.seguename
                
            }
        }
        else  if segue.identifier == "scrapping"{
            if let destinationVC2 = segue.destination as? scrappingoddsViewController {
                destinationVC2.teamonename = self.team1n
                destinationVC2.teamtwoname = self.team2n
                // destinationVC2.seguename = self.seguename
                
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

}
