//
//  ViewController.m
//  SPCircleView
//
//  Created by YJTSuper on 2017/12/27.
//  Copyright © 2017年 YJTSuper. All rights reserved.
//

#import "ViewController.h"
#import "SPViewController.h"
#import "SPCircleView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableDictionary *dataSouceDict;

@end

@implementation ViewController

- (NSMutableDictionary *)dataSouceDict {
    if (_dataSouceDict == nil) {
        NSMutableDictionary *dataSouceDict = [NSMutableDictionary dictionary];
        dataSouceDict[@"CNBlog"] = @"http://www.cnblogs.com/chao8888/";
        dataSouceDict[@"GitHub"] = @"https://github.com/USimpleLife";
        dataSouceDict[@"OSChina"] = @"https://gitee.com/HaiShengHuo";
        dataSouceDict[@"GitGUI"] = @"https://git-scm.com/download/gui/mac";
        dataSouceDict[@"Apple"] = @"https://www.apple.com/cn/";
        dataSouceDict[@"JianShu"] = @"https://www.jianshu.com/u/eb2a1c435ff3";
        _dataSouceDict = dataSouceDict;
    }
    
    return _dataSouceDict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SPCircleView";
    [self initCircleView];
    
}

- (void)initCircleView {
    
    SPCircleView *circleView = [[SPCircleView alloc] initWithCenterPoint:self.view.center radius:100 childCilcleRadius:33 number:6 circleButtonClick:^(UIButton *button) {

        [self pushDetail:button.titleLabel.text];
        
    } animationDuration:0.3 rotation:YES];
    circleView.titleArray = self.dataSouceDict.allKeys;
    [circleView.centerButton setTitle:@"On" forState:UIControlStateNormal];
    [circleView.centerButton setTitle:@"Off" forState:UIControlStateSelected];
    [self.view addSubview:circleView];
}

- (void)pushDetail:(NSString *)title {
    
    SPViewController *detailVC = [[SPViewController alloc] init];
    detailVC.title = title;
    detailVC.openUrlString = self.dataSouceDict[title];
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end
