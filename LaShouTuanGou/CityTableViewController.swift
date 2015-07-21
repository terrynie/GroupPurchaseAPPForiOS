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
    var sectionArray:NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var cityArray1:NSMutableArray = NSMutableArray()
//        cityArray1.addObject("北京")
//        cityArray1.addObject("上海")
//        
//        var cityArray2:NSMutableArray = NSMutableArray()
//        cityArray2.addObject("安徽")
//        cityArray2.addObject("江苏")
//        cityArray2.addObject("河南")
//        
//        sectionArray.addObject(cityArray1)
//        sectionArray.addObject(cityArray2)
        
        
        var bundler:NSBundle = NSBundle.mainBundle()
        //通过查找，返回文件的路径
        var path:String = bundler.pathForResource("ChinaCity.plist", ofType: nil)!
        self.sectionArray = NSMutableArray(contentsOfFile: path)!
        
       
        
    }
    
    //显示多少组数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return sectionArray.count
    }
    
    //每组多少行
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        var cityMutableDictionary:NSMutableDictionary = self.sectionArray[section] as! NSMutableDictionary
        var countryMutableArray:NSMutableArray = cityMutableDictionary["list"] as! NSMutableArray
        //根据字典的长度确定每组的行数
        return countryMutableArray.count
        
    }
    
    //每行显示的数据
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cityID") as UITableViewCell
        var cityMutableDictionary:NSMutableDictionary = self.sectionArray[indexPath.section] as! NSMutableDictionary
        var countryMutableArray:NSMutableArray = cityMutableDictionary["list"] as! NSMutableArray
        var countryMutableDictionary:NSMutableDictionary = countryMutableArray[indexPath.row] as! NSMutableDictionary
        
        cell.textLabel?.text = countryMutableDictionary["name"] as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var cityMutableDictionary = self.sectionArray[section] as! NSMutableDictionary
        return cityMutableDictionary["name"] as! String
        
        
    }
    
    
}
