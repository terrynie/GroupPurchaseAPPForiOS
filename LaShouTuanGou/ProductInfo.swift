//
//  ProductInfo.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/23.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation

enum ProductInfoType:Int{
    case food
    case movie
    case wedding
}


class ProductInfo: NSObject {
    var type:ProductInfoType!//0,1,2...
    var title:String!
    var star:String!
    var icon:String!
    var desc:String!
    var priceSJ:String!
    var priceYH:String!
    var info:String!
    var tel:String!
    
    init(dict:NSMutableDictionary){
        super.init()
        self.productInfoWithDict(dict)
    }
    
    func productInfoWithDict (dict:NSMutableDictionary){
        self.title = dict["title"] as! String
        self.star = dict["star"] as! String
        self.icon = dict["icon"] as! String
        self.desc = dict["desc"] as! String
        self.priceSJ = dict["priceSJ"] as! String
        self.priceYH = dict["priceYH"] as! String
        self.info = dict["info"] as! String
        self.tel = dict["tel"] as! String
        
        
//        //这跟上边的强制解包效果应该一样吧，还不如强制解包好
        var type:String = dict["type"] as! String
        
//        if type == "0" {
//            self.type == ProductInfoType.food
//        }else if type == "1" {
//            self.type == ProductInfoType.movie
//        }else if type == "2" {
//            self.type == ProductInfoType.wedding
//        }
        
        

    }
    
    
}
