import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class MatchesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    
    @IBOutlet weak var leader: UITableView!
    
    var seguename = ""
    var localIp = ""
var teamonename = ""
    var teamtwoname = ""
    var LeaderArray = [Match]()
    override var prefersStatusBarHidden: Bool {
        return true
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.leader.backgroundColor = UIColor(red:0.20, green:0.89, blue:1.00, alpha:1.0)
        self.view.makeToast("Loading Fixtures", duration: 5.0, position: .center)
        let background = UIImage(named: "vidic")
        
       var imageView : UIImageView!
       imageView = UIImageView(frame: view.bounds)
    imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        //self.navigationController?.navigationBar.isHidden=false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //self.leader.rowHeight = 165.5
        if seguename == "premierleague" {
            localIp="https://raw.githubusercontent.com/opendatajson/football.json/master/2017-18/en.1.json"
        Alamofire.request(localIp).responseJSON { response in
            if let json1 = response.result.value {
                let formattedJson1 = JSON(json1)
         
              
                
               
                let var1 = formattedJson1["rounds"].arrayValue
                var i = 0
                for var2 in  var1 {
                    
                    let matches = var2["matches"].arrayValue
                    for var3 in  matches {
                        let date = var3["date"]
                        
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        
                        let datematch = dateFormatter.date(from: String(describing: date))!
                        let date2 = Date()
                        let formatter = DateFormatter()
                 
                        //let cstdate = Date("24-5-2018")
                        formatter.dateFormat = "yyyy-MM-dd"
                       
                        
                        var dateAsString = "2018-03-20"
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        var newDate = dateFormatter.date(from: dateAsString)
                        
                       // let result = formatter.string(from: date2)
                       // print(datematch.compare(date2).rawValue)
                        let calendar = NSCalendar.current
                        
                        // Replace the hour (time) of both dates with 00:00
                        let dt1 = calendar.startOfDay(for: newDate!)
                        let dt2 = calendar.startOfDay(for: datematch)
                        
                        let components = calendar.dateComponents([.day], from: dt1, to: dt2)
                        let team1 = var3["team1"]
                        let team2 = var3["team2"]
                        let name1 = team1["name"]
                        let name2 = team2["name"]
                        print(name1)
                        print(name2)
                        print(components.day)
                        print("--------------")
                        
                        if((datematch > newDate! ) || (components.day == 0))
                        {
                            i+=1
                            if (i < 11){
                                print (i)
                            let team1 = var3["team1"]
                            let team2 = var3["team2"]
                            let name1 = team1["name"]
                            let name2 = team2["name"]
                                var string3 = String(describing: name1)
                                var string4 = String(describing: name2)
                                var string5 = String(describing: date)
                                if (string3 == "Leicester City"){
                                    
                                    string3 = "Leicester"
                                }
                                if (string4 == "Leicester City"){
                                    
                                    string4 = "Leicester"
                                }
                                if (string3 == "Crystal Palace"){
                                    
                                    string3 = "C.Palace"
                                }
                                if (string4 == "Crystal Palace"){
                                    
                                    string4 = "C.Palace"
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
                                
                                let match = Match(t1: string3,t2: string4,date: string5 ,img1: string3,img2: string4)
                            
                            self.LeaderArray.append(match)
                            self.leader.reloadData()
                            print (match.team2)
                            }
                       
                        }
                    }
                }
                
            }
        }

        }
        
        if seguename == "liga" {
            localIp="https://raw.githubusercontent.com/opendatajson/football.json/master/2017-18/es.1.json"
            Alamofire.request(localIp).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    var i = 0
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            let date = var3["date"]
                            
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            
                            let datematch = dateFormatter.date(from: String(describing: date))!
                            let date2 = Date()
                            let formatter = DateFormatter()
                            
                            
                            formatter.dateFormat = "yyyy-MM-dd"
                            var dateAsString = "2018-03-20"
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            var newDate = dateFormatter.date(from: dateAsString)
                            
                            // let result = formatter.string(from: date2)
                            
                            if(datematch > newDate!)
                            {
                                i+=1
                                if (i < 11){
                                    print (i)
                                    let team1 = var3["team1"]
                                    let team2 = var3["team2"]
                                    let name1 = team1["name"]
                                    let name2 = team2["name"]
                                    
                                    var string3 = String(describing: name1)
                                    var string4 = String(describing: name2)
                                    var string5 = String(describing: date)
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
                                    
                                    let match = Match(t1: string3,t2: string4,date: string5 ,img1: string3,img2: string4)
                                    
                                    self.LeaderArray.append(match)
                                    self.leader.reloadData()
                                    print (match.team2)
                                }
                                
                            }
                        }
                    }
                    
                }
            }
            
        }
        
        if seguename == "calcio" {
            localIp="https://raw.githubusercontent.com/opendatajson/football.json/master/2017-18/it.1.json"
            Alamofire.request(localIp).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    var i = 0
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            let date = var3["date"]
                            
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            
                            let datematch = dateFormatter.date(from: String(describing: date))!
                            let date2 = Date()
                            let formatter = DateFormatter()
                            
                            
                            formatter.dateFormat = "yyyy-MM-dd"
                            
                            var dateAsString = "2018-03-20"
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            var newDate = dateFormatter.date(from: dateAsString)
                            // let result = formatter.string(from: date2)
                            
                            if(datematch > newDate!)
                            {
                                i+=1
                                if (i < 11){
                                    print (i)
                                    let team1 = var3["team1"]
                                    let team2 = var3["team2"]
                                    let name1 = team1["name"]
                                    let name2 = team2["name"]
                                    var string3 = String(describing: name1)
                                    var string4 = String(describing: name2)
                                    var string5 = String(describing: date)
                                    if (string3 == "FC Bayern München"){
                                        
                                        string3 = "FC Bayern Munchen"
                                    }
                                    if (string4 == "FC Bayern München"){
                                        string4 = "FC Bayern Munchen"
                                    }
                                    if (string3 == "1. FC Köln"){
                                        string3 = "1. FC Koln"
                                    }
                                    if (string4 == "1. FC Köln"){
                                        string4 = "1. FC Koln"
                                    }
                                    
                                    let match = Match(t1: string3,t2: string4,date: string5 ,img1: string3,img2: string4)
                                    self.LeaderArray.append(match)
                                    self.leader.reloadData()
                                    print (match.team2)
                                }
                                
                            }
                        }
                    }
                    
                }
            }
            
        }
        if seguename == "bundesliga" {
            localIp="https://raw.githubusercontent.com/opendatajson/football.json/master/2017-18/de.1.json"
            Alamofire.request(localIp).responseJSON { response in
                if let json1 = response.result.value {
                    let formattedJson1 = JSON(json1)
                    
                    
                    
                    
                    let var1 = formattedJson1["rounds"].arrayValue
                    var i = 0
                    for var2 in  var1 {
                        
                        let matches = var2["matches"].arrayValue
                        for var3 in  matches {
                            let date = var3["date"]
                            
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            
                            let datematch = dateFormatter.date(from: String(describing: date))!
                            let date2 = Date()
                            let formatter = DateFormatter()
                            
                            
                            formatter.dateFormat = "yyyy-MM-dd"
                            
                            var dateAsString = "2018-03-20"
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            var newDate = dateFormatter.date(from: dateAsString)
                            // let result = formatter.string(from: date2)
                            
                            if(datematch > newDate!)
                            {
                                i+=1
                                if (i < 11){
                                    print (i)
                                    let team1 = var3["team1"]
                                    let team2 = var3["team2"]
                                    let name1 = team1["name"]
                                    let name2 = team2["name"]
                                    var string1 = String(describing: name1)
                                    var string2 = String(describing: name2)
                                    var string5 = String(describing: date)
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
                                    
                                    let match = Match(t1: string1,t2: string2,date: string5 ,img1: string1,img2: string2)
                                    
                                    self.LeaderArray.append(match)
                                    self.leader.reloadData()
                                    print (match.team2)
                                }
                                
                            }
                        }
                    }
                    
                }
            }
            
        }
    }
 
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return LeaderArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let team1 = cell?.viewWithTag(3) as? UILabel
        let team2 = cell?.viewWithTag(4) as? UILabel
        // let date = cell?.viewWithTag(7) as? UILabel
           // let team1img = cell?.viewWithTag(1) as? UIImageView
           // let team2img = cell?.viewWithTag(2) as? UIImageView
        
        let tm1 = (LeaderArray[indexPath.row]) as! Match
        let tm1x = tm1.team1
        let datetm1 = (LeaderArray[indexPath.row]) as! Match
        let datetm1x = datetm1.date
        let newString1 = tm1x.replacingOccurrences(of: "ü", with: "u", options: .literal, range: nil)
        let tm2 = (LeaderArray[indexPath.row]) as! Match
        let tm2x = tm2.team2
        let newString2 = tm2x.replacingOccurrences(of: "ü", with: "u", options: .literal, range: nil)
        let tmimg1 = (LeaderArray[indexPath.row]) as! Match
        var tm2ximg1 = tmimg1.imageteam1
        let tmimg2 = (LeaderArray[indexPath.row]) as! Match
        var tm2ximg2 = tmimg2.imageteam2
        team1?.text =  newString1
        team2?.text = newString2
       // date?.text = datetm1x
       // team1img?.image =  UIImage(named:tm2ximg1)
       // team2img?.image =  UIImage(named:tm2ximg2)
        
       
    //self.leader.reloadData()
        cell?.backgroundColor = UIColor(red:0.20, green:0.89, blue:1.00, alpha:1.0)
        return cell!
    }
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //selectedMovie = (LeaderArray[indexPath.row] as! Dictionary<String,Any>)["name"] as! String
        
        self.teamonename = LeaderArray[indexPath.row].team1
        self.teamtwoname = LeaderArray[indexPath.row].team2
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "detail")
        if let destinationVC = newViewController as? DetailsViewController {
            destinationVC.team1n = self.teamonename
            destinationVC.team2n = self.teamtwoname
            destinationVC.seguename = self.seguename
        }
        self.show(newViewController, sender: nil)
        //    performSegue(withIdentifier: "todetails", sender: nil)
            return
        }

    

//       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "todetails"{
//                if let destinationVC = segue.destination as? DetailsViewController {
//                    destinationVC.team1n = self.teamonename
//                    destinationVC.team2n = self.teamtwoname
//                    destinationVC.seguename = self.seguename
//                }
//            }
//        }
    
    
    
   
}


