//
//  ProductCell.swift
//  LaShouTuanGou
//
//  Created by terry on 15/7/23.
//  Copyright (c) 2015年 terry. All rights reserved.
//

import Foundation
import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var star: UIImageView!
    
    @IBOutlet weak var desc: UILabel!
    
    class func cellWithTableView(tableView:UITableView)->ProductCell{
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
        return cell!
    }
    
    
    var _productInfo:ProductInfo!
    var productInfo:ProductInfo {
        set(_productInfo) {
            //填充数据
            self.title.text = _productInfo.title
            self.icon.image = UIImage(named: _productInfo.icon)
            self.star.image = UIImage(named: _productInfo.star)
            self.desc.text = _productInfo.desc
            
            //        cell?.textLabel?.text = productInfo.title
            //        cell?.imageView?.image = UIImage(named: productInfo.icon)
            //        cell?.detailTextLabel?.text = productInfo.desc
        }
        get {
            return self._productInfo
        }

    }
    
}