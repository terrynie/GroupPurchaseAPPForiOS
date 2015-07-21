//
//  CityTableViewController.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/21.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit

class CityTableViewController:UITableViewController,UITableViewDataSource,UITableViewDelegate {
    var sectionArray:NSMutableArray = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cityArray1:NSMutableArray = NSMutableArray()
        cityArray1.addObject("北京")
        cityArray1.addObject("上海")
        
        var cityArray2:NSMutableArray = NSMutableArray()
        cityArray2.addObject("安徽")
        cityArray2.addObject("江苏")
        cityArray2.addObject("河南")
        
        sectionArray.addObject(cityArray1)
        sectionArray.addObject(cityArray2)
        
    }
    
    //显示多少组数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        
        return sectionArray.count
    }
    
    //每组多少行
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var rowCount:Int
        rowCount = self.sectionArray[section].count
        return rowCount
        
    }
    
    //每行显示的数据
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cityID") as UITableViewCell
//        //视频教程写法如下
//        var sectionArray:NSMutableArray = self.sectionArray[indexPath.section] as! NSMutableArray;
//        var cityArrayName :NSString = sectionArray[indexPath.row] as! String
//        cell.textLabel?.text = cityArrayName as String
        
        cell.textLabel?.text = self.sectionArray[indexPath.section][indexPath.row] as? String
        
        return cell
        
        
    }
    
    
}
