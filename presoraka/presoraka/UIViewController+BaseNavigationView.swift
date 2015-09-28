//
//  UIViewController+BaseNavigationView.swift
//  presoraka
//
//  Created by maqj on 15/8/18.
//  Copyright (c) 2015年 msxt. All rights reserved.
//

import UIKit

protocol BaseNavigationViewDelegate{
     func initNavigationView()->Void
}

extension UIViewController: BaseNavigationViewDelegate{
    
      public func initNavigationView() {
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor();
        
        var barFrame = self.navigationController?.navigationBar.frame
        
        barFrame?.size.width = UIScreen.mainScreen().bounds.size.width/3.0
        
        let topView: UIView = UIView(frame: barFrame!)
        
        let topLogo: UIImageView = UIImageView(image: UIImage(named: "top_logo.png"))
        var imageFrame = topLogo.frame
        imageFrame.size.width = 35.0
        imageFrame.size.height = 35.0
        topLogo.frame = imageFrame
        
        topView.addSubview(topLogo)
        
        let topTitle: UILabel = UILabel()
        topTitle.text = "民生信托"
        topTitle.font = UIFont.systemFontOfSize(21.0)
        topTitle.textColor = UIColor.whiteColor()
        topTitle.frame = CGRectMake(imageFrame.origin.x + 37.0, imageFrame.origin.y, 100.0, imageFrame.size.height)
        
        topView.addSubview(topTitle)
        
        self.navigationItem.titleView = topView
    }
}