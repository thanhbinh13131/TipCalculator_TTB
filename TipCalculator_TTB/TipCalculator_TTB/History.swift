//
//  History.swift
//  TipCalculator_TTB
//
//  Created by TTB on 5/30/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import Foundation
class History: NSObject, NSCoding{
    var tip: String
    var total: String
    var date: String
   
    
    init(tip: String, total: String, date:String){
        self.tip = tip
        self.total = total
        self.date = date
    }
    required convenience init(coder aDecoder: NSCoder) {
        let tip = aDecoder.decodeObject(forKey: "tip") as! String
        let total = aDecoder.decodeObject(forKey: "total") as! String
        let date = aDecoder.decodeObject(forKey: "date") as! String
        self.init(tip: tip, total: total, date: date)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(tip, forKey: "tip")
        aCoder.encode(tip, forKey: "total")
        aCoder.encode(tip, forKey: "date")
    }
}
