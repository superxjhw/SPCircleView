# ZCCircleView
A custom animation

### How to use

```objc

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(160, 500, 60, 30)];
    [self.view addSubview:label];

    /**
    Description

    @param centerPoint 中心点
    @param radiusMax 半径
    @param radiusMin 周围按钮半径
    @param number 周围按钮个数
    @param buttonAciton 周围按钮点击事件
    @param duration 动画时间
    @param addTimer 是否添加定时器(添加后自动旋转)
    @return ZCCircleView
    */

    ZCCircleView *circleView = [[ZCCircleView alloc] initWithCenterPoint:CGPointMake(200, 300) radius:100 childCilcleRadius:30 number:6 circleButtonClick:^(UIButton *button) {
    label.text = [NSString stringWithFormat:@"%zd.%@",button.tag,button.titleLabel.text];
    } animationDuration:1 addTimer:YES];
    circleView.titleArray = @[@"主题",@"心情",@"推荐",@"曲风",@"场景",@"人群"];
    [self.view addSubview:circleView];

}


```
![(下拉刷新03-隐藏时间)](http://images2017.cnblogs.com/blog/912458/201708/912458-20170822155054933-302168319.gif)
