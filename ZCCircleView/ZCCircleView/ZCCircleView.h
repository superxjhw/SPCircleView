//
//  ZCCircleView.h
//  test
//
//  Created by YJTSuper on 2017/8/22.
//  Copyright © 2017年 YJTSuper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCCircleView : UIView

- (instancetype)initWithCenterPoint:(CGPoint)centerPoint radius:(CGFloat)radiusMax childCilcleRadius:(CGFloat)radiusMin number:(NSInteger)number circleButtonClick:(void(^)(UIButton *button))buttonAciton animationDuration:(CGFloat)duration addTimer:(BOOL)addTimer;

@property (nonatomic, copy) NSArray *titleArray;

@end
