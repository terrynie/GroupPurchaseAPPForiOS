//
//  ProductFooterView.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/23.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit

protocol  ProductFooterViewDelegate{
    func refreshData(productInfo:ProductInfo)
}


class ProductFooterView: UIView {
    
    @IBOutlet weak var loadingMore: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    
    var delegate :ProductFooterViewDelegate!
    
    @IBAction func loadMore(sender: AnyObject) {
        //隐藏按钮
        self.button.hidden = true
        //显示loading more
        self.loadingMore.hidden = false
        //显示loading的动画效果
        self.loading.startAnimating()
        
        
        //加载更多数据
        let dict: NSMutableDictionary = NSMutableDictionary()
        dict["type"] = "0"
        dict["title"] = "川军本色/龙人居酒楼"
        dict["star"] = "ShopStar50"
        dict["icon"] = "3714230523e78c839947694f3e97f0a5.png"
        dict["desc"] = "好吃多来澳。客官，小店欢迎光顾。"
        dict["priceSJ"] = "55"
        dict["priceYH"] = "45"
        dict["info"] = "好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳好吃多来澳"
        dict["tel"] = "01010086"
        
        
        //添加延时效果。。。。很变态，为什么非要有这玩意呢，，，
        let delayInSeconds: Int64 = Int64(NSEC_PER_SEC.hashValue * 2)
        let popTime:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW,delayInSeconds)
        dispatch_after(popTime, dispatch_get_main_queue()){
            () -> Void in
        
            let productInfo:ProductInfo = ProductInfo(dict: dict)
            self.delegate.refreshData(productInfo)
            
            
            //重新显示按钮，并隐藏动画
            self.button.hidden = false
            //显示loading more
            self.loadingMore.hidden = true
            //显示loading的动画效果
            self.loading.stopAnimating()
            
        }
        
        
    }
    
    
}