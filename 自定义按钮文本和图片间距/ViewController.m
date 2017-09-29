//
//  ViewController.m
//  自定义按钮文本和图片间距
//
//  Created by 梁森 on 2017/9/29.
//  Copyright © 2017年 梁森. All rights reserved.
//

#import "ViewController.h"
#import "FL_Button.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *statusAry = @[@(FLAlignmentStatusNormal), @(FLAlignmentStatusImageLeft), @(FLAlignmentStatusLeft), @(FLAlignmentStatusCenter), @(FLAlignmentStatusRight), @(FLAlignmentStatusTop), @(FLAlignmentStatusBottom)];
    FL_Button *button1 = [FL_Button buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"哇哈哈" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"buy"] forState:UIControlStateNormal];
    button1.status = [statusAry[5] floatValue];
    button1.fl_padding = 10;
    
    [self.view addSubview:button1];
    button1.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    button1.backgroundColor = [UIColor redColor];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
