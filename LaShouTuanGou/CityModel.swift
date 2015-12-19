//
//  CityModel.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/21.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation

class CityModel: NSObject {
    var id:String!
    var name:String!
    var countryArray:NSMutableArray!
    
    init(dict:NSMutableDictionary) {
        super.init()
        self.cityWithDict(dict)
    }
    
    func cityWithDict(dict:NSMutableDictionary){
        self.id = dict["id"] as? String
        self.name = dict["name"] as? String
//        countryArray = dict["list"] as? NSMutableArray
        
        let tempArray:NSMutableArray = dict["list"] as! NSMutableArray
        
        countryArray = NSMutableArray()
        for dictSon in tempArray {
            let countryModel:CountryModel = CountryModel(dict: dictSon as! NSMutableDictionary)
            countryArray.addObject(countryModel)
        }
        
        
        
    }
    
    
    
}