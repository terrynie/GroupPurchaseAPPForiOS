//
//  ProductViewController.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/22.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var navItem : UINavigationItem!
    @IBOutlet weak var productTableView:UITableView!
    var cityName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navItem.title =  "\(self.cityName)产品"
//        可以通过下面方法对titleview进行改写，将部分改成一个view，从而做出更好的效果
//        self.navItem.titleView
        //因为本类是UIViewController，不能实现dalegate和datasource接口，所以通过这种方式进行实现
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        //初始化时设置tableview的高度
        self.productTableView.rowHeight = 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var _productArray:NSMutableArray!
    var productArray:NSMutableArray{
        get{
            if _productArray == nil{
                _productArray = NSMutableArray()
                var bundle = NSBundle.mainBundle()
                var path = bundle.pathForResource("product.plist", ofType: nil)!
                var tempArray = NSMutableArray(contentsOfFile: path)!
                for dict in tempArray {
                    var productInfo: ProductInfo = ProductInfo(dict: dict as! NSMutableDictionary)
                    
                    _productArray.addObject(productInfo)
                }
                
            }
            
            
            return self._productArray
        }
        
        set(_productArray){
            
        }
    }
    
    
    //每组有多少个cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.productArray.count
    }
    
    //
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var productID:String = "productID"
        
        //在缓冲区查找是否存在productID标识cell
        var cell:ProductCell? = tableView.dequeueReusableCellWithIdentifier(productID) as? ProductCell
        //如果cell存在，则不创建，不存在则创建
        if cell == nil {
            
            cell = NSBundle.mainBundle().loadNibNamed("ProductCell", owner: nil, options: nil).last as? ProductCell
            
            
//            以下注释掉内容为之前使用系统默认的cell时创建cell的方式
//            默认，cell中只能加入一个UIImageView，一个textLabel，和一个指示器
//            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: productID)
//            //可以比默认方式多增加一个subtitle
//            cell = ProductCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: productID)
//            //比默认方式多增加一个detailTextLabel
//            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: productID)
//            //比默认方式少一个UIImage，
//            cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: productID)
        }
        
        //填充数据
        var productInfo = self.productArray[indexPath.row] as! ProductInfo
        cell?.title.text = productInfo.title
        cell?.icon.image = UIImage(named: productInfo.icon)
        cell?.star.image = UIImage(named: productInfo.star)
        cell?.desc.text = productInfo.desc
        

//        cell?.textLabel?.text = productInfo.title
//        cell?.imageView?.image = UIImage(named: productInfo.icon)
//        cell?.detailTextLabel?.text = productInfo.desc
        return cell!
    }
}