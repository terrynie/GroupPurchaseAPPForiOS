//
//  ScrollInfo.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/25.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation

class ScrollInfo: NSObject {
    var title: String!
    var img: String!
    var desc: String!
    
    init(dict: NSMutableDictionary) {
        super.init()
        self.ScrollInfoWithDict(dict)
    }
    
    
    func ScrollInfoWithDict(dict: NSMutableDictionary){
        self.title = dict["title"] as? String
        self.img = dict["img"] as? String
        self.desc = dict["desc"] as? String
    }
}
