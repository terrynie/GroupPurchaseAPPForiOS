//
//  ProductHeaderView.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/25.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit

class ProductHeaderView: UIView, UIScrollViewDelegate {
        
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator  = false
        scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        
//        scrollView.contentSize = CGSize(width: 3*320, height: 128)
        var imgViewY: CGFloat = 0
        var imgViewW: CGFloat = self.scrollView.frame.width
        var imgViewH: CGFloat = self.scrollView.frame.height
        
        for (var i:Int = 0; i < self.scrollInfoArray.count; i++){
            var scrollInfo:ScrollInfo = self.scrollInfoArray[i] as! ScrollInfo
            var img = UIImage(named: scrollInfo.img)!
            var imageView = UIImageView(image: img)
            var imgViewX: CGFloat = imgViewW * CGFloat(i)
        
            imageView.frame = CGRectMake(imgViewX, imgViewY, imgViewW, imgViewH)
            self.scrollView.addSubview(imageView)
            
        }
        scrollView.contentSize = CGSize(width: imgViewW * CGFloat(self.scrollInfoArray.count), height: imgViewH)
        
        //pageControl有多少页
        self.pageControl.numberOfPages = self.scrollInfoArray.count
        
    }
    
    
    class var productHeaderView:ProductHeaderView{
        get{
            return NSBundle.mainBundle().loadNibNamed("ProductHeaderView", owner: nil, options: nil).last as! ProductHeaderView
        }
    }
    
    var _scrollInfoArray: NSMutableArray!
    var scrollInfoArray: NSMutableArray{
        
        get{
            if (_scrollInfoArray == nil){
                _scrollInfoArray = NSMutableArray()
                var bundle = NSBundle.mainBundle().pathForResource("moviepics.plist", ofType: nil)!
                
                var dictArray = NSMutableArray(contentsOfFile: bundle)!
                
                for dict in dictArray {
                    var tempScrollInfo = ScrollInfo(dict: dict as! NSMutableDictionary)
                    _scrollInfoArray.addObject(tempScrollInfo)
                }
            }
            return _scrollInfoArray
        }
    
    }
    
    
    //滚动时一直执行此方法
    func scrollViewDidScroll(scrollView: UIScrollView){
        
        var currentPage = (self.scrollView.contentOffset.x + self.scrollView.frame.width * 0.5) / self.scrollView.frame.width
        self.pageControl.currentPage = Int(currentPage)
    }
    
    
    //开始拖拽时执行
    func scrollViewWillBeginDragging(scrollView: UIScrollView){
        
        
        
    }
    
    
    //拖拽结束后执行
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool){
        
    }
    
    
}

