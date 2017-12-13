//
//  HTabBarController.h
//  AlipayDemo
//
//  Created by shuai pan on 2017/5/8.
//  Copyright © 2017年 foreveross. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTabBar.h"
@interface HTabBarController : UITabBarController

/** tabBar高度：
 *  default 44.f;
 *  min 44.f
 *  max 55.f
 */
@property (nonatomic ,assign) CGFloat barItemHeight;

//资源配置文件
@property (nonatomic ,strong) NSString *sourceFile;
@property (nonatomic ,strong) HTTabBar *htTabBar;



@property (nonatomic ,assign) BOOL hiddenHtTabBar;

/** 添加视图控制器
 *  controllers：视图控制器
 *  navigator： 是否添加导航器
 */
- (void)addViewControllers:(NSArray *)controllers navigator:(BOOL)navigator ;
/** 添加视图控制器
 *  classNames：类名
 *  navigator： 是否添加导航器
 */
- (void)addViewControllerClasses:(NSArray *)classNames navigator:(BOOL)navigator;


@end
