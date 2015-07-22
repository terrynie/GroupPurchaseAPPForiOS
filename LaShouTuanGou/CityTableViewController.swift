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
    
    var _sectionArray:NSMutableArray!
    var sectionArray:NSMutableArray{
        get{
            
            if self._sectionArray == nil {
                _sectionArray = NSMutableArray()
                var bundler:NSBundle = NSBundle.mainBundle()
                //通过查找，返回文件的路径
                var path:String = bundler.pathForResource("ChinaCity.plist", ofType: nil)!
                var tempArray = NSMutableArray(contentsOfFile: path)!
                
                //数组里边放的字典，
                
                for dict in tempArray {
                    var cityModel:CityModel = CityModel(dict: dict as! NSMutableDictionary)
                    _sectionArray.addObject(cityModel)
                }
            }
            
            return self._sectionArray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
    }
    
    //显示多少组数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return sectionArray.count
    }
    
    //每组多少行
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        var cityModel = self.sectionArray[section] as! CityModel
        var countryModel:NSMutableArray = cityModel.countryArray as NSMutableArray
        //根据字典的长度确定每组的行数
        return countryModel.count
        
    }
    
    //每行显示的数据
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //第一步，在缓冲中查找ID标示的cell
        let cityID:String = "cityID"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cityID) as? UITableViewCell
        
        //判断cell是否存在，如果不存在进行创建
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cityID") as UITableViewCell
        }
        
        //第三部，填充数据
 
        
        var cityModel:CityModel = self.sectionArray[indexPath.section] as! CityModel
        var countryModelArray:NSMutableArray = cityModel.countryArray as NSMutableArray
        var countryModel:CountryModel = countryModelArray[indexPath.row] as! CountryModel
        
        cell!.textLabel?.text = countryModel.name as String
        
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator     //箭头的指示器
//        cell.accessoryType = UITableViewCellAccessoryType.Checkmark               //对勾指示器
//        cell.accessoryType = UITableViewCellAccessoryType.DetailButton            //详细信息指示器
//        cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton  //详细信息加箭头指示器
//        cell.accessoryType = UITableViewCellAccessoryType.None                    //默认
        
        //自定义开关指示器
//        var view = UISwitch() //此处的UISwitch可以更换为任何UIView类
//        cell.accessoryView = view
        
        return cell!
    }
    
    //组头的内容
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var cityModel = self.sectionArray[section] as! CityModel
        return cityModel.name
    
    }
    
    
    //组头的高度
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //行的高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
}
