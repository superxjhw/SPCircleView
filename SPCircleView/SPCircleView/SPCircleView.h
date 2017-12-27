//
//  SPCircleView.h
//  test
//
//  Created by YJTSuper on 2017/8/22.
//  Copyright © 2017年 YJTSuper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPCircleView : UIView

/**
 Description
 
 @param centerPoint 中心点
 @param radiusMax 半径
 @param radiusMin 周围按钮半径
 @param number 周围按钮个数
 @param buttonAciton 周围按钮点击事件
 @param duration 动画时间
 @param rotation 是否旋转
 @return SPCircleView
 */

- (instancetype)initWithCenterPoint:(CGPoint)centerPoint radius:(CGFloat)radiusMax childCilcleRadius:(CGFloat)radiusMin number:(NSInteger)number circleButtonClick:(void(^)(UIButton *button))buttonAciton animationDuration:(CGFloat)duration rotation:(BOOL)rotation;


/**
 周围title titleArray.count = number;
 */
@property (nonatomic, copy) NSArray *titleArray;


/**
 中间按钮
 */
@property (nonatomic, weak) UIButton *centerButton;


@end
