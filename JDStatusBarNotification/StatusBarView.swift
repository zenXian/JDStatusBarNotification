//
//  StatusBarView.swift
//  JDStatusBarNotificationExample
//
//  Created by Markus on 04.06.14.
//  Copyright (c) 2014 Markus. All rights reserved.
//

import Foundation
import UIKit


class JDStatusBarView : UIView {
    
    var textLabel :UILabel
    var activityIndicatorView :UIActivityIndicatorView
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
        addLabel()
        addActivityIndicator()
        textVerticalPositionAdjustment = 0.0;
    }

    func addLabel() {
        textLabel = UILabel()
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.baselineAdjustment = .AlignCenters
        textLabel.textAlignment = .Center
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.clipsToBounds = true
        addSubview(textLabel);
    }
    
    func addActivityIndicator() {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .White)
        activityIndicatorView.transform = CGAffineTransformMakeScale(0.7, 0.7)
        activityIndicatorView.hidesWhenStopped = true
        addSubview(activityIndicatorView)
    }
    
    var textVerticalPositionAdjustment :CGFloat {
    didSet{ self.setNeedsLayout() }
    }
    
    override func layoutSubviews() {
        
        // label
        self.textLabel.frame = CGRectMake(0, 1+self.textVerticalPositionAdjustment,
            self.bounds.size.width, self.bounds.size.height-1);
        
        // activity indicator
        if !activityIndicatorView.hidden {
            var textSize = currentTextSize()
            var indicatorFrame = activityIndicatorView.frame
//            var availableSpaceHalf :Float = (self.bounds.size.width - textSize.width)/2.0
//            indicatorFrame.origin.x = round(availableSpaceHalf - indicatorFrame.size.width - 8.0
//            indicatorFrame.origin.y = ceil((1+(self.bounds.size.height - indicatorFrame.size.height)/2.0))
//            activityIndicatorView.frame = indicatorFrame
        }
    }
    
    func currentTextSize() -> CGSize {
        var textSize = CGSizeZero
        var attributes = [NSFontAttributeName:self.textLabel.font]
        textSize = getboun
        String
        return textSize;
    }
}
