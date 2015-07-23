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
        
//        自定义开关指示器
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
    
    //修改header
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //设置header的背景颜色
        var viewHeader = UIView()
        viewHeader.frame = CGRectMake(15, 0, self.view.frame.width, 50) //设置frame的位置，大小
        viewHeader.backgroundColor = UIColor.grayColor()
        //设置header字体颜色
        var label = UILabel()
        label.frame = viewHeader.frame
        //改变frame距离右端的距离
        label.frame.origin.x = 15
        label.text = (self.sectionArray[section] as! CityModel).name
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.boldSystemFontOfSize(18)
        
        viewHeader.addSubview(label)
        
        return viewHeader
    }
    
    //建立快速索引
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return self.sectionArray.valueForKey("name") as! [AnyObject]
    }
    
    //传递参数
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cityModel = self.sectionArray[indexPath.section] as? CityModel
        var countryModel:CountryModel = (cityModel?.countryArray[indexPath.row] as? CountryModel)!
        var cityName = countryModel.name
        
        //根据Segue的identifier执行操作 ， 跳转
        self.performSegueWithIdentifier("cityID", sender: cityName)
    }
    
    //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var cityName :String = sender as! String
        
        var productViewController:ProductViewController = segue.destinationViewController as! ProductViewController
        
        //传递城市名称
        productViewController.cityName = cityName
        
        
    }
    
}
