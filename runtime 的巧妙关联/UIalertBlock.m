//
//  UIalertBlock.m
//  runtime 的巧妙关联
//
//  Created by Apple on 16/9/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIalertBlock.h"


#import <objc/runtime.h>


static const char *ZXPDelegateKey = "!ZXPDelegateKey!";


@interface UIalertBlock ()
{
    //block变量
    void(^_block)();
    
    
    void (^blockButton)();
    
    
    
}


//初始化的时候传入一个block
- (instancetype)initWithBlock:(void(^)())block;


@end


/*
 
 
 
 
 
 第一步: 创建一个alertview 的category, 并提供与delegate方法一样操作方式的apis
 
 第二步: 在category内部把delegate交给其他class来管理并把block也传递给delegate管理的class
 
 第三步: 管理delegate的class调用block即可
 
 
 
 
 */





@implementation UIalertBlock


-(instancetype)initWithBlock:(void (^)())block{
    self = [super
            init];
    if (self) {
        objc_setAssociatedObject(self, ZXPDelegateKey, self,  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        _block = block;
        
       
    }
    return self;
}




// alertview 点击执行的delegate方法,前提 需要self实现UIAlertViewDelegate协议
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    if (_block) {
        //执行block
        _block(alertView,buttonIndex);
    }
    
    
    
    
    
    
}
- (void)zxp_clickedButtonAtIndexWithBlock:(void(^)(UIAlertView *alertView,NSInteger buttonIndex))block {
    //获取delegate对象
    id delegate = objc_getAssociatedObject([[UIalertBlock alloc] initWithBlock:block], ZXPDelegateKey);
    //设置delegate为其他对象
    self.delegate = delegate;
    
}









@end
