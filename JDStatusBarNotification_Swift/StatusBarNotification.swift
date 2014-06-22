//
//  StatusBarNotification.swift
//  JDStatusBarNotificationExample
//
//  Created by Markus on 22.06.14.
//  Copyright (c) 2014 Markus. All rights reserved.
//

import Foundation
import UIKit

class StatusBarNotification {

    // Presentation
    class func showWithStatus(status:String) -> StatusBarView
    {
        return showWithStatus(status, dismissAfter:nil, styleName:nil)
    }
    
    class func showWithStatus(status:String, styleName:String?) -> StatusBarView
    {
        return showWithStatus(status, dismissAfter:nil, styleName:styleName)
    }
    
    class func showWithStatus(status:String, dismissAfter:NSTimeInterval?) -> StatusBarView
    {
        return showWithStatus(status, dismissAfter:dismissAfter, styleName:nil)
    }
    
    class func showWithStatus(status:String, dismissAfter:NSTimeInterval?, styleName:String?) -> StatusBarView
    {
        return StatusBarView(frame: CGRectMake(0, 0, 320, 40))
    }
    
    // Dismissal
    class func dismiss()
    {
        
    }
    
    class func dismissAnimated(animated:Bool)
    {
        
    }
    
    class func dismissAfter(delay:NSTimeInterval)
    {
        
    }
    
    // Styles
    class func setDefaultStyle(prepare: (style:StatusBarStyle) -> StatusBarStyle)
    {
        
    }
    
    class func addStyleNamed(identifier:String, prepare: (style:StatusBarStyle) -> StatusBarStyle)
    {
        
    }
    
    // progress & activity
    class func showProgress(progress:Float)
    {
        
    }
    
    class func showActivityIndicator(show:Bool, indicatorStyle:UIActivityIndicatorViewStyle)
    {
        
    }

    // State
    class func isVisible() -> Bool
    {
        return false
    }

}


