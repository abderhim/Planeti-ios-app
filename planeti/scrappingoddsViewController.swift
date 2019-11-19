//
//  scrappingoddsViewController.swift
//  planeti
//
//  Created by Sim1718 on 4/13/18.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit
import SwiftSoup

class scrappingoddsViewController: UIViewController {
    @IBOutlet weak var team1name: UILabel!
    
    @IBOutlet weak var team2name: UILabel!
    
    @IBOutlet weak var team1image: UIImageView!
    
    @IBOutlet weak var team2image: UIImageView!
    
    @IBOutlet weak var las: UILabel!
    
    @IBOutlet weak var x: UILabel!
    
    @IBOutlet weak var dou: UILabel!
    var teamonename = ""
    var teamtwoname = ""
    var localIp = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team2name?.text = teamtwoname
        team1name?.text = teamonename
        team1image.image = UIImage (named:teamonename)
        team2image.image = UIImage (named:teamtwoname)
        // scraàp
        let url = URL(string: "https://www.betfair.com/sport/football?id=10932509&competitionEventId=2022802&action=loadCompetition&modules=multipickavbId@1061&selectedTabType=COMPETITION" )
        let task = URLSession.shared.dataTask(with: url!) {
            
            (data,response,error) in
            if error != nil {
                print(error)
            }
            else{
                
                let htmlcontent = NSString(data: data! ,encoding: String.Encoding.utf8.rawValue)
                print(htmlcontent)
                do {
                
                    let doc = try SwiftSoup.parse(htmlcontent as! String)
                  
                    do {
                        
                        let els: Elements = try doc.select("div")
                        for link: Element in els.array(){
                            let linkid: String = try link.attr("id")
                           // print(linkid)
                            if(linkid == "divMainEvents")
                            {
                                let div1 : Element = (try link.select("div").first())!
                               
                                let div2 : Element = (try div1.select("div").first())!
                                //try print(link)
                            }
                            }
                        } catch {}
                      //  try print(link.text())
                    }
                    catch {}
                }
            
            
            
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
