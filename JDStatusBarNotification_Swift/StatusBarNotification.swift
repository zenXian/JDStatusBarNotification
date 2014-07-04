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
    
    var dismissTimer:NSTimer?
    var progress:CGFloat = 0
    
    var activeStyle:StatusBarStyle
    var defaultStyle:StatusBarStyle
    var userStyles:Dictionary<String,StatusBarStyle>
    
    // singleton
    class func sharedInstance() -> StatusBarNotification
    {
        struct Shared {
            static let instance = StatusBarNotification()
        }
        return Shared.instance
    }
    
    // -------------------------------- Class methods ---------------------------------------- //

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
    
    // ---------------------------------- Implementation ------------------------------------ //
    
    init()
    {
//        setupDefaultStyles()
//        
//        // register for orientation changes
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("willChangeStatusBarFrame:"),
//            name:UIApplicationWillChangeStatusBarFrameNotification, object:nil)
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // getter
    var overlayWindow:UIWindow {
    get {
        
    }
    }
    
    var progressView:UIView {
    get {
        return UIView(frame:CGRectZero)
    }
    }
    
    var topBar:StatusBarView {
    get {
        
    }
    }
    
    
    // Custom styles
    func setupDefaultStyles()
    {
        defaultStyle = StatusBarStyle.statusBarStyleForPreset(.Default)
        userStyles = Dictionary<String,StatusBarStyle>()
        for styleName in StatusBarStyle.allDefaultBarStyles() {
            userStyles[styleName.toRaw()] = StatusBarStyle.statusBarStyleForPreset(styleName)
        }
    }
    
    func addStyleNamed(identifier:String, prepare:(style:StatusBarStyle) -> StatusBarStyle) -> String
    {
        userStyles[identifier] = prepare(style:defaultStyle)
        return identifier;
    }

}


