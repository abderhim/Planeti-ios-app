//
//  Match.swift
//  planeti
//
//  Created by ESPRIT on 03/04/2018.
//  Copyright © 2018 esprit. All rights reserved.
//

import UIKit

class Match : NSObject {
    
    var team1:String
    var team2:String
    var date:String
    var imageteam1:String
    var imageteam2:String
    
    init(t1: String,t2: String,date: String ,img1: String,img2: String) {
        
        self.team1 = t1
        self.team2 = t2
         self.date = date
        self.imageteam1 = img1
        self.imageteam2 = img2
        
        
    }
    
}
