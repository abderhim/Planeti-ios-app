//
//  FormViewController.swift
//  planeti
//
//  Created by Admin on 4/9/18.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit
import  Alamofire
import SwiftyJSON

class FormViewController: UIViewController {

    @IBOutlet weak var team1name: UILabel!
    @IBOutlet weak var team2name: UILabel!
    
    @IBOutlet weak var form5team2: UILabel!
    @IBOutlet weak var form4team2: UILabel!
    @IBOutlet weak var form3team2: UILabel!
    @IBOutlet weak var form2team2: UILabel!
    @IBOutlet weak var fom1team2: UILabel!
    @IBOutlet weak var form5team1: UILabel!
    @IBOutlet weak var form1team1: UILabel!
    @IBOutlet weak var form2team1: UILabel!
    @IBOutlet weak var form3team1: UILabel!
    @IBOutlet weak var form4team1: UILabel!
    var teamonename = ""
    var teamtwoname = ""
    var localIp = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.makeToast("Loading Form of both teams", duration: 5.0, position: .center)
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
        
        ///////////////parsing
        localIp="https://www.jasonbase.com/things/x3pa.json"
        Alamofire.request(localIp).responseJSON { response in
            if let json1 = response.result.value {
                let formattedJson1 = JSON(json1)
                
                
                
                
                let var1 = formattedJson1["results"].arrayValue
                
                
                for var2 in  var1 {
                    
                    
                    let team = var2["name"]
                    var string3 = String(describing: team)
                    var string4 = String(describing: team)
                    if (string3 == "Leicester City"){
                        
                        string3 = "Leicester"
                    }
                    if (string4 == "Leicester City"){
                        
                        string4 = "Leicester"
                    }
                    if (string3 == "Huddersfield Town"){
                        string3 = "Huddersfield"
                    }
                    if (string4 == "Huddersfield Town"){
                        string4 = "Huddersfield"
                    }
                    if (string3 == "Bournemouth"){
                        string3 = "Bournmouth"
                    }
                    if (string4 == "Bournemouth"){
                        string4 = "Bournmouth"
                    }
                    if (string4 == "West Bromwich Albion"){
                        string4 = "WestBrom"
                    }
                    if (string3 == "West Bromwich Albion"){
                        string3 = "WestBrom"
                    }
                    if (string4 == "Newcastle United"){
                        string4 = "Newcastle"
                    }
                    if (string3 == "Newcastle United"){
                        string3 = "Newcastle"
                    }
                    if (string4 == "Manchester United"){
                        string4 = "ManUnited"
                    }
                    if (string3 == "Crystal Palace"){
                        
                        string3 = "C.Palace"
                    }
                    if (string4 == "Crystal Palace"){
                        
                        string4 = "C.Palace"
                    }
                    if (string3 == "Manchester United"){
                        string3 = "ManUnited"
                    }
                    if (string4 == "Manchester City"){
                        string4 = "City"
                    }
                    if (string3 == "Manchester City"){
                        string3 = "City"
                    }
                    if (string4 == "Tottenham Hotspur"){
                        string4 = "Tottenham"
                    }
                    if (string3 == "Tottenham Hotspur"){
                        string3 = "Tottenham"
                    }
                    if (string4 == "West Ham United"){
                        string4 = "WestHam"
                    }
                    if (string3 == "West Ham United"){
                        string3 = "WestHam"
                    }
                    if (string4 == "Brighton & Hove Albion"){
                        string4 = "Brighton"
                    }
                    if (string3 == "Brighton & Hove Albion"){
                        string3 = "Brighton"
                    }
                    if (string3 == "Atlético"){
                        
                        string3 = "Atletico"
                    }
                    if (string4 == "Atlético"){
                        
                        string4 = "Atletico"
                    }
                    if (string3 == "Alavés"){
                        string3 = "Alaves"
                    }
                    if (string4 == "Deportivo"){
                        string4 = "Alaves"
                    }
                    if (string3 == "Deportivo"){
                        string3 = "Alaves"
                    }
                    if (string4 == "Alavés"){
                        string4 = "Alaves"
                    }
                    if (string4 == "Málaga"){
                        string4 = "Malaga"
                    }
                    if (string3 == "Málaga"){
                        string3 = "Malaga"
                    }
                    if (string4 == "Club Deportivo Leganés"){
                        string4 = "Club Deportivo Leganes"
                    }
                    if (string3 == "Club Deportivo Leganés"){
                        string3 = "Club Deportivo Leganes"
                    }
                    if (string3 == "FC Bayern München"){
                        
                        string3 = "FC Bayern"
                    }
                    if (string3 == "FC Bayern München"){
                        string3 = "FC Bayern"
                    }
                    if (string3 == "Eintracht Frankfurt"){
                        
                        string3 = "Francfurt"
                    }
                    if (string3 == "Eintracht Frankfurt"){
                        string3 = "Francfurt"
                    }
                    
                    if (string3 == "1899 Hoffenheim"){
                        
                        string3 = "Hoffenheim"
                    }
                    if (string3 == "1899 Hoffenheim"){
                        string3 = "Hoffenheim"
                    }
                    
                    if (string3 == "Hamburger SV"){
                        
                        string3 = "Hamburg"
                    }
                    if (string3 == "Hamburger SV"){
                        string3 = "Hamburg"
                    }
                    
                    if (string3 == "1. FSV Mainz 05"){
                        
                        string3 = "Mainz"
                    }
                    if (string3 == "1. FSV Mainz 05"){
                        string3 = "Mainz"
                    }
                    
                    if (string3 == "Werder Bremen"){
                        
                        string3 = "Bremen"
                    }
                    if (string3 == "Werder Bremen"){
                        string3 = "Bremen"
                    }
                    
                    if (string3 == "VfL Wolfsburg"){
                        
                        string3 = "Wolfsburg"
                    }
                    if (string3 == "VfL Wolfsburg"){
                        string3 = "Wolfsburg"
                    }
                    
                    if (string3 == "Borussia M'gladbach"){
                        
                        string3 = "Gladbach"
                    }
                    if (string3 == "Borussia M'gladbach"){
                        string3 = "Gladbach"
                    }
                    
                    if (string3 == "Bayer 04 Leverkusen"){
                        
                        string3 = "Leverkusen"
                    }
                    if (string3 == "Bayer 04 Leverkusen"){
                        string3 = "Leverkusen"
                    }
                    
                    if (string3 == "Borussia Dortmund"){
                        
                        string3 = "Dortmund"
                    }
                    if (string3 == "Borussia Dortmund"){
                        string3 = "Dortmund"
                    }
                    if (string3 == "1. FC Köln"){
                        string3 = "Koln"
                    }
                    if (string3 == "1. FC Köln"){
                        string3 = "Koln"
                    }
                    if( String(describing: string3) == self.teamonename){
                        let score1 = String(describing: var2["score1"])
                        let score2 = String(describing: var2["score2"])
                        let score3 = String(describing: var2["score3"])
                        let score4 = String(describing: var2["score4"])
                        let score5 = String(describing: var2["score5"])
                        self.form1team1.text = score1
                        self.form2team1.text = score2
                        self.form3team1.text = score3
                        self.form4team1.text = score4
                        self.form5team1.text = score5
                        
                        if (self.form1team1.text == "draw"){
                            self.form1team1.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form1team1.text == "win"){
                            self.form1team1.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form1team1.text == "lost"){
                            self.form1team1.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        
                        if (self.form2team1.text == "draw"){
                            self.form2team1.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form2team1.text == "win"){
                            self.form2team1.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form2team1.text == "lost"){
                            self.form2team1.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        if (self.form3team1.text == "draw"){
                            self.form3team1.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form3team1.text == "win"){
                            self.form3team1.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form3team1.text == "lost"){
                            self.form3team1.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        if (self.form4team1.text == "draw"){
                            self.form4team1.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form4team1.text == "win"){
                            self.form4team1.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form4team1.text == "lost"){
                            self.form4team1.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        
                        if (self.form5team1.text == "draw"){
                            self.form5team1.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form5team1.text == "win"){
                            self.form5team1.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form5team1.text == "lost"){
                            self.form5team1.backgroundColor = UIColor.red
                            
                            
                            
                        }
                       
                    }
                        
                    else if( String(describing: string3) == self.teamtwoname){
                        let score1 = String(describing: var2["score1"])
                        let score2 = String(describing: var2["score2"])
                        let score3 = String(describing: var2["score3"])
                        let score4 = String(describing: var2["score4"])
                        let score5 = String(describing: var2["score5"])
                        self.fom1team2.text = score1
                        self.form2team2.text = score2
                        self.form3team2.text = score3
                        self.form4team2.text = score4
                        self.form5team2.text = score5
                    
                        if ( self.fom1team2.text == "win" ){
                            self.fom1team2.backgroundColor = UIColor.green
                           
                            
                            
                        }
                        if ( self.fom1team2.text == "draw" ){
                            self.fom1team2.backgroundColor = UIColor.yellow
                            
                            
                            
                        }
                        if ( self.fom1team2.text == "lost" ){
                            self.fom1team2.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        if (self.form2team2.text == "draw"){
                            self.form2team2.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form2team2.text == "win"){
                            self.form2team2.backgroundColor = UIColor.green
                            
                            
                            
                        }
                         if (self.form2team2.text == "lost"){
                            self.form2team2.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        if (self.form3team2.text == "draw"){
                            self.form3team2.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form3team2.text == "win"){
                            self.form3team2.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form3team2.text == "lost"){
                            self.form3team2.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        if (self.form4team2.text == "draw"){
                            self.form4team2.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form4team2.text == "win"){
                            self.form4team2.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form4team2.text == "lost"){
                            self.form4team2.backgroundColor = UIColor.red
                            
                            
                            
                        }
                        if (self.form5team2.text == "draw"){
                            self.form5team2.backgroundColor = UIColor.yellow
                            
                            
                        }
                        
                        if (self.form5team2.text == "win"){
                            self.form5team2.backgroundColor = UIColor.green
                            
                            
                            
                        }
                        if (self.form5team2.text == "lost"){
                            self.form5team2.backgroundColor = UIColor.red
                            
                            
                            
                        }
                       
                }
                
            }
        }
        // Do any additional setup after loading the view.
    }

     func didReceiveMemoryWarning() {
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
}
