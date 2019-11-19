
//
//  headtoheadViewController.swift
//  planeti
//
//  Created by Admin on 4/7/18.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON
class headtoheadViewController: UIViewController {
    var teamonename = ""
    var teamtwoname = ""
    var seguename = ""
    
    @IBOutlet weak var team1: UILabel!
    
    @IBOutlet weak var team2: UILabel!
    
 
    
    @IBOutlet weak var score7: UILabel!
    @IBOutlet weak var date4: UILabel!
    @IBOutlet weak var score6: UILabel!
    @IBOutlet weak var score5: UILabel!
    @IBOutlet weak var score8: UILabel!
    
    @IBOutlet weak var date3: UILabel!
    @IBOutlet weak var score4: UILabel!
    
    
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var score3: UILabel!
    @IBOutlet weak var score2: UILabel!
    
    @IBOutlet weak var score1: UILabel!
    
    
    @IBOutlet weak var date1: UILabel!
    let url = "https://raw.githubusercontent.com/opendatajson/football.json/master/2015-16/en.1.json"
    let url1 = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/en.1.json"
    let urlbund = "https://raw.githubusercontent.com/opendatajson/football.json/master/2015-16/de.1.json"
    let urlbund1 = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/de.1.json"
    let urlliga = "https://raw.githubusercontent.com/opendatajson/football.json/master/2015-16/es.1.json"
    let urlliga1 = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/es.1.json"
    let urlcalcio = "https://raw.githubusercontent.com/opendatajson/football.json/master/2015-16/it.1.json"
    let urlcalcio1 = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/it.1.json"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.makeToast("Loading HeadToHead results last two years", duration: 5.0, position: .center)
        let background = UIImage(named: "vidic")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        print("h1")
        team1?.text = teamonename
        team2?.text = teamtwoname
       
        print("h2")
        
