//
//  HTabBarController.m
//  AlipayDemo
//
//  Created by shuai pan on 2017/5/8.
//  Copyright © 2017年 foreveross. All rights reserved.
//

#import "HTabBarController.h"

#define SCREEN_H CGRectGetHeight([UIScreen mainScreen].bounds)
#define SCREEN_W CGRectGetWidth([UIScreen mainScreen].bounds)

#define MinTabBarHeight 44.f
#define MaxTabBarHeight 55.f
@interface HTabBarController () <HTTabBarDelegate>

@property (nonatomic ,strong) NSMutableArray *dataArray;
@end

@implementation HTabBarController


- (void)addViewControllerClasses:(NSArray *)classNames navigator:(BOOL)navigator {
    
    if (self.htTabBar.itemsArray.count != classNames.count) return;
    
    NSMutableArray *navigationControllers = [NSMutableArray arrayWithCapacity:2];
    for (NSString  *classSting in classNames) {
        UIViewController *vc = (UIViewController *)[[NSClassFromString(classSting) alloc] init];
        if (navigator) {
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [navigationControllers addObject:nav];
        }else {
            [navigationControllers addObject:vc];
        }
    }
    self.viewControllers = navigationControllers;
}
- (void)addViewControllers:(NSArray *)controllers navigator:(BOOL)navigator {

    if (self.htTabBar.itemsArray.count != controllers.count) return;
    
    NSMutableArray *navigationControllers = [NSMutableArray arrayWithCapacity:2];
    for (UIViewController *vc in controllers) {
        if (navigator) {
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [navigationControllers addObject:nav];
        }else {
            [navigationControllers addObjectsFromArray:controllers];
        }
    }
    
    self.viewControllers = navigationControllers;
}
- (void)setHiddenHtTabBar:(BOOL)hiddenHtTabBar{
    _hiddenHtTabBar = hiddenHtTabBar;
    self.htTabBar.hidden = _hiddenHtTabBar;
}
- (void)setSourceFile:(NSString *)sourceFile {
    _sourceFile = sourceFile;
    [self.htTabBar loadBundleSourceFile:_sourceFile];
}

#pragma mark - Private Mothed
- (instancetype)initWithTabBarItemHeight:(CGFloat)barItemHeight{
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    [self.view addSubview:self.htTabBar];
    self.htTabBar.delegate = self;
    self.barItemHeight = MinTabBarHeight;
}

//
- (void)setBarItemHeight:(CGFloat)barItemHeight {

    if (barItemHeight > MaxTabBarHeight) {
        _barItemHeight = MaxTabBarHeight;
    } else if (barItemHeight < MinTabBarHeight) {
        _barItemHeight = MinTabBarHeight;
    }
    else {
        _barItemHeight = barItemHeight;
    }
}
//
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    self.htTabBar.selectIndex = selectedIndex;
}

#pragma mark - HTTabBarDelegate
- (void)htTabBar:(HTTabBar *)htTabBar selectIndex:(NSInteger)index {
    self.selectedIndex = index;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.htTabBar.frame = CGRectMake(0, SCREEN_H - self.barItemHeight, SCREEN_W, self.barItemHeight);
}

- (HTTabBar *)htTabBar {
    if (!_htTabBar) {
        _htTabBar = [[HTTabBar alloc] initWithFrame:CGRectZero];
    }
    return _htTabBar;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
