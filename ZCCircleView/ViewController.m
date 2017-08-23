//
//  ViewController.m
//  ZCCircleView
//
//  Created by YJTSuper on 2017/8/22.
//  Copyright © 2017年 YJTSuper. All rights reserved.
//

#import "ViewController.h"
#import "ZCCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(160, 500, 60, 30)];
//    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    
    ZCCircleView *circleView = [[ZCCircleView alloc] initWithCenterPoint:CGPointMake(200, 300) radius:100 childCilcleRadius:30 number:6 circleButtonClick:^(UIButton *button) {
        label.text = [NSString stringWithFormat:@"%zd.%@",button.tag,button.titleLabel.text];
    } animationDuration:1 rotation:YES];
    circleView.titleArray = @[@"主题",@"心情",@"推荐",@"曲风",@"场景",@"人群"];
    [self.view addSubview:circleView];
    
    
    
}


@end
