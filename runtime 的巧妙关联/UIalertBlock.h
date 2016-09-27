//
//  UIalertBlock.h
//  runtime 的巧妙关联
//
//  Created by Apple on 16/9/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIalertBlock : UIAlertView




- (void)zxp_clickedButtonAtIndexWithBlock:(void(^)(UIAlertView *alertView,NSInteger buttonIndex))block;



-(void)clickButtonWithBlock:(void(^)(UIAlertView *alertView,NSInteger button))blockButton;



@end
