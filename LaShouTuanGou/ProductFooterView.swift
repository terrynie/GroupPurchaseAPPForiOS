//
//  ProductFooterView.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/23.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit
class ProductFooterView: UIView {
    
    @IBOutlet weak var loadingMore: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    
    @IBAction func loadMore(sender: AnyObject) {
        //隐藏按钮
        self.button.hidden = true
        //显示loading more
        self.loadingMore.hidden = false
        //显示loading的动画效果
        self.loading.startAnimating()
        
    }
    
    
}