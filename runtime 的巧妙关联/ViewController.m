//
//  ViewController.m
//  runtime 的巧妙关联
//
//  Created by Apple on 16/9/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIalertBlock.h"
#import "Model.h"

@interface ViewController ()

@end

@implementation ViewController







- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton *button = [[UIButton  alloc]initWithFrame:CGRectMake(50, 200, 50, 50)];
    button.backgroundColor = [UIColor yellowColor];
    
    
    
    [self.view addSubview:button];
    [button addTarget:self action:@selector(doit) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UIButton *button1 = [[UIButton  alloc]initWithFrame:CGRectMake(120, 200, 50, 50)];
    button1.backgroundColor = [UIColor redColor];
    
    
    
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(doitsection) forControlEvents:UIControlEventTouchUpInside];
    
    

    NSArray *array = @[@"1",@"3",@2,@9.5,@"1.2"];
    NSNumber *sum = [array valueForKeyPath:@"@sum.floatValue"];
    NSNumber *avg = [array valueForKeyPath:@"@avg.floatValue"];
    NSNumber *max = [array valueForKeyPath:@"@max.floatValue"];
    NSNumber *min = [array valueForKeyPath:@"@min.floatValue"];
    
//    NSLog(@"sum:%@",sum);
//    NSLog(@"avg:%@",avg);
//    NSLog(@"max:%@",max);
//    NSLog(@"min:%@",min);
//    
    
    NSArray *array1 = @[@"name", @"w", @"aa", @"zxp", @"aa"];
    //返回的是一个新的数组
    NSArray *newArray1 = [array valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"%@", newArray1);

}

-(void)doit{
    
   UIalertBlock  *alertView = [[UIalertBlock alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
   
    
    
    [alertView show];
    [alertView zxp_clickedButtonAtIndexWithBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"dfvbghjuk");
    }];
    
    
    
}



-(void)doitsection{
    UIalertBlock *alertView = [[UIalertBlock alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.tag = 2000;
    [alertView show];
    
    [alertView zxp_clickedButtonAtIndexWithBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"1234668");
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
