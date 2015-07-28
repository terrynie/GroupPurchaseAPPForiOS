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
    
    var currentPage: Int = 0
    
    var timer:NSTimer = NSTimer()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator  = false
        scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.addTimer()
        
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
        //设置滚动范围
        scrollView.contentSize = CGSize(width: imgViewW * CGFloat(self.scrollInfoArray.count), height: imgViewH)
        
        //pageControl有多少页
        self.pageControl.numberOfPages = self.scrollInfoArray.count
        
    }
    
    
    //add Timer
    func addTimer(){
        var ti:NSTimeInterval = 2.0
        NSTimer.scheduledTimerWithTimeInterval(ti, target: self, selector: "timerChange", userInfo: nil, repeats: true)
        
    }
    
    
    //改变滚动图片
    func timerChange(){
        
        //pageViewControl 改变页码
        
        if currentPage >= self.pageControl.numberOfPages {
            currentPage = 0
        }
        
        self.pageControl.currentPage = currentPage
        currentPage++
        
        //
        if self.scrollView != nil {
            if currentPage >= self.scrollInfoArray.count {
                currentPage = 0
            }
            
            var x: CGFloat = CGFloat(currentPage) * self.scrollView.frame.width
            
            var contentOffset:CGPoint = CGPoint(x: x, y: 0)
            
            self.scrollView.setContentOffset(contentOffset, animated: true)
            
            
        }
        
        
        
    }
    
    
    //remove timer
    func removeTimer(){
        //remove timer
        self.timer.invalidate()
//        self.timer = nil
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
        self.currentPage = Int(currentPage)
    }
    
    
    //开始拖拽时执行
    func scrollViewWillBeginDragging(scrollView: UIScrollView){
        
        self.removeTimer()
    }
    
    
    //拖拽结束后执行
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool){
        
//        self.addTimer()
    }
    
    
}

