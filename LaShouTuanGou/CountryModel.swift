//
//  CountryModel.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/21.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation

class CountryModel: NSObject {
    var id:String!
    var name:String!
    
    init(dict:NSMutableDictionary){
        super.init()
        self.countryWithDict(dict)
    }
    
    func countryWithDict(dict:NSMutableDictionary){
        self.id = dict["id"] as? String
        self.name = dict["name"] as? String
        
    }
    
}