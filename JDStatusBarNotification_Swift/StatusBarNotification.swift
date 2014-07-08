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
    
    
    // ---------------------------------- Singleton ------------------------------------------ //
    
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
        dismissAnimated(true)
    }
    
    class func dismissAnimated(animated:Bool)
    {
        sharedInstance().dismissAnimated(true)
    }
    
    class func dismissAfter(delay:NSTimeInterval)
    {
        sharedInstance().setDismissTimer(interval:delay)
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
        defaultStyle = StatusBarStyle.statusBarStyleForPreset(.Default)
        activeStyle = defaultStyle
        
        userStyles = Dictionary<String,StatusBarStyle>()
        for styleName in StatusBarStyle.allDefaultBarStyles() {
            userStyles[styleName.toRaw()] = StatusBarStyle.statusBarStyleForPreset(styleName)
        }
        
        // register for orientation changes
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"willChangeStatusBarFrame:",
            name:UIApplicationWillChangeStatusBarFrameNotification, object:nil)
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // dismissing
    func setDismissTimer(interval:NSTimeInterval)
    {
        let fireDate = NSDate(timeIntervalSinceNow:interval)
        
        dismissTimer?.invalidate()
        dismissTimer = NSTimer(fireDate:fireDate, interval:0, target:self, selector:"dismiss:", userInfo:nil, repeats:false)
        NSRunLoop.currentRunLoop().addTimer(dismissTimer, forMode: NSRunLoopCommonModes)
    }
    
    func dismiss(timer:NSTimer)
    {
        dismissAnimated(true)
    }
    
    func dismissAnimated(animated:Bool)
    {
        dismissTimer?.invalidate()
        dismissTimer = nil
    
        // check animation type
        let animationsEnabled = (activeStyle.animationType != .None)
        animated = animated && animationsEnabled

//        // animate out
//        [UIView animateWithDuration:animated ? 0.4 : 0.0 animations:^{
//        if (self.activeStyle.animationType == JDStatusBarAnimationTypeFade) {
//        self.topBar.alpha = 0.0;
//        } else {
//        self.topBar.transform = CGAffineTransformMakeTranslation(0, -self.topBar.frame.size.height);
//        }
//        } completion:^(BOOL finished) {
//        [self.overlayWindow removeFromSuperview];
//        [self.overlayWindow setHidden:YES];
//        _overlayWindow.rootViewController = nil;
//        _overlayWindow = nil;
//        _progressView = nil;
//        _topBar = nil;
//        }];
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
    
    func addStyleNamed(identifier:String, prepare:(style:StatusBarStyle) -> StatusBarStyle) -> String
    {
        userStyles[identifier] = prepare(style:defaultStyle)
        return identifier;
    }
    
    func willChangeStatusBarFrame(notification:NSNotification)
    {
        let barFrameValue:NSValue = notification.userInfo[UIApplicationStatusBarFrameUserInfoKey] as NSValue
        UIView.animateWithDuration(0.5) {
            updateWindowTransform()
            updateTopBarFrameWithStatusBarFrame(barFrameValue.CGRectValue)
            
            // update progress with current value
            let progress = self.progress;
            self.progress = progress;
        }
    }

}


