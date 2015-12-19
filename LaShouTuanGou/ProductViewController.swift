//
//  ProductViewController.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/22.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ProductFooterViewDelegate {
    
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
//        这两种写法相同，nil默认为根目录
//        var nib:UINib = UINib(nibName: "ProductFooterView", bundle: nil)
        let nib:UINib = UINib(nibName: "ProductFooterView", bundle: NSBundle.mainBundle())
        //load the nib
        let footerView:ProductFooterView = nib.instantiateWithOwner(nil, options: nil).last as! ProductFooterView
        
        footerView.delegate = self
        self.productTableView.tableFooterView = footerView
        
        //load header view
        self.productTableView.tableHeaderView = ProductHeaderView.productHeaderView
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var _productArray:NSMutableArray!
    var productArray:NSMutableArray{
        get{
            if _productArray == nil{
                _productArray = NSMutableArray()
                let bundle = NSBundle.mainBundle()
                let path = bundle.pathForResource("product.plist", ofType: nil)!
                let tempArray = NSMutableArray(contentsOfFile: path)!
                for dict in tempArray {
                    let productInfo: ProductInfo = ProductInfo(dict: dict as! NSMutableDictionary)
                    
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
        
        let cell:ProductCell = ProductCell.cellWithTableView(tableView)
        
        cell.productInfo = self.productArray[indexPath.row] as! ProductInfo

        return cell
    }
    
    
    func refreshData(productInfo:ProductInfo){
        self.productArray.addObject(productInfo)
        //refresh
        self.productTableView.reloadData()

    }
    
    
    //选择某一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let productInfo: ProductInfo = self.productArray[indexPath.row] as! ProductInfo
        
        
        if productInfo.type == ProductInfoType.food {
            self.performSegueWithIdentifier("FoodID", sender: productInfo)
        }else if productInfo.type == ProductInfoType.movie {
            self.performSegueWithIdentifier("MovieID", sender: productInfo)
        }else if productInfo.type == ProductInfoType.wedding {
            self.performSegueWithIdentifier("WeddingID", sender: productInfo)
        }
        
                
        
        
        
    }
    
    
    
}