        if(seguename == "premierleague"  ){
             print("h3")
        
            Alamofire.request(url).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                            
                     
                            
                            
                            // let result = formatter.string(from: date2)
                            
                            
                            
                            
                                
                                    
                                    let team1 = var3["team1"]
                                    let team2 = var3["team2"]
                                    let name1 = team1["name"]
                                    let name2 = team2["name"]
                            var string3 = String(describing: name1)
                            var string4 = String(describing: name2)
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
                                    
                                  ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                                    
                                   // self.LeaderArray.append(match)
                                    //self.leader.reloadData()
                                   // print (match.team2)
                            
                            if ((self.teamonename == String(describing: string3)) && (self.teamtwoname == String(describing: string4)))
                            {
                                let datej = var3["date"]
                                self.score1.text = String(describing: scor1)
                                self.score2.text = String(describing: scor2)
                                self.date1.text = String(describing: datej)
                                
                                
                                
                            }
                            
                            else  if ((self.teamonename == String(describing: string4)) && (self.teamtwoname == String(describing: string3)))
                            {
                                let datef = var3["date"]
                                self.score6.text = String(describing: scor1)
                                self.score5.text = String(describing: scor2)
                                self.date3.text = String(describing: datef)
                                
                                
                                
                            }
                                
                            
                        }
                    }
                    
                }
            }
            
            Alamofire.request(url1).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                           
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                  
                            
                            
                            
                            
                            
                            
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                            var string3 = String(describing: name1)
                            var string4 = String(describing: name2)
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
                            if (string3 == "Crystal Palace"){
                                
                                string3 = "C.Palace"
                            }
                            if (string4 == "Crystal Palace"){
                                
                                string4 = "C.Palace"
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
                            if (string3 == "Brighton"){
                                string3 = "Brighton"
                            }
                            ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                            
                            // self.LeaderArray.append(match)
                            //self.leader.reloadData()
                            // print (match.team2)
                            
                            if ((self.teamonename == String(describing: string3)) && (self.teamtwoname == String(describing: string4)))
                            {
                                 let date = var3["date"]
                                self.score3.text = String(describing: scor1)
                                self.score4.text = String(describing: scor2)
                                self.date2.text = String(describing: date)
                                
                                
                                
                            }
                                
                            else  if ((self.teamonename == String(describing: string4)) && (self.teamtwoname == String(describing: string3)))
                            {
                                 let datex = var3["date"]
                                self.score8.text = String(describing: scor1)
                                self.score7.text = String(describing: scor2)
                                self.date4.text = String(describing: datex)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }

            
        }
        
        ///////liga
        if(seguename == "liga"  ){
            print("h3")
            
            Alamofire.request(urlliga).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                            
                            
                            
                            
                            // let result = formatter.string(from: date2)
                            
                            
                            
                            
                            
                            
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                            var string3 = String(describing: name1)
                            var string4 = String(describing: name2)
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
                            
                            ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                            
                            // self.LeaderArray.append(match)
                            //self.leader.reloadData()
                            // print (match.team2)
                            
                            if ((self.teamonename == String(describing: string3)) && (self.teamtwoname == String(describing: string4)))
                            {
                                let datej = var3["date"]
                                self.score1.text = String(describing: scor1)
                                self.score2.text = String(describing: scor2)
                                self.date1.text = String(describing: datej)
                                
                                
                                
                            }
                                
                            else  if ((self.teamonename == String(describing: string4)) && (self.teamtwoname == String(describing: string3)))
                            {
                                let datef = var3["date"]
                                self.score6.text = String(describing: scor1)
                                self.score5.text = String(describing: scor2)
                                self.date3.text = String(describing: datef)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }
            
            Alamofire.request(urlliga1).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                            
                            
                            
                            
                            
                            
                            
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                            var string3 = String(describing: name1)
                            var string4 = String(describing: name2)
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
                            
                            ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                            
                            // self.LeaderArray.append(match)
                            //self.leader.reloadData()
                            // print (match.team2)
                            
                            if ((self.teamonename == String(describing: string3)) && (self.teamtwoname == String(describing: string4)))
                            {
                                let date = var3["date"]
                                self.score3.text = String(describing: scor1)
                                self.score4.text = String(describing: scor2)
                                self.date2.text = String(describing: date)
                                
                                
                                
                            }
                                
                            else  if ((self.teamonename == String(describing: string4)) && (self.teamtwoname == String(describing: string3)))
                            {
                                let datex = var3["date"]
                                self.score8.text = String(describing: scor1)
                                self.score7.text = String(describing: scor2)
                                self.date4.text = String(describing: datex)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }
            
            
        }
        
        /////calcio
        if(seguename == "calcio"  ){
            print("h3")
            
            Alamofire.request(urlcalcio).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                            
                            
                            
                            
                            // let result = formatter.string(from: date2)
                            
                            
                            
                            
                            
                            
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                            
                            ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                            
                            // self.LeaderArray.append(match)
                            //self.leader.reloadData()
                            // print (match.team2)
                            
                            if ((self.teamonename == String(describing: name1)) && (self.teamtwoname == String(describing: name2)))
                            {
                                let datej = var3["date"]
                                self.score1.text = String(describing: scor1)
                                self.score2.text = String(describing: scor2)
                                self.date1.text = String(describing: datej)
                                
                                
                                
                            }
                                
                            else  if ((self.teamonename == String(describing: name2)) && (self.teamtwoname == String(describing: name1)))
                            {
                                let datef = var3["date"]
                                self.score6.text = String(describing: scor1)
                                self.score5.text = String(describing: scor2)
                                self.date3.text = String(describing: datef)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }
            
            Alamofire.request(urlcalcio1).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                            
                            
                            
                            
                            
                            
                            
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                            
                            
                            ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                            
                            // self.LeaderArray.append(match)
                            //self.leader.reloadData()
                            // print (match.team2)
                            
                            if ((self.teamonename == String(describing: name1)) && (self.teamtwoname == String(describing: name2)))
                            {
                                let date = var3["date"]
                                self.score3.text = String(describing: scor1)
                                self.score4.text = String(describing: scor2)
                                self.date2.text = String(describing: date)
                                
                                
                                
                            }
                                
                            else  if ((self.teamonename == String(describing: name2)) && (self.teamtwoname == String(describing: name1)))
                            {
                                let datex = var3["date"]
                                self.score8.text = String(describing: scor1)
                                self.score7.text = String(describing: scor2)
                                self.date4.text = String(describing: datex)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }
            
            
        }
        /////bundesliga
        
        if(seguename == "bundesliga"  ){
            print("h3")
            
            Alamofire.request(urlbund).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                            
                            
                            
                            
                            // let result = formatter.string(from: date2)
                            
                            
                            
                            
                            
                            
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                            var string1 = String(describing: name1)
                            var string2 = String(describing: name2)
                            if (string1 == "FC Bayern München"){
                                
                                string1 = "FC Bayern"
                            }
                            if (string2 == "FC Bayern München"){
                                string2 = "FC Bayern"
                            }
                            if (string1 == "Eintracht Frankfurt"){
                                
                                string1 = "Francfurt"
                            }
                            if (string2 == "Eintracht Frankfurt"){
                                string2 = "Francfurt"
                            }
                            
                            if (string1 == "1899 Hoffenheim"){
                                
                                string1 = "Hoffenheim"
                            }
                            if (string2 == "1899 Hoffenheim"){
                                string2 = "Hoffenheim"
                            }
                            
                            if (string1 == "Hamburger SV"){
                                
                                string1 = "Hamburg"
                            }
                            if (string2 == "Hamburger SV"){
                                string2 = "Hamburg"
                            }
                            
                            if (string1 == "1. FSV Mainz 05"){
                                
                                string1 = "Mainz"
                            }
                            if (string2 == "1. FSV Mainz 05"){
                                string2 = "Mainz"
                            }
                            
                            if (string1 == "Werder Bremen"){
                                
                                string1 = "Bremen"
                            }
                            if (string2 == "Werder Bremen"){
                                string2 = "Bremen"
                            }
                            
                            if (string1 == "VfL Wolfsburg"){
                                
                                string1 = "Wolfsburg"
                            }
                            if (string2 == "VfL Wolfsburg"){
                                string2 = "Wolfsburg"
                            }
                            
                            if (string1 == "Borussia M'gladbach"){
                                
                                string1 = "Gladbach"
                            }
                            if (string2 == "Borussia M'gladbach"){
                                string2 = "Gladbach"
                            }
                            
                            if (string1 == "Bayer 04 Leverkusen"){
                                
                                string1 = "Leverkusen"
                            }
                            if (string2 == "Bayer 04 Leverkusen"){
                                string2 = "Leverkusen"
                            }
                            
                            if (string1 == "Borussia Dortmund"){
                                
                                string1 = "Dortmund"
                            }
                            if (string2 == "Borussia Dortmund"){
                                string2 = "Dortmund"
                            }
                            if (string1 == "1. FC Köln"){
                                string1 = "Koln"
                            }
                            if (string2 == "1. FC Köln"){
                                string2 = "Koln"
                            }
                            
                            ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                            
                            // self.LeaderArray.append(match)
                            //self.leader.reloadData()
                            // print (match.team2)
                            
                            if ((self.teamonename == String(describing: string1)) && (self.teamtwoname == String(describing: string2)))
                            {
                                let datej = var3["date"]
                                self.score1.text = String(describing: scor1)
                                self.score2.text = String(describing: scor2)
                                self.date1.text = String(describing: datej)
                                
                                
                                
                            }
                                
                            else  if ((self.teamonename == String(describing: string2)) && (self.teamtwoname == String(describing: string1)))
                            {
                                let datef = var3["date"]
                                self.score6.text = String(describing: scor1)
                                self.score5.text = String(describing: scor2)
                                self.date3.text = String(describing: datef)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }
            
            Alamofire.request(urlbund1).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            
                            let scor1 = var3["score1"]
                            let scor2 = var3["score2"]
                            
                            
                            
                            
                            
                            
                            
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                            var string1 = String(describing: name1)
                            var string2 = String(describing: name2)
                            if (string1 == "FC Bayern München"){
                                
                                string1 = "FC Bayern"
                            }
                            if (string2 == "FC Bayern München"){
                                string2 = "FC Bayern"
                            }
                            if (string1 == "Eintracht Frankfurt"){
                                
                                string1 = "Francfurt"
                            }
                            if (string2 == "Eintracht Frankfurt"){
                                string2 = "Francfurt"
                            }
                            
                            if (string1 == "1899 Hoffenheim"){
                                
                                string1 = "Hoffenheim"
                            }
                            if (string2 == "1899 Hoffenheim"){
                                string2 = "Hoffenheim"
                            }
                            
                            if (string1 == "Hamburger SV"){
                                
                                string1 = "Hamburg"
                            }
                            if (string2 == "Hamburger SV"){
                                string2 = "Hamburg"
                            }
                            
                            if (string1 == "1. FSV Mainz 05"){
                                
                                string1 = "Mainz"
                            }
                            if (string2 == "1. FSV Mainz 05"){
                                string2 = "Mainz"
                            }
                            
                            if (string1 == "Werder Bremen"){
                                
                                string1 = "Bremen"
                            }
                            if (string2 == "Werder Bremen"){
                                string2 = "Bremen"
                            }
                            
                            if (string1 == "VfL Wolfsburg"){
                                
                                string1 = "Wolfsburg"
                            }
                            if (string2 == "VfL Wolfsburg"){
                                string2 = "Wolfsburg"
                            }
                            
                            if (string1 == "Borussia M'gladbach"){
                                
                                string1 = "Gladbach"
                            }
                            if (string2 == "Borussia M'gladbach"){
                                string2 = "Gladbach"
                            }
                            
                            if (string1 == "Bayer 04 Leverkusen"){
                                
                                string1 = "Leverkusen"
                            }
                            if (string2 == "Bayer 04 Leverkusen"){
                                string2 = "Leverkusen"
                            }
                            
                            if (string1 == "Borussia Dortmund"){
                                
                                string1 = "Dortmund"
                            }
                            if (string2 == "Borussia Dortmund"){
                                string2 = "Dortmund"
                            }
                            if (string1 == "1. FC Köln"){
                                string1 = "Koln"
                            }
                            if (string2 == "1. FC Köln"){
                                string2 = "Koln"
                            }
                            
                            ///  let match = Match(t1: String(describing: name1) ,t2: String(describing: name2) ,img1: String(describing: name1),img2: String(describing: name2))
                            
                            // self.LeaderArray.append(match)
                            //self.leader.reloadData()
                            // print (match.team2)
                            
                            if ((self.teamonename == String(describing: string1)) && (self.teamtwoname == String(describing: string2)))
                            {
                                let date = var3["date"]
                                self.score3.text = String(describing: scor1)
                                self.score4.text = String(describing: scor2)
                                self.date2.text = String(describing: date)
                                
                                
                                
                            }
                                
                            else  if ((self.teamonename == String(describing: string2)) && (self.teamtwoname == String(describing: string1)))
                            {
                                let datex = var3["date"]
                                self.score8.text = String(describing: scor1)
                                self.score7.text = String(describing: scor2)
                                self.date4.text = String(describing: datex)
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }
            
            
        }
        
        }
        // Do any additional setup after loading the view.
    

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
