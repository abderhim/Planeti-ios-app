//
//  favorisViewController.swift
//  planeti
//
//  Created by Sim1718 on 4/14/18.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit
import CoreData


class favorisViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
   
    
    @IBOutlet weak var tableview: UITableView!
    
    
   var moviesArray:[NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.backgroundColor = UIColor(red:0.20, green:0.89, blue:1.00, alpha:1.0)
       // TableViewAnimation.Cell.left(duration: 0.5)
        let background = UIImage(named: "vidic")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
       // let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tammir")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Tammir")
        
        do {
           // let userid = UserDefaults.standard.string(forKey: "iduserr") ?? "-";            print("oooo:"+String(describing: userid))
          //  let predicate = NSPredicate(format: "userid  == %@", String(describing: userid))
           // let predicate = NSPredicate(format: "team1  == %@", "WestHam")
          //  request.predicate = predicate
           
            
    
            
            try moviesArray = managedContext.fetch(request) as! [NSManagedObject]
           
           tableview.reloadData()
            
        } catch let error as NSError {
            print("error fetching data \(error), \(error.userInfo)")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let team1 = cell?.viewWithTag(1) as? UILabel
        let team2 = cell?.viewWithTag(2) as? UILabel
        let taamira = cell?.viewWithTag(3) as? UILabel

        
        team1?.text = (moviesArray[indexPath.row].value(forKey: "team1") as! String)
        team2?.text = (moviesArray[indexPath.row].value(forKey: "team2") as! String)
        taamira?.text = (moviesArray[indexPath.row].value(forKey: "taamira") as! String)
       
        cell?.backgroundColor = UIColor(red:0.20, green:0.89, blue:1.00, alpha:1.0)
        return cell!
        
    }
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedMovie = (LeaderArray[indexPath.row] as! Dictionary<String,Any>)["name"] as! String
        
        
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
    
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)  {
        switch editingStyle {
        case .delete:
            // remove the deleted item from the model
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let  persistentcontainer = appDel.persistentContainer
            let context = persistentcontainer.viewContext
            
            context.delete(moviesArray[indexPath.row] as NSManagedObject)
            moviesArray.remove(at: indexPath.row)
            do{  try context.save()}
            catch{}
            
            //tableView.reloadData()
            // remove the deleted item from the UITableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            return
            
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
