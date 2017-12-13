//
//  BSLTabBar.h
//  AlipayDemo
//
//  Created by shuai pan on 2017/4/25.
//  Copyright © 2017年 foreveross. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HTBarModel;
@class HTTabBar;
@protocol HTTabBarDelegate <NSObject>

@required

- (void)htTabBar:(HTTabBar *)htTabBar selectIndex:(NSInteger)index;

@end



@interface HTTabBar : UIView

@property (nonatomic ,strong) NSMutableArray *itemsArray;

@property (nonatomic ,assign) NSInteger selectIndex;
@property (nonatomic ,assign) id <HTTabBarDelegate> delegate;



- (void)loadBundleSourceFile:(NSString *)sourceFile;

@end







@interface HTTabBarItem : UIView



@property (nonatomic ,strong) HTBarModel *barModel;


@property (nonatomic ,assign) BOOL selected;
@property (nonatomic ,assign) NSInteger index;


- (void)tabBarItemSelected:(NSArray *)tabBarItems selectCallBack:(void(^)(void))selectBlock;

@end
