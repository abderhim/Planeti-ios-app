//
//  LoginViewController.swift
//  planeti
//
//  Created by Admin on 4/10/18.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift
class LoginViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var usernamefield: UITextField!
    
 
    @IBOutlet weak var passwordfield: UITextField!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernamefield{
            passwordfield.becomeFirstResponder()
        }else if textField == passwordfield{
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        let name1 =  UserDefaults.standard.integer(forKey: "iduserkl")
        
        if name1 != 0  {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "home")
            
            self.show(newViewController, sender: nil)
            
          //  loginaction((Any).self)
            
        }
        let background = UIImage(named: "pitchjdid")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
       
      self.navigationItem.setHidesBackButton(true, animated:true);
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
   

    @IBAction func loginaction(_ sender: Any) {
        
        //let urlTo = "http://172.19.3.58/indexx.php"
        let urlTo = "http://41.226.11.243:10080/planeti/indexx.php"
        
        
        
        
        usernamefield.delegate = self as? UITextFieldDelegate
        passwordfield.delegate = self as? UITextFieldDelegate
        
        print(usernamefield.text!)
        
        Alamofire.request(urlTo, method: .post , parameters: ["username": usernamefield.text!, "password": passwordfield.text!],encoding: URLEncoding.default , headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
               
              
                let formattedJson = JSON(response.result.value)
                print(formattedJson)
                let iduser = formattedJson["id"].string
                print(iduser)
                var yy = 0
                if (iduser != nil){
                    yy = Int(iduser!)!}
                
                let s = formattedJson["success"]
                print("wselt")
                
                print(s)
                let test = s.int
                print(test!)
                if test == 1{
                    UserDefaults.standard.set(yy, forKey: "iduserr")
                    UserDefaults.standard.set(self.usernamefield.text!, forKey: "username")
                   // print("mmm:"+String(describing: yy))
                    //self.performSegue(withIdentifier: "signInToHome", sender: HomeViewController.self)
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "home")
                   
                    self.show(newViewController, sender: nil)
                  //  self.view.makeToast("WELCOME", duration: 2.0, position: .bottom)

                    
                    return
                }else
                {
                    let alert = UIAlertController(title: "Wrong Username or Password", message: "", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    
                    self.present(alert, animated: true)
                    print("ghalet")
                    
                }
                
                
                break
            case .failure(let error):
                
                print(error)
            }
        }
        if let uName = usernamefield.text , let pass = usernamefield.text {
            if (uName.isEmpty || pass.isEmpty) {
                let alert = UIAlertController(title: "Verify the fields", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                
                self.present(alert, animated: true)
                print("Verify the fields")
                //SVProgressHUD.dismiss()
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
}
