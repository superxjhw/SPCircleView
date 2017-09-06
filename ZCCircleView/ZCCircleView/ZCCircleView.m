//
//  ZCCircleView.m
//  test
//
//  Created by YJTSuper on 2017/8/22.
//  Copyright © 2017年 YJTSuper. All rights reserved.
//

#import "ZCCircleView.h"

@interface ZCCircleView ()

@property (nonatomic, weak) UIButton *centerButton;
@property (nonatomic, assign) CGFloat radiusMax;
@property (nonatomic, assign) CGFloat radiusMin;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, copy) void(^buttonAciton)(UIButton *button);

@end

@implementation ZCCircleView

CGPoint center;

/**
 Description
 
 @param centerPoint 中心点
 @param radiusMax 半径
 @param radiusMin 周围按钮半径
 @param number 周围按钮个数
 @param buttonAciton 周围按钮点击事件
 @param duration 动画时间
 @param rotation 是否旋转
 @return ZCCircleView
 */
- (instancetype)initWithCenterPoint:(CGPoint)centerPoint radius:(CGFloat)radiusMax childCilcleRadius:(CGFloat)radiusMin number:(NSInteger)number circleButtonClick:(void(^)(UIButton *button))buttonAciton animationDuration:(CGFloat)duration rotation:(BOOL)rotation {
    
    self = [[ZCCircleView alloc] init];
    self.radiusMax = radiusMax;
    self.radiusMin = radiusMin;
    self.count = number;
    self.buttonAciton = buttonAciton;
    self.duration = duration;
//    self.backgroundColor = [UIColor orangeColor];
    self.bounds = CGRectMake(0, 0, (radiusMax + radiusMin) * 2, (radiusMax + radiusMin) * 2);
    self.center = centerPoint;
    center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    UIButton *centerButton = [self createCircleButton];
    [centerButton addTarget:self action:@selector(centerButtonClick:) forControlEvents:UIControlEventTouchDown];
    centerButton.center = center;
    [self addSubview:centerButton];
    self.centerButton = centerButton;
    self.centerButton.selected = NO;
    
    if (rotation) {
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(makeRotation)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    
    return self;
}

- (void)centerButtonClick:(UIButton *)centerButton {
    
    self.centerButton.selected = !self.centerButton.selected;
    if (self.centerButton.selected) {
        [self addButton:self.count];
    }else {
        [self removeButton];
    }
}

- (void)addButton:(NSInteger) count {
    for (NSInteger i = 0; i < count; i ++) {
        UIButton *btn = [self createCircleButton];
        btn.center = center;
        btn.tag = i;
        [btn setTitle:[NSString stringWithFormat:@"No.%zd",i] forState:UIControlStateNormal];
        if (self.titleArray && i < self.titleArray.count) {
            [btn setTitle:[NSString stringWithFormat:@"%@",self.titleArray[i]] forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        [UIView animateWithDuration:self.duration animations:^{
            btn.center = CGPointMake(self.radiusMax * sinf(M_PI * 2/count * i) + self.radiusMax + self.radiusMin, self.radiusMax  * cosf(M_PI * 2/count * i) + self.radiusMax + self.radiusMin);
        }];
        [self addSubview:btn];
    }
    
}

- (void)removeButton {
    
    [self addSubview:self.centerButton];
    for (UIButton *button in self.subviews) {
        if (button != self.centerButton) {
            [UIView animateWithDuration:self.duration animations:^{
                button.center = center;
            } completion:^(BOOL finished) {
                [button removeFromSuperview];
                self.layer.transform = CATransform3DIdentity;
                self.centerButton.layer.transform = CATransform3DIdentity;
            }];
        }
    }
    
    
}

- (UIButton *)createCircleButton {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = self.radiusMin;
    btn.bounds = CGRectMake(0, 0, self.radiusMin * 2, self.radiusMin * 2);
    
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    [btn setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
    
    return btn;
}

- (void)buttonAction:(UIButton *)button {
    if (self.buttonAciton) {
        self.buttonAciton(button);
    }
}

- (void)makeRotation {
    
    if (self.centerButton.selected) {
        self.layer.transform = CATransform3DRotate(self.layer.transform, M_PI / 180 / 5, 0, 0, 1);
        for (UIButton *subButton in self.subviews) {
            subButton.layer.transform = CATransform3DRotate(subButton.layer.transform, -M_PI / 180 / 5, 0, 0, 1);
        }
    }
}


@end
